From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: TCP Flags combination
Date: Sat, 3 Mar 2007 21:44:49 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703032142420.23714@yvahk01.tjqt.qr>
References: <3115d56e0703030812l24187a2we154e60971de81f3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0703030812l24187a2we154e60971de81f3@mail.gmail.com>
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
To: afshin lamei <afshinlamei@gmail.com>
Cc: netfilter@lists.netfilter.org


On Mar 3 2007 19:42, afshin lamei wrote:
>
> Dear list,
> I'm running a test box with an iptables rule like this (to detect "FIN
> no ACK" port scanning):
>
> iptables -A INPUT -p tcp --tcp-flags FIN,ACK FIN -j LOG
>
> is that a correct rule for "FIN no ACK" scan?

See http://jengelh.hopto.org/p/chaostables/#se2

> The rule generates more than 15 log entries per minute in my /var/log/messages:
>
> IN=br0 OUT= PHYSIN=eth1 MAC=<"my box" SRC=<"Some valid IPs" DST="My
> box" LEN=52 TOS=0x00 PREC=0x00 TTL=40 ID=59216 DF PROTO=TCP SPT=59005
> DPT=3128 WINDOW=65535 RES=0x00 FIN URGP=0
>
> The logs are continuing to appear for more than 2 weeks! How can I
> find the cause of this?
> best regards,
> afshin lamei
>

Jan
-- 

