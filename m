From: Steven Ayre <steveayre@gmail.com>
Subject: Re: iptables block samba or not?
Date: Fri, 25 Jan 2008 16:04:36 +0000
Message-ID: <479A0894.9080305@gmail.com>
References: <200801251427.m0PERxpJ001193@indigo.cs.bgu.ac.il> <4799FD25.4070305@netoyen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4799FD25.4070305@netoyen.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


>> # up to 5 Bit-torrent connections
>> /sbin/iptables -A INPUT -p tcp -m state --state NEW --dport 6881:6886 
>> -j ACCEPT
Your comment suggests you're trying to limit your BitTorrent client to 
only accepting 5 incoming connections at any one time. Is that the case?

If it is:
- There'll be no limit on the number of outgoing connections
- It'll allow your client to accept incoming connections on 5 port 
numbers, but you can have more than one computer connected to your 
client on the same port at the same time; so this'll allow connections 
to 5 ports, but won't limit the actual number of connections.

It will be needed for BitTorrent to work properly though since your 
INPUT policy is DROP. Just want to check you realise that it won't limit 
the number of connections (there are ways to do in iptables if that's 
what you wanted).

Rgds,
-Steve
