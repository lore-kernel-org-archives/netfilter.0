From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: Weird TCP flags?
Date: Thu, 11 Dec 2003 23:52:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005401c3c06b$c4f107b0$13fea8c0@melita.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312112346.41936.JALaramie@Loudoun-Fairfax.com>
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
To: netfilter@lists.netfilter.org

There are no users on that box though, and it's not web browser traffic
because the SOURCE port is 80, not the dest port, so this is web traffic
being served by that box for sure...

I've seen references to doing --reply-with tcp-reject to this sort of
packet... ???
----- Original Message ----- 
From: "Jeffrey Laramie" <JALaramie@Loudoun-Fairfax.com>
To: "Ian Hunter" <ihunter@hunterweb.net>; <netfilter@lists.netfilter.org>
Sent: Thursday, December 11, 2003 11:46 PM
Subject: Re: Weird TCP flags?


> On Thursday 11 December 2003 23:11, Ian Hunter wrote:
> > OK, I have a router (lucy) with a webserver (192.168.254.242) in a DMZ
(off
> > eth1), and everything works fine -- when you hit my ip, you get the
site,
> > all is well.  However, I get STORMS of this nonsense in my logs:
> >
> > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN
URGP=0
> >
>
> These have ACK SYN set so I doubt they have anything to do with
established
> connections. I would guess that this is a browser on the webserver itself
> trying to connect to an outside site which your rules don't allow. In this
> case: bart.routesys.com.
>
> Jeff


