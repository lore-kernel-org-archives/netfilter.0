From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: limit extension
Date: Wed, 20 Jul 2005 08:25:12 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507200706460.6953@yvahk01.tjqt.qr>
References: <42DD417F.4090804@rbw.goe.net>
	<Pine.LNX.4.61.0507192209400.16157@yvahk01.tjqt.qr>
	<42DD6A21.3090301@rbw.goe.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DD6A21.3090301@rbw.goe.net>
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

>> You could use dstlimit with --dstlimit-mode srcip-dstip
>> and probably save some rules.
>> 
>> With dstlimit, you also get an overview of which connections are currently 
>> limited, and their burst status, in /proc/net/ipt_dstlimit/DSTLIMIT_NAME
>> It's because I think some burst math allows to have a second packet sneak in.
>
>Won't I have the same problem with it?

Probably, but it helps to diagnose the problem thanks procfs.

>http://www.netfilter.org/patch-o-matic/pom-obsolete.html#pom-obsolete-dstlimit,
>it's deprecated by hashlimit, but on

According to the hashlimit POMng help file and netfilter website

|The idea is to have something like 'limit', but either per 
|destination-ip or per (destip,destport) tuple.

it does not look like it can handle (srcip,dstip) tuples. Though, the codebase 
has flags for SIP, SPT, DIP and DPT, so I guess it maybe can. Someone 
enlighten me?

>/sbin/iptables -t nat -I PREROUTING -p tcp -s $IP -i $LAN_DEV --sport
>1024: --dport 80 --syn -m limit --limit 1/d --limit-burst 1 -j REDIRECT
>--to-port 5000

-m dstlimit --dstlimit 1/d --dstlimit-burst 1
  --dstlimit-mode srcip-dstip --dstlimit-name trafficcontrol



Jan Engelhardt
-- 

