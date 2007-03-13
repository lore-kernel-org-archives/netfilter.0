From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: Please help with my bridge/router
Date: Tue, 13 Mar 2007 09:46:18 +0200
Message-ID: <45F656CA.7080104@zoomnet.ro>
References: <20070312221935.55027.qmail@web50411.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070312221935.55027.qmail@web50411.mail.re2.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serge Matovic <matovics@yahoo.com>
Cc: netfilter@lists.netfilter.org

Serge Matovic wrote:
> Hi to all. I'm a bit hesitant to bug you with this
> basic problem of mine, and I just hope that I'm not
> wasting your time.
> OK, here is the situation. I have a Linux machine with
> 4 NICs. I have configured 3 of these NICs into a
> bridge (br0), and the 4th NIC is connected to an ADSL
> modem (ppp0), which, in turn, is connected to
> Internet. This NIC is getting a DHCP address from my
> ISP. I'm using the iptable script from dranch's
> IP-MASQ-HOWTO. (and I tried many other ones, as well).
>
> Now here is the problem: When I try to go Internet
> from my Client computer (connected to one of the 3
> NICs of this bridge/router) some sites (like
> Google.ca) connect and work perfectly, ***BUT*** some
> sites (like globaltv.com) do not load at all. But I
> know that they work fine when I connect to them
> without going thru my bridge/router.
>
> Does anyone have a thought on why some sites work and
> some don't?
>
> Many thanks, and best regards,
> serge.
>
>
>
>  
> ____________________________________________________________________________________
> Never miss an email again!
> Yahoo! Toolbar alerts you the instant new Mail arrives.
> http://tools.search.yahoo.com/toolbar/features/mail/
>
>   
Try:

iptables -I FORWARD -j TCPMSS  -o ppp0 -p tcp --tcp-flags SYN,RST SYN 
--clamp-mss-to-pmtu


In the man table of iptables you can see the explanation too.

