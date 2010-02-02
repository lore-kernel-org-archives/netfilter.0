From: Gary Smith <gary.smith@holdstead.com>
Subject: IPV6 and Pre/post routing
Date: Tue, 2 Feb 2010 10:08:35 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hello, 

I'm doing some information gathering an IPV4 to IPV6 conversion project.  We are looking at migrating to a colo that provides IPV4 and IPV6, with IPV4 over IPV6.  Converting all of the servers to IPV6 should be a pretty simple task as all of the equipment and OS's we run support it.  The problem is that we do a lot of NAT stuff.

We have a number of web servers that have public IP's but none house email (as we have a dedicated infrastructure for that).  So when a request for ports 25,110,4somthing,143,587,993,995 (any other mail related ports I missed) come in, they get NAT'ed to a set of mail proxies.  Under IPV4 this is quite easy (catch it in the PREROUTING table).

What I'm wondering, after reading some old documentation on iptables, if this is possible with IPV6.  If so, can someone point me in the direction of some real world examples?  Some old documentation says no (dated 2003 on the netfilter.org site).

Any suggestions.
