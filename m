From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 13:42:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4093E190.8020308@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405010819.30079.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405010819.30079.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Saturday 01 May 2004 3:52 am, Andrew E. Mileski wrote:
> 
>>I'm observing lost packets when a gateway doing NAT also locally hosts
>>a server for DNS or NTP.  I believe this the result of the ambiguous
>>conditions that can exist when routing server-to-server packets coming
>>into the gateway.
> 
> Show us your rules and explain what is ambiguous about them?

There is only one rule needed if all other defaults are ACCEPT:

This one is on my network:
iptables -t nat -A POSTROUTING -s ! $WAN_IP -o $WAN_IFC -j SNAT 
--to-source $WAN_IP

This one is on another network with the same problem:
iptables -t nat -A POSTROUTING -s $INTERNAL_NET -j MASQUERADE

Both DNS and NTP server-to-server UDP packets have the same source
and destination ports.  What I am seeing is a failure to remap the
source port on outgoing packets when a local server is running on
the gateway.

I speculate this is because an idle local server without an active
connection doesn't have an entry in the connection table.  Though
I've also seen failures with an active local server, but I haven't
got a good theory on the mechanics behind it yet.

I have seen port remapping in some situations, so I know that
feature works.  It just isn't being triggered in some situations,
which I can't yet reason why.

As an aside, I think (S?)NTP pays attention to the source port, so
a port remap may have side effects for this protocol.  This isn't
a concern of mine though.

-- 
Andrew E. Mileski

