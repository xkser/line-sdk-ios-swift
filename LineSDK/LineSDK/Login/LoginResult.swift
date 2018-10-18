//
//  LoginResult.swift
//
//  Copyright (c) 2016-present, LINE Corporation. All rights reserved.
//
//  You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
//  copy and distribute this software in source code or binary form for use
//  in connection with the web services and APIs provided by LINE Corporation.
//
//  As with any software that integrates with the LINE Corporation platform, your use of this software
//  is subject to the LINE Developers Agreement [http://terms2.line.me/LINE_Developers_Agreement].
//  This copyright notice shall be included in all copies or substantial portions of the software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation

/// Represents a successful login.
public struct LoginResult {
    /// The access token obtained by the login process.
    public let accessToken: AccessToken
    /// The permissions bound to the `accessToken` object by the authorization process.
    public let permissions: Set<LoginPermission>
    /// Contains the user profile including the user ID, display name, and so on. The value exists only when the
    /// `.profile` permission is set in the authorization request.
    public let userProfile: UserProfile?
    /// Indicates that the friendship status between the user and the bot changes during the login. This value is
    /// non-`nil` only if the `.botPromptNormal` or `.botPromptAggressive` are specified as part of the
    /// `LoginManagerOption` object when the user logs in. For more information, see Linking a bot with your LINE 
    /// Login channel at https://developers.line.me/en/docs/line-login/web/link-a-bot/.
    public let friendshipStatusChanged: Bool?
}
