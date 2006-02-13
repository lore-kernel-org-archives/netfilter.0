From: Andreas Stallmann <stallmann@dawin.de>
Subject: ipsec and iptables
Date: Mon, 13 Feb 2006 14:46:18 +0100
Message-ID: <43F08DAA.5070804@dawin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

this is somehow a continuation of a thread I started in 
lists.openswan.org, which was probably a little bit off-topic there, and 
  might be more on topic here, as it is mainly iptables related.

The short story:

I'm looking for for in-depth documentation for the iptables "ipsec 
policy match" module. It might be just the right thing to solve my 
iptables/ipsec-problems; but the information given with "iptables -m 
policy -h" is not very intuitive.

The long story:

In the good old times of super-freeswan and kernel 2.4 I was a happy 
user of ipsec interfaces. These allowed me to define rules like that:

1. $IPTABLES -A INPUT -p udp --dport isakmp -d $FIREWALL_EXT_IP -j ALLOW
2. $IPTABLES -A INPUT -p esp -d $FIREWALL_EXT_IP -j ALLOW
3. $IPTABLES -A INPUT -i ipsec0 -d $INTERNAL_NET -j ALLOW

(All with stateful inspection switched on.)

This, filtering traffic based on the fact, that it came from the ipsec 
interface and thus was "authenticated" somehow, is something I miss in 
the current OpenSWAN implementation (and, yes, the compilation of the 
module fails with the current 2.6 kernel).

Thus I allow all AH/ESP-traffic to the firewall, like above in 1. and 2.
How do I write rule no. 3 now, without ipsec interfaces at hand? How do 
I filter what's originating from the ipsec-stack, and is directed to the 
local net? I allready know, that the "ipsec policy match" module might 
bring me further, I even received a suggestion for a rule:

 > $IPTABLES -A FORWARD  -m policy --dir in -i eth2 --pol  ipsec \
 > -m state --state NEW  -j ACCEPT

OK, let's do some naive painting. In the following picture, my packet 
"X" has passed the rules 1 and 2 on the INPUT chain, allowing it to pass 
through to the OPENSWAN-Software. It got authenticated by openswan and 
is now passed back to the iptables stack.

outside------->FORWARD--------->inside
        |                    |
      INPUT                OUTPUT
        |_____(OPENSWAN)_X___|

How would the firewall rule look, that allowed the packet to go right 
through to my internal net? Like stated above? What I do not understand, 
is that the rule is appending to the FORWARD chain, but isn't the packet 
coming from the inside of the firewall, because it has passed an 
internal process, and thus should append to the OUTPUT chain? Or is it 
passed back to the forward chain, because after "unwrapping", it's 
header identifies it as a packed coming from an external private subnet, 
being directed to a internal private subnet?

And is the packet somehow "marked" by openswan, so that iptables "knows" 
it passed through? How does this whole "match policy" stuff actually 
work, by the way?

I allready read through most of the HOWTOS on netfilter.org again; but 
as of now, I did not find anything related to my problem.

Well, folks, I know I deserve a RTFM - but please let me know, where I 
find the FM! Now it "pays back", that I haven't done IPSEC on the 
commandline for such a long time (I'm using fwbuilder, silly me!). :-(

Thanks in advance,

A.
-- 
dawin GmbH - Andreas Stallmann - Consultant
http://www.dawin.de

