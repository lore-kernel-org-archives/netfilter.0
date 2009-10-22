From: Tanguy Ropitault <tanguy.ropitault@telecom-bretagne.eu>
Subject: Timeout for dynamic Nat
Date: Thu, 22 Oct 2009 11:23:16 +0200
Message-ID: <4AE02484.5020404@telecom-bretagne.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I was asking myself how are managed dynamic NAT timeout i.e how the 
duration of an association "private address+private port" <->public 
address/port is set.
I dont have a great knowledge about netfilter but after browsing Linux 
code, I have in mind that it has something to do with the conntrack 
mechanism but I do not understand.
Is it in /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c for 
example for TCP? And if it's the cas, how does it work?

I halso see the struct nf_conn structure and particularly the timeout 
field but I dont see where this timeout is set.

Thanks for your answers,
Tanguy.


