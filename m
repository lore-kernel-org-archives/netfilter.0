From: =?ISO-8859-2?Q?Vlado_Dr=BE=EDk?= <vlado@ttx.sk>
Subject: Iproute2: tc + iptables actions
Date: Fri, 28 Nov 2008 22:36:13 +0100
Message-ID: <4930644D.7060006@ttx.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,

I've tried the setup with kernel 2.6.26.3 and with iptables 1.4.2 and
latest iproute2 from git and I've been not able to get tc to work with
ipt actions. I've seen some threads that there is a problem with recent
iptables and tc is not yet prepared to integrate properly.

Do someone have patches available to iproute2/iptables to integrate it
or is this another dead feature?
How is it possbile to get actions work with tc?

This is what I get. Example:

./tc filter add dev eth0 parent ffff: protocol ip prio 10 u32 match ip
src 10.1.1.141 flowid 1:1 action ipt -j CLASSIFY --set-class 1:10
/lib64/xtables/libxt_CLASSIFY.so: undefined symbol: classify
 failed to find target CLASSIFY

bad action parsing
parse_action: bad value (5:ipt)!
Illegal "action"


PS: I've tired to write to LARTC mailing list but it seems dead for a
long time. I'm hoping that here it could be maybe better place.
--
Regards,
Vlado

