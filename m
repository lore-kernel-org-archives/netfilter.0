From: Jozef Balaz <jozef.balaz.237@gmail.com>
Subject: [DNAT] applying a new rule for a connection marked as UNREPLIED
Date: Thu, 11 Apr 2013 18:24:06 +0200
Message-ID: <03A41D63-B87F-405D-A4D2-FED951FF9FC8@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:content-type:content-transfer-encoding:subject
         :message-id:date:to:mime-version:x-mailer;
        bh=OkaAe6ZpSTY7ExoYze17jSUAKVQ9Dhrrjzhg1XMy56o=;
        b=PVKE/dBApwt0kEdrVLr6Kj0lDKSf1HSSXsDhYSDKSbSGOq1psws3P0hY8h/Dyh/1Oo
         eF8pi+saqV6MkQacrtixhFAofn1vc9Bh8HngCIuSTx6sD/tYfhLe408BbuOqvnwyA/EU
         KIVl6afyeU/XTxr+xao2xkdxOFb5CjAdyUQGLuGwGaCKdD+stEM7vQD9Bit0ebodI0JJ
         +k0LeaRQxHknehcW/ty4ZuqMbAfpLejTIvlWMKo0oYIKK4KzCVW7WD0nlT2z6ys1HosO
         PksJYd/gR10W1hXoCPQ6cq5XTqGnvbQ9oAseLuVe6OycI7UTTVCez7VdUvi9M9XHGgdA
         xrYA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am developing a SIP proxy server with a media proxy feature which I would like to implement as a set of iptables rules (if the packet comes from the address and port specified in SDP, forward it to the specified destination address and port...).

The problem is that the user agent sends the SIP message with the SDP containing the needed address and port practically simultaneously with the first RTP packets. This causes the DNAT rule to be added after some RTP packets being already received by the proxy. 

From what I have experienced if I add a DNAT rule for a stream of packets that is already listed in the conntrack table as UNREPLIED the rule isn't applied for this stream until it times out.

My question is, is there a way to apply new rules for connections that are already listed in the conntrack table as UNREPLIED without having to wait until they time out? Or did I understand it wrong?

What I need is something like the RAWDNAT but I also need to be able to change the destination port and not just the address.

Thanks for any help in advance,
Jozef