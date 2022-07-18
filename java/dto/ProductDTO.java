package dto;

public class ProductDTO {
	private String category;
	private String name;
	private String content;
	private String price;
	private String images;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "ProductDTO [category=" + category + ", name=" + name + ", content=" + content + ", price=" + price
				+ ", images=" + images + "]";
	}
	
	
	
	
	
}
