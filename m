From: ayaka <ayaka@soulik.info>
Subject: NAT6 One to One implement in kernel ?
Date: Sun, 20 Nov 2022 16:37:09 +0800
Message-ID: <0189332D-96B0-4C30-B493-1C004E5A00BD@soulik.info>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello

I don’t know whether iputils or nft have supported this or I need to write a kernel module here. I think the job here is just do a prefix replacement on outgoing and incoming packets.

The reason why I want is that ISP could offer me a dynamic IPv6 subnet(could be less than /64), while I have some static IPv6 global unicast addresses but not they won't be routed to gateway(like addresses we could got from tunnelbroker).

I want to have a static IPv6 address while enjoying the high speed Internet.
I read the document about one to one NAT in ipv4, you need to add SNAT and DNAT rule one by one. I even I won't not have more than 20 devices in my local network, I don't think it would be worth to do that.

Please tell me what I need to, I don’t have any experience even with the netlink interface.

Thanks in advance.
Sent from my iPad
