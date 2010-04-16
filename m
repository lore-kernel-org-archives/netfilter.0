From: John Engelke <john.engelke@gmail.com>
Subject: Possible IPTables bug in INPUT interface filtering?
Date: Thu, 15 Apr 2010 20:12:23 -0700
Message-ID: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=ZfK4wBtbGCLm5Tj/z8GvGZc0C3UwUxygFojdZ01SM9M=;
        b=FKWZO2mP3ptYrHcDgtCgAGJHmk9sRlybvliS6FRmaU89rBdesx8o2BGjDJC5thNKix
         I71oyD5jY6518l3CLLButBRP8yt4L2GJWX+pADHR6b887EkaM154Q+Dznn6T7/jB3rti
         eCimPgWx63C5GxXVwojy96B/GDRoGKW3U3zGo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello IPFilter Guru World,

I've encountered some strangeness in filtering on a multihomed Linux
box, CentOS 5, x86_64, 2.6.18-164.15.1.el5, where using the interface
flag (-i) does not work.

So this box has two interfaces on the local subnet, eth0 and eth1. I
would like to restrict VNC to only one of the interfaces, eth1. At the
start, VNC does not work. So I add this:

-A INPUT -i eth1 -p tcp -m multiport --port 5900 -j ACCEPT

Then, VNC starts working on eth0 AND eth1. Since I know the address of
eth1, I then put it in explicitly as:

-A INPUT -i eth1 -p tcp -d 192.168.1.34 -m multiport --port 5900 -j ACCEPT

Amazingly, this works and now VNC traffic is only allowed on eth1
(address 192.168.1.34). So I believe I am concluding correctly that
interface filtering *does not work* for INPUT statements in multihomed
machines. I also wonder if it does not work at all for any interface.

This is with IPTables 1.3.5. It is a real PITA since I have to rewrite
all my rules for specific IPs and then bind my adapters to those IPs.
Any meaninful comments are appreciated, even if I am really off base
here.

Thanks!

-- IngyHere
