From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 08:13:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071234823.2020.8.camel@grendel>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003101c3c065$f61ad790$13fea8c0@melita.com>
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
To: Ian Hunter <ihunter@hunterweb.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-12-11 at 23:11, Ian Hunter wrote:
>
> Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN URGP=0

My "guess" is, you are receiving a SYN packet from 204.157.6.223. This
creates a state table entry with with a 60 second timer. Your system is
taking longer than 60 seconds to respond, so iptables is removing the
state table entry. Your system then responds causing the log entry shown
above.

HTH,
C






