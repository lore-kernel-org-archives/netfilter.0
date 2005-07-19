From: Michael Schachtebeck <schachti@rbw.goe.net>
Subject: Re: limit extension
Date: Tue, 19 Jul 2005 23:01:21 +0200
Message-ID: <42DD6A21.3090301@rbw.goe.net>
References: <42DD417F.4090804@rbw.goe.net>
	<Pine.LNX.4.61.0507192209400.16157@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507192209400.16157@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Hi.

Am 07/19/2005 10:13 PM schrieb Jan Engelhardt:

> You could use dstlimit with --dstlimit-mode srcip-dstip
> and probably save some rules.
> 
> With dstlimit, you also get an overview of which connections are currently 
> limited, and their burst status, in /proc/net/ipt_dstlimit/DSTLIMIT_NAME
> It's because I think some burst math allows to have a second packet sneak in.

Won't I have the same problem with it?

According to

http://www.netfilter.org/patch-o-matic/pom-obsolete.html#pom-obsolete-dstlimit,

it's deprecated by hashlimit, but on

http://www.netfilter.org/patch-o-matic/pom-submitted.html#pom-submitted-hashlimit,

I can't find any information on how to use it in my case... Do you know
where to look for it or do you have an example for how to redirect a
single host or a bunch of hosts once a day to the local apache when
trying to make their first http connection, similar to

/sbin/iptables -t nat -I PREROUTING -p tcp -s $IP -i $LAN_DEV --sport
1024: --dport 80 --syn -m limit --limit 1/d --limit-burst 1 -j REDIRECT
--to-port 5000

Michael
-- 
PGP Public Key:  http://www.num.math.uni-goettingen.de/schachte/key.asc
Key fingerprint: C474 8B85 17C0 0232 E439 0FBF 2451 E452 293C D798

