From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: [OT] Was: ESP does not hit the nat table
Date: Tue, 3 Aug 2004 08:42:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051228@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi all,
> Thanks for the reply, I know I messed up the iptables syntax - I did =
not include the chain...
>
> My main problem however was that ESP packets do not hit the nat table, =
but it does traverse mangle/filter table. Is this normal? I am mainly =
looking at SNAT/MASQUERADING ipsec traffic and I am not able to find any =
documentation on doing this, especially since there is no point in =
putting a "iptables -t nat -A PREROUTING -p 50 -j SNAT --to-source =
<me>". -p 50 means ESP as you can already guess.
> Am I missing something here? How do I masquerade ipsec traffic? =
(assuming my ipsec-VPN client/server is fine with it...)

it would be helpful if you

a) posted your rules (iptables -vxnL && iptables -vxnL -t nat && =
iptables -vxnL -t mangle)
b) explained what you're trying to do specifically
c) describe how you're testing

as far as the generic "can i nat ESP traffic with iptables" the answer =
is "surely."  i do it on one of my gateways where it's necessary for the =
LAN behind the gateway to appear differently when it goes through the =
VPN tunnel.

if i had to take a stab in the dark as to why you're having trouble--i =
would say that it's related to the fact that the outbound interface of =
your IPSec traffic needs to be specified as "-o ipsec0" (or whatever =
number your actual ipsec interface is), not ethX...

you *did* say you were using frees/wan, right?

-j

