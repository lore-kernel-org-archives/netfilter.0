From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: limit extension
Date: Tue, 19 Jul 2005 22:13:21 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507192209400.16157@yvahk01.tjqt.qr>
References: <42DD417F.4090804@rbw.goe.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DD417F.4090804@rbw.goe.net>
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
To: Michael Schachtebeck <schachti@rbw.goe.net>
Cc: netfilter@lists.netfilter.org


>I'm using the following iptables rule to redirect them:
>
>/sbin/iptables -t nat -I PREROUTING -p tcp -s $IP -i $LAN_DEV --sport
>1024: --dport 80 --syn -m limit --limit 1/d --limit-burst 1 -j REDIRECT
>--to-port 5000

You could use dstlimit with --dstlimit-mode srcip-dstip
and probably save some rules.

With dstlimit, you also get an overview of which connections are currently 
limited, and their burst status, in /proc/net/ipt_dstlimit/DSTLIMIT_NAME
It's because I think some burst math allows to have a second packet sneak in.

>What am I doing wrong? Why was I redirect a second time? In my opinion,
>the second redirection should not have happened then, but 1 day (24
>hours) later...



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

