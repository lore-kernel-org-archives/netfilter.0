From: aw-netfilter@mw-itcon.de
Subject: Re: Can't get DNS forwarded
Date: Thu, 26 Sep 2002 09:13:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926071347.12988.qmail@mw-itcon.de>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

I think one problem is with the DNATs you've setup: 

> # b) forward WWW to FS02
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 208.250.60.72 -j DNAT
> --to-destination 192.168.100.2:80
I would read 'DNAT all traffic originally for 208....72 to 192.....2:80' 
this means also DNS. You sould include '--dport 80' to DNAT only http 
traffic (As you did under c) for 25). 

> # c) forward SMTP to FS02
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 208.250.60.72 --dport 25 -j
> DNAT --to-destination 192.168.100.2:25
this is fine. 

Regards,
Andreas
 ------------------------------------------------------------
Andreas Wolff
Menzebach und Wolff IT-Consulting 

phone: +49 7503 916 716 - 2, mobile: +49 160 7 54 11 53
email: Andreas.Wolff@mw-itcon.de
http:  www.mw-itcon.de
 ------------------------------------------------------------
> echo " DONE

