From: "Dharmendra T." <dharmu@nsecure.net>
Subject: Re: strange packets on loopback
Date: 23 Jun 2004 14:51:11 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087982478.7946.50.camel@dharmu.nsecure.net>
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
To: ju@isf.rwth-aachen.de
Cc: netfilter@lists.netfilter.org



Hi 

My questions to this are:

On Tue, 2004-06-22 at 21:27, Nils Juergens wrote:
> Hello,
> 
> i have a firewall setup like this:
> 
>  /--------\
> / Internet \
> \---------/
>      |
>   ___|____
>  | Router |
>  ----------
>      |
>      |
>      |ext FW interface (y.y.y.y)
>   ___|______
>  | Firewall | (also routing)
>  ------------
>      | int FW interface (z.z.z.z) (default gw for PCs on lan)
>      |
>  /---------\
> / local net \ a.a.a.0/24
> \----------/
> 
>   
> my netfilter-based firewall logs packets like this:
> 
> INPUT DROP XX: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 \
> SRC=a.a.a.a DST=y.y.y.y LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=0 \
> DF PROTO=TCP SPT=1249 DPT=8080 WINDOW=0 RES=0x00 RST URGP=0

Why the MAC is not displayed proerly? Getting doubt whether someone is
trying to spoof!(Possible, not too scary as the packets are getting
dropped).

If this is the valid mac just try to find out from which ip it is coming
by using arp.

> 
> where a.a.a.a is an IP on my local lan and y.y.y.y is the IP of the
external
> firewall interface.
> 
> I do have a squid proxy running on the firewall listening at
0.0.0.0:8080
> and the clients are set up to use y.y.y.y:8080 as proxy, but i find it
> rather strange that the IN-interface is listed as 'lo', while it
should be
> 'int0' (i have renamed my interfaces as int0 and ext0 using nameif).
> 
> It also seems that I only log packets with the RST flag, no others.
> 
> The service itself is running fine, and the packets are dropped
because i
> only accept packets from lo that have a source address of 127.0.0.1,
y.y.y.y
> or z.z.z.z).
> 
> So unless I understand the concept of loopback completely wrong i
think that
> IN should only by 'lo' when the source address is on of the IP
addresses of
> the local interfaces, including lo.
>  

> Is this a bug?

I dont think this is the bug. Give us the arp output that should give
more details.
> 
> I'm using iptables v1.2.6a and linux-2.4.26 with
grsecurity-2.0-2.4.26.patch
> on a Debian/Woody system.
> 
> I would be greateful for an explanation.
> 
> thx,
> 
> Nils Juergens
Dharmendra T.
Linux Security and Admin,
www.nsecure.net

This message is intended for the addressee only. It may contain privileged or confidential information. If you have received
 this message in error, please notify the sender and destroy the message immediately. Unauthorised use or reproduction of 
this message is strictly prohibited.

-- 



