From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: FreeSWAN and NAT
Date: Fri, 7 Feb 2003 17:08:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302071708.44875.netfilter@newkirk.us>
References: <Pine.LNX.4.33.0302041713580.13477-100000@battalion.nexxis.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0302041713580.13477-100000@battalion.nexxis.net>
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
To: llee@battalion.nexxis.net, netfilter@lists.netfilter.org

On Tuesday 04 February 2003 08:20 pm, llee@battalion.nexxis.net wrote:
> Hi,
>
> I wish to create a FreeSWAN VPN connection between two NAT boxes using
> iptables.  I have FreeSWAN configured correctly, but when I attempt to
> ping one internal machine from the other network, the packets get
> mangled by what I assume to be NAT.  Source Host sends out 4 icmp
> packets at 504 bytes, and the Target Host receives 4 packets at 240
> bytes.
>
> The way I have the iptables scripts set up is on each box like this:
>
> iptables -t nat -A POSTROUTING -o eth0 -s $IP_RANGE_A -d $IP_RANGE_B
> -j ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $INET_IP
>
> the only difference being the swapping of the IP_RANGES depending upon
> which box it's on.  I am still getting the same results.  I am trying
> to get all VPN-ed packets to bypass the NAT statement, but it appears
> that my statement is not working.  Is there another way to get those
> VPN packets through without getting mangled?

First, I've never worked with passing VPN through iptables.  Second, I=20
have doubts whether the SNAT is the cause of the problem, seeing that=20
you lose roughly 50% of the packet.  Nevertheless, since it appears=20
there have been no other replies to your query, I offer the following:

First, use "iptables -t nat -Z" to zero the counts, try your connection,=20
then use "iptables -t nat -L -v -n" and check if the number of packets=20
matching each rule are what you expect them to be.

Try the following rules to bypass SNAT for those connections:

iptables -t nat -A POSTROUTING -o eth0 -s $IP_RANGE_A -d ! $IP_RANGE_B
-j SNAT --to $INET_IP
iptables -t nat -A POSTROUTING -o eth0 -s ! $IP_RANGE_A -d ! $IP_RANGE_B
-j SNAT --to $INET_IP
iptables -t nat -A POSTROUTING -o eth0 -s ! $IP_RANGE_A -d $IP_RANGE_B
-j SNAT --to $INET_IP

Of course if $IP_RANGE_A represents the full addressspace that could come=
=20
through this rule as a sourceIP going out eth0, OR if the only=20
connections to IP_RANGE_B would be VPN regardless of source, only the=20
first rule is needed (and the "-s" part is redundant then).  If the only=20
traffic out of IP_RANGE_A AND the only traffic going to IP_RANGE_B would=20
be VPN you only need the second one.  All three taken together will SNAT=20
everything except traffic that is from IP_RANGE_A AND to IP_RANGE_B. =20
(However, I would have expected your two rule above to accomplish=20
this...)

Multiple matches in a single rule are always a logical AND, so you have=20
to pay attention with multiple NOTs involved as well.

If this isn't a solution I'd suggest the following three approaches:

Examine the actual contents of the packets, both pre-firewall at sender=20
and post-firewall at receiver, and see if you can discern what is=20
happening to the missing ~50%, and see if IP's are intact and as=20
expected.

Disable SNAT and test it.  (since apparently this connection is possible=20
without SNATting, just remove the SNAT entirely for testing purposes)

If the opportunity exists, try the same configuration but with the two=20
NAT boxes simply plugged into a mutual hub, to ensure that nothing else=20
between them is the source of the problem.  (If they are at quite=20
disparate locations, just replicate the setup of the remote box on a=20
local one for the testing, perhaps ghost the local box to a=20
similarly-configured box and replicate the iptables setup)

j

> I appreciate any help in advance.
>
> Thanks,
> Lonlone


