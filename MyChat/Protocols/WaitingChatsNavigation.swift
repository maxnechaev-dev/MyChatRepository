//
//  WaitingChatsNavigation.swift
//  MyChat
//
//  Created by Max Nechaev on 27.09.2021.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}
