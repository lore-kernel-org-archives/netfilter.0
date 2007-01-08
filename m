From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: hi.. problems with DNAT
Date: Mon, 8 Jan 2007 03:24:37 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701080322560.28861@yvahk01.tjqt.qr>
References: <d23e54db0701071814s65d1287ds94cfa9f472c5a1a6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d23e54db0701071814s65d1287ds94cfa9f472c5a1a6@mail.gmail.com>
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
To: Juan Pablo Ramirez <ramirez.juanpablo@gmail.com>
Cc: netfilter@lists.netfilter.org


On Jan 7 2007 23:14, Juan Pablo Ramirez wrote:
>
> if i do something like this, could work?
>
> gate/home/admin -> iptables -t nat -N mellon
> gate/home/admin ->iptables -t nat -A mellon -p tcp -j DNAT
> --to-destination 192.168.9.8:20

You still need to call into mellon, otherwise, this alone, yes.

> i want to put all my DNAT rules and my fowarding rules to my server
> area in one rule only.
> can i do this?

Try. (Since I can't figure out from your question how you intend
to do _that_.)


	-`J'
-- 

