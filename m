From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Url not found ....
Date: Sat, 6 Jul 2002 22:10:24 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020706211026.TNJT2755.mta05-svc.ntlworld.com@there>
References: <200207062258.42170.captain.nuke@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207062258.42170.captain.nuke@gmx.at>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 06 July 2002 9:58 pm, Patrick Petermair wrote:

> Hi!
>
> I've installed a firewall/gateway with RedHat 7.3 and iptables. I've set up
> masquerading for my internal lan and some basic firewall rules.
> Everything works fine (icq, ftp, http,...) but there is ONE homepage which
> I cannot acces (a friend of mine can).
>
> http://stud4.tuwien.ac.at/-e9625216/html/projects.html
>
> When I try to access this page with client in my lan all I get is "not
> found - The requested URL [...] was not found on this server."
> After taking a look in my firewall log I found this entry:
>
> Jul  6 22:45:11 wormhole kernel: IN=ppp0 OUT= MAC= SRC=193.170.75.21
> DST=213.225.44.140 LEN=52 TOS=0x00 PREC=0x00 TTL=57 ID=46360 DF PROTO=TCP
> SPT=80 DPT=36827 WINDOW=32768 RES=0x00 ACK FIN URGP=0
>
> And if you try to ping stu4.tuwien.ac.at you'll find out, that the IP is
> 193.170.75.21 - so the answer from the server gets dropped at my firewall.
>
> So the big question is WHY? All homepages I tried so far are working, but
> not this one, so I doubt that it's a problem with the firewall rules.....
>
> Any hints/comments?

1. Are you on a PPPoE link, or maybe something else which uses a strangely 
small MTU ?

2. Are you allowing all relevant ICMP packets back in through your firewall, 
just in case something somewhere along the way is saying "please fragment" 
because it can't cope with the packet size ?

You might find the following helpful:

http://lists.samba.org/pipermail/netfilter/2002-July/024515.html

 

Antony.

