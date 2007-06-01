From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Force use of outgoing IP address
Date: Fri, 01 Jun 2007 13:24:31 -0400
Message-ID: <1180718671.6539.1.camel@localhost>
References: <B3FAB89EFECD684E9E648B81133263F1466025@MAIL_COM.MULBERRY.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B3FAB89EFECD684E9E648B81133263F1466025@MAIL_COM.MULBERRY.COM>
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
Content-Type: text/plain; charset="us-ascii"
To: Neil Russell <NeilR@mulberry.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2007-06-01 at 17:42 +0100, Neil Russell wrote:
> Hi,
>  
> new to all this so please be gentle with me....
>  
> I have a linux router with 3 network cards in, each card has multiple IP
> address's assigned. I want to route all aoutbound traffic TO a
> destination port of $DESTPRT out of eth0 on its IPAddress of 10.0.0.2
>  
> 
> Example is 
>  
> Eth0 has IP address's of 
> 10.0.0.1
> 10.0.0.2
> 10.0.0.3
> and connects to 10.0.0.99 (Internet router)
>  
> eth1 has ip address's of
> 192.168.0.1
> 192.168.0.2
> 192.168.0.3
>  
> 
> and eth3 has ip address's of
> 192.168.1.0
> 192.168.1.2
> 192.168.1.3
>  
> 
> So ALL traffic on the router with a destination address MUST go out on
> eth0 and show its IP address as 10.0.0.2 even though the default route
> is out via 10.0.0.1
>  
> Hope thats clear and that someone can advise.
>  
> 
> Neil.
> 
I believe you're going to want to use iproute2 to do this.  There is a
somewhat dated slideshow on doing something very close to this (if I
recall correctly) in the training section of http://iscs.sourceforge.net
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


