From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec Transport Mode
Date: Wed, 7 Jul 2004 14:53:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071453.49223.Antony@Soft-Solutions.co.uk>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
Reply-To: NetFilter Mailling List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

On Wednesday 07 July 2004 2:35 pm, Arnst, Rainer wrote:

> Hello,
>
> I have a question regarding IPSec in Transport Mode and IPTables. I must
> admitted my knowledge concerning IPSec is quite limited and so far what
> I have heard about IPSec's transport and tunnel mode is not really clear
> to me.

The difference (as far as it relates to nat) is quite simple, really:

Tunnel mode takes the original packet (TCP/IP, UDP/IP, ICMP/IP or whatever) 
and "encapsulates" it inside a completely new packet (protocol ESP = 
Encapsulated Security Payload), and that new packet gets its own completely 
new IP header (the original packet's IP header, with source & destination 
addresses, is inside the ESP payload).   The source & destination IPs on the 
ESP/IP header can be natted all you like; so long as they get to the remote 
Security Gateway, it will unpack the ESP packet, find the original IP 
headers, and send the original TCP / UDP / ICMP / whatever packet on to where 
it belongs.

Transport mode takes the original packet (TCP/IP, UDP/IP, ICMP/IP or whatever) 
and calculates a checksum over almost all of it, including the source & 
destination IP addresses, and then sends it (still with the original IP 
header, except for the fact that it's now protocol AH instead of TCP or UDP 
etc inside the IP packet), to the destination.   If you change the source or 
destination addresses along the way, then the checksum doesn't agree when it 
gets validated at the receiving end, so the secure link breaks (ie: doesn't 
work).

> Usually, as far as I understand, transport mode is not an option here
> because of NAT being performed by the "Firewall"/Gateway.

Indeed.

> Using MS NAT-T works fine, but we want to switch to something non-MS
> soon (hopefully real soon). So it's not really an option.
>
> With this Setup, is there anything that can be done with IPTables to
> make the transport mode work w/o NAT-T?

I can think of two ways:

1. Put a genuine public IP address on the destination Security Gateway 
machine, routed through the firewall without nat.

2. Perform nat twice so that the packet as received by the SG is exactly as it 
was sent, even though it may have been natted (and then un-natted) along the 
way.   This almost certainly involves putting a public IP on the remote SG, 
and having two firewalls to perform the two nat operations.

Regards,

Antony.

-- 
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


