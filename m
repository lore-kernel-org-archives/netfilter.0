From: "David Busby" <busby@pnts.com>
Subject: Re: DNAT & Host Headers
Date: Mon, 30 Jun 2003 18:40:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04cf01c33f71$c0910650$1100000a@busbydev>
References: <002201c33f70$d1e33000$0101a8c0@techinitiatives.com>
Reply-To: "David Busby" <busby@pnts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Tim <twrodriguez@earthlink.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

When using apache the server will look at the HTTP host header which in your
case would be "Host: www.mydomain.com\r\n"
The HTTP headers are contained inside the TCP packet and are not modified by
iptables (in your rules)
So as long as the server can communicate in and out the host name will only
affect the web server
Of course the web server must be configured to look for that host header
name (and alternatives such as mydomain.com) and to listen on the ipaddress
$NEMESIS

HTH

/B

----- Original Message ----- 
From: "Tim" <twrodriguez@earthlink.net>
To: "Netfilter Mailing List" <netfilter@lists.netfilter.org>
Sent: Monday, June 30, 2003 18:33
Subject: DNAT & Host Headers


First here is the rules within their respective chains:

iptables -t nat -A PREROUTING -p tcp --dport 80 -d $INTERNET -j DNAT
--to $NEMESIS

iptables -A FORWARD -p tcp --dport 80 -d $NEMESIS -j ACCEPT

I'm running this particular web-site with a host header, when I type in
the www.mydomain.com address on the browser and the packets hit the
prerouting chain then the forward chain how will the communication still
know that it is meant for www.mydomain.com

Will this work or do I need to modify the rules in order for my web
server to recognize that the information is intended for
www.mydomain.com. As it is there are several web-sites within my
web-server utilizing the same ip address, including the default
web-site.

Any insight will be gratefully appreciated.

Thanks in advance
Tim--Mia/Fla.



