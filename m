From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Weird TCP flags?
Date: Thu, 11 Dec 2003 23:51:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312112351.18680.JALaramie@Loudoun-Fairfax.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003101c3c065$f61ad790$13fea8c0@melita.com>
Content-Disposition: inline
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
To: Ian Hunter <ihunter@hunterweb.net>, netfilter@lists.netfilter.org

On Thursday 11 December 2003 23:11, Ian Hunter wrote:
> OK, I have a router (lucy) with a webserver (192.168.254.242) in a DMZ (off
> eth1), and everything works fine -- when you hit my ip, you get the site,
> all is well.  However, I get STORMS of this nonsense in my logs:
>
> Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN URGP=0
>

Let me correct my previous post. It's coming from port 80 but it's not trying 
to connect to port 80 so it's probably not a browser. Disregard, I need 
sleep.

Jeff

