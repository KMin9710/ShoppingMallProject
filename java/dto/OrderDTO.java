package dto;

public class OrderDTO {
	private String catego;
	private String ordername;
	private String content;
	private String price;
	private String images;
	public String getCatego() {
		return catego;
	}
	public void setCatego(String catego) {
		this.catego = catego;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "OrderDTO [catego=" + catego + ", ordername=" + ordername + ", content=" + content + ", price=" + price
				+ ", images=" + images + "]";
	}
	
	
}
