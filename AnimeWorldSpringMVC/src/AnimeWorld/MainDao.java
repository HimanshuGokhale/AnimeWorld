package AnimeWorld;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MainDao {
	
	private JdbcTemplate jdbcTemplate;
	private MailSender mailSender;

	public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<AdminModel> AdminLogin(AdminModel am) {
		// TODO Auto-generated method stub
		String sql = "select * from admin_log where username='"+am.getUsername()+"' and password='"+am.getPassword()+"'";
		List<AdminModel> list = jdbcTemplate.query(sql, new RowMapper<AdminModel>(){

			@Override
			public AdminModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				AdminModel am2 = new AdminModel();
				am2.setEmail(rs.getString("email"));
				am2.setPassword(rs.getString("password"));
				return am2;
			}});
		List<AdminModel> list2 = list.size()>0?list:null;
		return list2;
	}

	public List<ProductModel> product() {
		// TODO Auto-generated method stub
		String sql = "select * from product";
		return jdbcTemplate.query(sql, new RowMapper<ProductModel>(){

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setPro_id(rs.getInt("pro_id"));
				pm.setName(rs.getString("name"));
				pm.setDecription(rs.getString("decription"));
				pm.setAnime(rs.getString("anime"));
				pm.setCategory(rs.getString("category"));
				pm.setStock(rs.getInt("stock"));
				pm.setPrice(rs.getInt("price"));
				pm.setImage(rs.getString("image"));
				return pm;
			}});
	}

	public int AddProduct(ProductModel pm) {
		// TODO Auto-generated method stub
		
		CommonsMultipartFile file = pm.getFile();
		String filename = file.getOriginalFilename();
		
        String sql="insert into product(name,decription,stock,anime,category,price,image)values('"+pm.getName()+"','"+pm.getDecription()+"','"+pm.getStock()+"','"+pm.getAnime()+"','"+pm.getCategory()+"','"+pm.getPrice()+"','"+filename+"')";
		return jdbcTemplate.update(sql);
	}

	public void upload(ProductModel pm) {
		// TODO Auto-generated method stub
		String filepath="C:\\Users\\SHREE\\workspace\\AnimeWorldSpringMVC\\WebContent\\image";
		CommonsMultipartFile file = pm.getFile();
		String filename = file.getOriginalFilename();
		try{  
		    byte barr[]=file.getBytes();  
		      
		    BufferedOutputStream bout=new BufferedOutputStream(new FileOutputStream(filepath+"\\"+filename));  
		    bout.write(barr);  
		    bout.flush();  
		    bout.close();  
		    }catch(Exception e)
		    {
		    	System.out.println(e);
		    }  
	}

	public int DeleteProduct(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from product where pro_id='"+id+"'";
		return jdbcTemplate.update(sql);
	}

	public List<ProductModel> getProductById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from product where pro_id='"+id+"'";
		return jdbcTemplate.query(sql, new RowMapper<ProductModel>(){

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setPro_id(rs.getInt("pro_id"));
				pm.setName(rs.getString("name"));
				pm.setDecription(rs.getString("decription"));
				pm.setAnime(rs.getString("anime"));
				pm.setCategory(rs.getString("category"));
				pm.setStock(rs.getInt("stock"));
				pm.setPrice(rs.getInt("price"));
				pm.setImage(rs.getString("image"));
				return pm;
			}});
	}

	public int EditProduct(ProductModel pm) {
		// TODO Auto-generated method stub
		
		
		String sql="update product set name='"+pm.getName()+"',decription='"+pm.getDecription()+"',stock='"+pm.getStock()+"',anime='"+pm.getAnime()+"',category='"+pm.getCategory()+"',price='"+pm.getPrice()+"' where pro_id='"+pm.getPro_id()+"'";
		return jdbcTemplate.update(sql);
	}

	public List<BuyModel> order() {
		// TODO Auto-generated method stub
		String sql = "select * from buy group by order_id";
		return jdbcTemplate.query(sql, new RowMapper<BuyModel>(){

			@Override
			public BuyModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				BuyModel bm = new BuyModel();
				bm.setOrder_id(rs.getInt("order_id"));
				bm.setUser_id(rs.getInt("user_id"));
				bm.setName(rs.getString("name"));
				bm.setDate(rs.getString("date"));
				bm.setProduct_id(rs.getString("product_id"));
				bm.setQuentity(rs.getString("quentity"));
				bm.setStatus(rs.getString("status"));
				bm.setBill(rs.getDouble("bill"));
				return bm;
			}});
	}

	public void editStatus(int id, String newstatus) {
		// TODO Auto-generated method stub
		String sql ="update buy set status='"+newstatus+"' where order_id='"+id+"'";
		jdbcTemplate.update(sql);
	}

	public List<RegModel> userlogin(RegModel rm) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where email='"+rm.getEmail()+"' and password='"+rm.getPassword()+"'";
		List<RegModel> list = jdbcTemplate.query(sql, new RowMapper<RegModel>(){

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel am2 = new RegModel();
				am2.setUser_id(rs.getInt("user_id"));
				return am2;
			}});
		List<RegModel> list2 = list.size()>0?list:null;
		return list2;
	}

	public List<BuyModel> orderByEmail(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from buy where user_id="+id+" group by order_id";
		return jdbcTemplate.query(sql, new RowMapper<BuyModel>(){

			@Override
			public BuyModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				BuyModel bm = new BuyModel();
				bm.setOrder_id(rs.getInt("order_id"));
				bm.setUser_id(rs.getInt("user_id"));
				bm.setName(rs.getString("name"));
				bm.setDate(rs.getString("date"));
				bm.setProduct_id(rs.getString("product_id"));
				bm.setQuentity(rs.getString("quentity"));
				bm.setStatus(rs.getString("status"));
				bm.setBill(rs.getDouble("bill"));
				return bm;
			}});
	}


	public int cancelOrder(String OId) {
		// TODO Auto-generated method stub
		String sql = "delete from buy where order_id='"+OId+"'";
		return jdbcTemplate.update(sql);
	}

	public List<ProductModel> getProductById(int id,int qty) {
		// TODO Auto-generated method stub
		String sql = "select * from product where pro_id='"+id+"'";
		return jdbcTemplate.query(sql, new RowMapper<ProductModel>(){

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setPro_id(rs.getInt("pro_id"));
				pm.setName(rs.getString("name"));
				pm.setAnime(rs.getString("anime"));
				pm.setCategory(rs.getString("category"));
				pm.setStock(rs.getInt("stock"));
				pm.setPrice(rs.getInt("price"));
				pm.setImage(rs.getString("image"));
				pm.setQuentity(qty);
				String d=rs.getString("decription");
				pm.setDec(d.split(","));
				return pm;
			}});
	}

	public int addCart(int user, int pId, int qty) {
		// TODO Auto-generated method stub
		String sql = "insert into tb_cart(pro_id,quantity,user_id)Values('"+pId+"','"+qty+"','"+user+"')";
		return jdbcTemplate.update(sql);
	}

	public int buy(BuyModel bm) {
		// TODO Auto-generated method stub
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    Date date = new Date();  
	    String d=formatter.format(date); 
		
	       String sql="insert into buy(order_id,user_id,name,phone,house,area,landmark,pincode,city,state,date,product_id,quentity,bill,status)values('"+bm.getOrder_id()+"','"+bm.getUser_id()+"','"+bm.getName()+"','"+bm.getPhone()+"','"+bm.getHouse()+"','"+bm.getArea()+"','"+bm.getLandmark()+"','"+bm.getPincode()+"','"+bm.getCity()+"','"+bm.getState()+"','"+d+"','"+bm.getProduct_id()+"','"+bm.getQuentity()+"','"+bm.getBill()+"','Ordered')";

		return jdbcTemplate.update(sql);
	}

	public List<ProductModel> GetCart(int id) {
		// TODO Auto-generated method stub
		String sql = "Select * from product inner join tb_cart on product.pro_id = tb_cart.pro_id where tb_cart.user_id="+id+"";
		return jdbcTemplate.query(sql, new RowMapper<ProductModel>(){

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setPro_id(rs.getInt("pro_id"));
				pm.setName(rs.getString("name"));
				pm.setPrice(rs.getInt("price"));
				pm.setImage(rs.getString("image"));
				pm.setQuentity(rs.getInt("quantity"));
				return pm;
			}});
	}

	public int RemoveCart(int pro_id, int quentity, int id) {
		// TODO Auto-generated method stub
		
		String sql = "delete from tb_cart where pro_id = "+pro_id+" and quantity = "+quentity+"	and user_id	= "+id+"";
		return jdbcTemplate.update(sql);
	}

	public List<ProductModel> viewOrder(int oId) {
		// TODO Auto-generated method stub
		
		String sql ="select * from buy inner join product on buy.product_id=product.pro_id where buy.order_id="+oId+"";
		
		return jdbcTemplate.query(sql, new RowMapper<ProductModel>(){

			@Override
			public ProductModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ProductModel pm = new ProductModel();
				pm.setName(rs.getString("product.name"));
				pm.setPrice(rs.getInt("price"));
				pm.setImage(rs.getString("image"));
				pm.setQuentity(rs.getInt("quentity"));
				return pm;
			}});
	}
	
	public void sendOtp(String email,int otp) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("himanshugokhale47@gmail.com");
		message.setTo(email);
		message.setSubject("Otp");
		message.setText(Integer.toString(otp));
		mailSender.send(message);
	}

	public List<RegModel> CheckEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where email='"+email+"'";
		List<RegModel> list = jdbcTemplate.query(sql, new RowMapper<RegModel>(){

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setEmail(rs.getString("email"));
				return rm;
			}});
		List<RegModel> list2 = list.size()>0?list:null;
		return list2;
	}
	
	public String getpassword(String email) {
		// TODO Auto-generated method stub
		
		String sql = "select password from tb_reg where email='"+email+"'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	public void sendPassword(String email, String password) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("himanshugokhale47@gmail.com");
		message.setTo(email);
		message.setSubject("Recover Password");
		message.setText(password);
		mailSender.send(message);
	}

	public List<RegModel> DuplicateEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_reg where email='"+email+"'";
		List<RegModel> list = jdbcTemplate.query(sql, new RowMapper<RegModel>(){

			@Override
			public RegModel mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				RegModel rm = new RegModel();
				rm.setEmail(rs.getString("email"));
				return rm;
			}});
		List<RegModel> list2 = list.size()>0?list:null;
		return list2;
	}

	public int Save(RegModel rm) {
		// TODO Auto-generated method stub
	       String sql="insert into tb_reg(first_name,last_name,user_name,email,password,phone,dob,gender,address,city,state,zip)values('"+rm.getFirst_name()+"','"+rm.getLast_name()+"','"+rm.getUser_name()+"','"+rm.getEmail()+"','"+rm.getPassword()+"','"+rm.getPhone()+"','"+rm.getDob()+"','"+rm.getGender()+"','"+rm.getAddress()+"','"+rm.getCity()+"','"+rm.getState()+"','"+rm.getZip()+"')";
	       return jdbcTemplate.update(sql);
	}
}
