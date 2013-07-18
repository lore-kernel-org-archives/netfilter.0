From: "podo" <podo@hnup.de>
Subject: Limit rule for ICMP not working properly?
Date: Thu, 18 Jul 2013 18:55:58 +0200
Message-ID: <002e01ce83d7$ad77f410$0867dc30$@hnup.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

I have a problem with the limit module. The goal is to limit the incoming
ICMP echo-requests to max 1/s.
The following rule does it (as example using the INPUT) :

-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT

The above is working fine. But when there is a rule for accepting the
ESTABLISHED packets, the limit does not work:

-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT
-A INPUT -m state --state ESTABLISHED -j ACCEPT

With these 2 rules the limit does not work...

Using the "iptables -A INPUT -m state --state ESTABLISHED -p ICMP -j ACCEPT"
and  "watch -d -n 1  iptables -nvL" is showing, that all the ICMP
echo-requests from the same host are being considered ESTABLISHED.

I am not sure, but I think after sending the ICMP echo-reply the session
should be closed. With new echo-request a new session is opened.

Please could somebody confirm, if this behavior is correct ? And if yes
please explain ?

See also:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=598513

and from
"http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html
" :

"ESTABLISHED
 A packet which belongs to an existing connection (i.e., a reply 
packet, or outgoing packet on a connection which has seen replies)."

And from "http://www.lug.or.kr/docs/iptables-tutorial/onepage/" :

"The reply packet is considered as being ESTABLISHED, as we have already 
explained. However, we can know for sure that after the ICMP reply, 
there will be absolutely no more legal traffic in the same connection. 
For this reason, the connection tracking entry is destroyed once the 
reply has traveled all the way through the Netfilter structure."

I am using iptables v1.4.14.

Thanks in advance,
Regards,
Podo.


