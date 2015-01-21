From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Wed, 21 Jan 2015 15:33:07 +0100
Message-ID: <54BFB8A3.7090504@chello.at>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54BF086E.5080906@ngtech.co.il> <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Niggemann <jn@hz6.de>, Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

On 21.01.2015 14:19, Jan Niggemann wrote:
> Hi Eliezer and others,
>
> Zitat von Eliezer Croitoru <eliezer@ngtech.co.il>:
>> On 19/01/2015 15:04, Jan Niggemann wrote:
>>> Machine
>>> Lenovo T400, Debian 7.8
>>
>> As in a desktop?
>> Can you show the lsmod output?
>> I am not quite sure how the INPUT should be related directly to the
>> GRE since the origin of the GRE(if I remember right) is from the
>> client side and not the server side.
> that's correct. The pptp devs have checked my pptp debug log and told me
> to check for lost GRE packets.
> Further testing with tcpdump shows that my pptp client is sending GRE
> packets TO the server and receiving GRE packets FROM the server.
> The issue is that using 3.18, the servers' GRE packets are dropped by
> the aforementioned rule (rule #2 below), while in 3.17 they are not.
>
> Chain INPUT (policy DROP 2 packets, 120 bytes)
> pkts bytes target prot opt in out source destination
> 0 0 ACCEPT all -- lo * 0.0.0.0/0 0.0.0.0/0
> 8 984 ACCEPT all -- * * 0.0.0.0/0 0.0.0.0/0 ctstate RELATED,ESTABLISHED
> 0 0 ACCEPT tcp -- * * 0.0.0.0/0 0.0.0.0/0 tcp dpt:22
>
> After manually inserting a rule to explicitly permit GRE (iptables -I
> INPUT 2 -p gre -j ACCEPT) before rule #2, the VPN connection works,
> because the pptp client now gets the servers' GRE packets.
>
> I (perhaps wrongly?) assume that if it's the rule "[...] ctstate
> RELATED,ESTABLISHED" that drops the servers' GRE packets with kernel
> 3.18, then the connection tracking has somehow changed between 3.17 and
> 3.18.
>
> Jan

Hello,

please always use the output of iptables -S.

This might be the reason:
http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.devel/54397/focus=54426

/lib/modules/$(uname -r)/kernel/net/netfilter/nf_conntrack_proto_gre.ko
is available as specific helper.

Best regards
Mart

