//
//  Message.swift
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

enum MessageType: String, Codable {
    case text
    case image
    case video
    case audio
    case location
    case template
    case flex
}

/// Represents a message which LineSDK could send or receive. `Message` is a general wrapper for underlying concrete
/// type of message. It provides a unifying way to encode and decode messages. You could use related request or APIs
/// to send or receive messages, as long as your users authorized enough permissions.
///
/// - text: Represents the type of text message. A `TextMessage` value is associated.
/// - image: Represents the type of image message. An `ImageMessage` value is associated.
/// - video: Represents the type of video message. A `VideoMessage` value is associated.
/// - audio: Represents the type of audio message. A `AudioMessage` value is associated.
/// - location: Represents the type of location message. A `LocationMessage` value is associated.
/// - template: Represents the type of template message. A `TemplateMessage` value is associated.
///             LINE APIs supports a few types of template messagess. `TemplateMessage` is also a
///             representing wrapper for underlying template layouts.
/// - unknown: A message type is not defined in LineSDK yet.
public enum Message: Codable {
    
    case text(TextMessage)
    case image(ImageMessage)
    case video(VideoMessage)
    case audio(AudioMessage)
    case location(LocationMessage)
    case template(TemplateMessage)
    case flex(FlexMessage)
    
    case unknown
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try? container.decode(MessageType.self, forKey: .type)
        switch type {
        case .text?:
            let message = try TextMessage(from: decoder)
            self = .text(message)
        case .image?:
            let message = try ImageMessage(from: decoder)
            self = .image(message)
        case .video?:
            let message = try VideoMessage(from: decoder)
            self = .video(message)
        case .audio?:
            let message = try AudioMessage(from: decoder)
            self = .audio(message)
        case .location?:
            let message = try LocationMessage(from: decoder)
            self = .location(message)
        case .template?:
            let message = try TemplateMessage(from: decoder)
            self = .template(message)
        case .flex?:
            let message = try FlexMessage(from: decoder)
            self = .flex(message)
        case nil:
            self = .unknown
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .text(let message):
            try message.encode(to: encoder)
        case .image(let message):
            try message.encode(to: encoder)
        case .video(let message):
            try message.encode(to: encoder)
        case .audio(let message):
            try message.encode(to: encoder)
        case .location(let message):
            try message.encode(to: encoder)
        case .template(let message):
            try message.encode(to: encoder)
        case .flex(let message):
            try message.encode(to: encoder)
        case .unknown:
            Log.assertionFailure("Cannot encode unknown message type.")
        }
    }
    
    public var asTextMessage: TextMessage? {
        if case .text(let m) = self { return m }
        return nil
    }
    
    public var asImageMessage: ImageMessage? {
        if case .image(let m) = self { return m }
        return nil
    }
    
    public var asVideoMessage: VideoMessage? {
        if case .video(let m) = self { return m }
        return nil
    }
    
    public var asAudioMessage: AudioMessage? {
        if case .audio(let m) = self { return m }
        return nil
    }
    
    public var asLocationMessage: LocationMessage? {
        if case .location(let m) = self { return m }
        return nil
    }
    
    public var asTemplateMessage: TemplateMessage? {
        if case .template(let m) = self { return m }
        return nil
    }
}

extension Message: MessageConvertible {
    public var message: Message { return self }
}
