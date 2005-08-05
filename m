From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: multiports
Date: Fri, 5 Aug 2005 08:34:07 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peggy Kam <ppkam@n-dsi.com>
Cc: netfilter@lists.netfilter.org


>Is it possible to match multiple source and destination ports at the
>same time?  It seems to me that it is not possible.  I am using iptables
>version 1.2.11 and I have tried the following command:
>
>iptables -A INPUT -p tcp --src 192.168.1.0/255.255.255.0 -m tcp -m
>multiport --sports 22,80  --dst 192.168.22.123 -m multiport --dports
>22,80 -j ACCEPT

Everything is ANDed, so the following combinations are only possible with your 
rule:

22/22
22/80
80/22
80/80

Probably not what you want, given that most HTTP clients connect from some 
high-random port.

You need to separate rules,
-m multiport --dports 22,80
-m multiport --sports 22,80
to get an OR behavior


Jan Engelhardt
-- 

