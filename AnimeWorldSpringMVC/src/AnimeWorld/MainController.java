package AnimeWorld;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Controller
public class MainController {

	@Autowired
	private MainDao Dao;
	
	
	
	@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
	public String adminLogin(@ModelAttribute("am") AdminModel am, HttpSession session){
		java.util.List<AdminModel> list = Dao.AdminLogin(am);
		if(list!=null){
			session.setAttribute("sesadmin", "success");
			session.setAttribute("admin", "on");
		return "redirect:/product";
		}else {
			session.setAttribute("sesadmin", "failed");
			return "AdminLogin";
		}
	}
	
	@RequestMapping("/product")
	public String product(Model model){
		
		List<ProductModel> list=Dao.product();
		model.addAttribute("list",list);
		return "AdminDashbord";
	}
	
	@RequestMapping("/admin")
	public String admin(HttpSession session){
		session.invalidate();
		return "AdminLogin";
	}
	
	@RequestMapping("/AddNewProduct")
	public String AddNewProduct(){
		return "AddNewProduct";
	}
	
	@RequestMapping(value="/addproduct",method=RequestMethod.POST)
	public String addproduct(@ModelAttribute("pm") ProductModel pm, HttpSession session){
		
		Dao.upload(pm);
		int status = Dao.AddProduct(pm);
		session.setAttribute("sesNewPro", "success");
		return "AddNewProduct";
	}
	
	@RequestMapping("/delete/{id}")
	public String addproduct(@PathVariable int id, HttpSession session){
		
		int status = Dao.DeleteProduct(id);
		session.setAttribute("sesDelPro", "success");
		return "redirect:/product";
	}
	
	@RequestMapping("/edit/{id}")
	public String getProductById(@PathVariable int id, Model model){
		
		List<ProductModel> list=Dao.getProductById(id);
		model.addAttribute("list",list);
		return "EditProduct";
	}
	
	@RequestMapping(value="/editproduct",method=RequestMethod.POST)
	public String editproduct(@ModelAttribute("pm") ProductModel pm, HttpSession session){
		
		
		int status = Dao.EditProduct(pm);
		session.setAttribute("sesEditPro", "success");
		return "redirect:/product";
	}
	
	@RequestMapping("/OrderStatus")
	public String OrderStatus(){
		return "redirect:/order";
	}
	
	@RequestMapping("/order")
	public String order(Model model){
		
		List<BuyModel> list=Dao.order();
		model.addAttribute("list",list);
		return "OrderStatus";
	}
	
	@RequestMapping("/status/{id}/{newstatus}")
	public String editStatus(@PathVariable int id,@PathVariable() String newstatus,HttpSession session){
		
		Dao.editStatus(id,newstatus);
		session.setAttribute("sesStatus", "success");
		return "redirect:/order";
	}
	
	
	//User
	
	@RequestMapping(value="/userlogin",method=RequestMethod.POST)
	public String userlogin(@ModelAttribute("rm") RegModel rm, HttpSession session){
		java.util.List<RegModel> list = Dao.userlogin(rm);
		if(list!=null){
			int id=0;
			for (RegModel regModel : list) {
				id =regModel.getUser_id();
			}
			session.setAttribute("user", "on");
			session.setAttribute("sesuser", id);
		return "redirect:/product2";
		}else {
			session.setAttribute("sesuser", "failed");
			return "UserLogin";
		}
	}
	
	@RequestMapping("/userlogin")
	public String userlogin(){
		return "UserLogin";
	}
	
	
	@RequestMapping("/user")
	public String user(HttpSession session){
		session.invalidate();
		return "redirect:/product2";
	}
	
	@RequestMapping("/product2")
	public String product2(Model model){

		List<ProductModel> list=Dao.product();
		model.addAttribute("list",list);
		return "UserDashbord";
	}
	
	@RequestMapping("/Order/{id}")
	public String orderUser(@PathVariable int id,Model model){
		List<BuyModel> list=Dao.orderByEmail(id);
		model.addAttribute("list",list);
		return "Order";
	}
	
	@RequestMapping("view/{OId}")
	public String viewOrder(@PathVariable int OId,Model model,HttpSession session){
		List<ProductModel> list=Dao.viewOrder(OId);
		model.addAttribute("list",list);
		
		String user = (String)session.getAttribute("user");
		if(user=="on"){
			return "ViewOrder";
		}
		else {
			return "OrderView";
		}
		
	}
	
	@RequestMapping("cancel/{OId}")
	public String cancelOrder(@PathVariable String OId,HttpSession session){
		int status=Dao.cancelOrder(OId);
		session.setAttribute("sesorder", "success");
		int id = (int)session.getAttribute("sesuser");
		return "redirect:/Order/"+id+"";
	}
	
	@RequestMapping("ProductInfo/{PId}/{qty}")
	public String ProductInfo(@PathVariable int PId,@PathVariable int qty,Model model){
		List<ProductModel> list=Dao.getProductById(PId,qty);
		model.addAttribute("list",list);
		return "ProductInfo";
	}
	
	
	@RequestMapping("AddCart/{PId}/{qty}")
	public String AddCart(@PathVariable int PId,@PathVariable int qty,HttpSession session){
		
		int user = (int)session.getAttribute("sesuser");
		
		int status = Dao.addCart(user,PId,qty);
		session.setAttribute("sesCart", "success");
		return "redirect:/ProductInfo/"+PId+"/1";
	}
	
	@RequestMapping("Buy/{PId}/{qty}")
	public String buy(@PathVariable String PId,@PathVariable String qty,HttpSession session){
		
		session.setAttribute("PId", PId);
		session.setAttribute("Qty", qty);
		
		return "Address";
	}
	
	
	@RequestMapping(value="/address",method=RequestMethod.POST)
	public String address(@ModelAttribute("bm") BuyModel bm,HttpSession session,Model model){
		int id =  (int)session.getAttribute("sesuser");
		String PId =  (String)session.getAttribute("PId");
		String Qty =  (String)session.getAttribute("Qty");
		
		int bill=0;
         String cart = (String)session.getAttribute("cart");
         
         if(cart=="on"){
        	 List<ProductModel> list = Dao.GetCart(id);
        	 model.addAttribute("list",list);
        	 bill = (int)session.getAttribute("bill");
        	 bm.setBill(bill);
        	
        	 
         }else {
        	 
        	 List<ProductModel> list=Dao.getProductById(Integer.parseInt(PId));
		
			for (ProductModel productModel : list) {
				bill =Integer.parseInt(Qty)*productModel.getPrice();
			}
			model.addAttribute("list",list);
			bm.setBill(bill);
			session.setAttribute("bill", bill);
         }
		
		bm.setUser_id(id);
		bm.setProduct_id(PId);
		bm.setQuentity(Qty);
		
		
		model.addAttribute("bm", bm);
		 Random rnd = new Random();
			int order_id =rnd.nextInt(999999);
			
			bm.setOrder_id(order_id);
		
		 
         session.setAttribute("bm",bm);
		
		
		return "Payment";
	}
	
	
	@RequestMapping("/payment")
	public String payment(HttpSession session,Model model){
		
		BuyModel bm = (BuyModel)session.getAttribute("bm");
//		
		session.setAttribute("sesBuy", "success");
		String PId =  (String)session.getAttribute("PId");
		
		
		String cart = (String)session.getAttribute("cart");
		if(cart=="on"){
			int id =  (int)session.getAttribute("sesuser");
			List<ProductModel> list = Dao.GetCart(id);
			
			for (ProductModel productModel : list) {
				bm.setQuentity(Integer.toString(productModel.getQuentity()));
				bm.setProduct_id(Integer.toString(productModel.getPro_id()));
				int status = Dao.buy(bm);
			}
			session.setAttribute("cart",null);
			return "redirect:/cart";
		}
		else {
			session.setAttribute("sesBuy", "success");
			bm.setQuentity((String)session.getAttribute("Qty"));
			bm.setProduct_id((String)session.getAttribute("PId"));
			int status = Dao.buy(bm);
			
			return "redirect:/ProductInfo/"+PId+"/1";
		}
		
		
	}
	
	@RequestMapping("/cart")
	public String cart(Model model,HttpSession session){
		int id =  (int)session.getAttribute("sesuser");
		int bill=0;
		List<ProductModel> list = Dao.GetCart(id);
		
		for (ProductModel productModel : list) {
			bill = bill + productModel.getPrice() * productModel.getQuentity();
		}
		
		session.setAttribute("bill", bill);
		BuyModel bm = new BuyModel();
		bm.setBill(bill);
		
		model.addAttribute("bm", bm);
		model.addAttribute("list", list);
		return "Cart";
	}

	
	@RequestMapping("Remove/{pro_id}/{quentity}")
	public String remove(@PathVariable() int pro_id,@PathVariable() int quentity,HttpSession session){
		int id =  (int)session.getAttribute("sesuser");
		
		int Status = Dao.RemoveCart(pro_id,quentity,id);
		session.setAttribute("sesRemoveCart", "success");
		return "redirect:/cart";
	}
	
	@RequestMapping("/Buy2")
	public String buy2(HttpSession session){
		
		session.setAttribute("cart", "on");
		
		return "Address";
	}
	
	
	@RequestMapping("/ForgetPassword")
	public String ForgetPassword(){
		return "ForgetPassword";
	}
	
	@RequestMapping(value="/sendotp",method=RequestMethod.POST)
	public String sendotp(@RequestParam("email") String email,HttpSession session) {
		
		List<RegModel> list = Dao.CheckEmail(email);
		if(list!=null){
			Random r = new Random();
			int otp =r.nextInt(10000);
			Dao.sendOtp(email,otp);
			session.setAttribute("email", email);
			session.setAttribute("otp", otp);
			return "otp";
		}else {
			session.setAttribute("sesemail", "failed");
			return "ForgetPassword";
		}
		
		
	}
	
	@RequestMapping(value="/CheckOtp",method=RequestMethod.POST)
	public String otp(@RequestParam("otp") String otp,HttpSession session)
	{
		int otp1 = (int)session.getAttribute("otp");
		int otp2 = Integer.parseInt(otp);
		if(otp1==otp2){
			String email = (String)session.getAttribute("email");
			String password = Dao.getpassword(email);
			Dao.sendPassword(email,password);
			return "UserLogin";
		}else {
			session.setAttribute("sesotp", "failed");
			return "otp";
		}
	}
	
	
	@RequestMapping("/registration")
	public String registration(){
		return "Registration";
	}
	
	@RequestMapping("/save")
	public String Save(@ModelAttribute("rm") RegModel rm,HttpSession session){
		
		List<RegModel> list = Dao.DuplicateEmail(rm.getEmail());
		if(list!=null){
			session.setAttribute("Email", "duplicate");
			return "Registration";
		}else {
			
			Random r = new Random();
			int otp =r.nextInt(10000);
			session.setAttribute("rm", rm);
			session.setAttribute("otp", otp);
			Dao.sendOtp(rm.getEmail(),otp);
			
			return "RegOtp";
		}
		
	}
	
	@RequestMapping(value="/CheckOtpReg",method=RequestMethod.POST)
	public String CheckOtpReg(@RequestParam("otp") String otp,HttpSession session)
	{
		int otp1 = (int)session.getAttribute("otp");
		int otp2 = Integer.parseInt(otp);
		if(otp1==otp2){
			RegModel rm = (RegModel)session.getAttribute("rm");
			Dao.Save(rm);
			return "UserLogin";
		}else {
			session.setAttribute("sesotp", "failed");
			return "RegOtp";
		}
	}
	
}
