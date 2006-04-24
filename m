From: lukas@tank.eu.org
Subject: Re: Not NATed packets
Date: Mon, 24 Apr 2006 11:55:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.64N.0604241149300.6204@tank.eu.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
	<e2goe1$f34$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e2goe1$f34$1@sea.gmane.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> lukas@tank.eu.org wrote:
>> I have strange problem with NAT.
> Me too.
>
>> I have kernel 2.6.14.7-5 and iptables-1.3.3-6@2.6.14.7_5 and I use nat
> Tested with 2.6.11 and 2.6.16.4.
>
>> NAT configuration is simple but some packets are not NATed - on my
>> public interface packets with source address of my internal (NATed)
>> network appears and i have no clue what is wrong.
> I have very simple rules too. nat/PREROUTING is empty and
> nat/POSTROUTING contains only one rule with MASQUARADE target on
> interface with public IP (Policies are ACCEPT). I don't use ROUTE target
> anywhere.
>
>> 16:30:39.015880 IP (tos 0x0, ttl 127, id 28594, offset 0, flags [DF],
>> proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F,
>> cksum 0x1623 (correct), 3885889894:3885889894(0) ack 3151418643 win 65535
> Exactly. I can see only FIN packets which are not translated. After
> looking into conntrack table, I think MASQ ignores FIN packets that are
> missing in conntrack table (Is it INVALID or NEW state?).
>
> Very strange behaviour have counters too. These strange packets are not
> loggable after MASQ rule. It seems like a bug.

I test it also on kernel 2.4.32-6 and its bad too.




