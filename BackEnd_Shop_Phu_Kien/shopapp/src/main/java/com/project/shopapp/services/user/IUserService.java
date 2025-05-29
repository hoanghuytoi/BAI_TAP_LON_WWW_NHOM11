package com.project.shopapp.services.user;

import com.project.shopapp.dtos.requests.user.UpdateUserDTO;
import com.project.shopapp.dtos.requests.user.UserDTO;
import com.project.shopapp.models.User;

public interface IUserService {
    User createUser(UserDTO userDTO) throws Exception;

    String login(String phoneNumber, String password, int roleId) throws Exception;

    User getUserDetailsFromToken(String token) throws Exception;
    User updateUser(int userId, UpdateUserDTO updatedUserDTO) throws Exception;

}
