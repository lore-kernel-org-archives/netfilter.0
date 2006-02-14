From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: ipsec and iptables
Date: Tue, 14 Feb 2006 14:39:16 +0100
Message-ID: <BAY103-F18B52DF78B9CA5C62F9698B2060@phx.gbl>
References: <43F08DAA.5070804@dawin.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F08DAA.5070804@dawin.de>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stallmann@dawin.de
Cc: netfilter@lists.netfilter.org


Andreas Stallmann wrote:

>Hello,

Ciao.

>3. $IPTABLES -A INPUT -i ipsec0 -d $INTERNAL_NET -j ALLOW
>How do I write rule no. 3 now, without ipsec interfaces at hand?

Here is an example: policy match is much more flexible than ipsecX
virtual interface. You can even select ipsec traffic from different
gateway.

iptables -A FORWARD -m policy \

--dir in \ this is for select inbound/outbound traffic

--pol ipsec \ this match if traffic is subject to IPsec processing

--mode tunnel \ this is if you want to match tunnel mode

--tunnel-dst 172.16.1.247 --tunnel-src 172.16.1.226 \
             ^^^^^^^^^^^               ^^^^^^^^^^^^
These are the ipsec endpoint addresses (usually public ip addresses)

-s blablab -d $INTERNAL_NET --protocol blabla --dport blabla \
what you want to do with this rule

-j ACCEPT (or DROP)

>OK, let's do some naive painting. In the following picture, my packet "X" 
>has passed the rules 1 and 2 on the INPUT chain, allowing it to pass 
>through to the OPENSWAN-Software. It got authenticated by openswan and is 
>now passed back to the iptables stack.

No. Openswan has nothing to do with this schema. Openswan (when used
with netkey) is only an IKE daemon.

>outside------->FORWARD--------->inside
>        |                    |
>      INPUT                OUTPUT
>        |_____(OPENSWAN)_X___|
>

>Or is it passed back to the forward chain, because after "unwrapping", it's 
>header identifies it as a packed coming from an external private subnet, 
>being directed to a internal private subnet?

Yes.



