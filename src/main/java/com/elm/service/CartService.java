package com.elm.service;

import java.util.List;

import com.elm.pojo.Cart;

public interface CartService {

	public List<Cart> listCart(Cart cart);
	public int saveCart(Cart cart);
	public int updateCart(Cart cart);
	public int removeCart(Cart cart);
}
