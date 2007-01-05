From: "Tom Blane" <tomblane@hotmail.com>
Subject: Destination NAT from an LKM
Date: Fri, 05 Jan 2007 16:02:27 +0000
Message-ID: <BAY101-F173439B62595972E816E8CDDBF0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi everyone, Any help or pointers in the right direction would be greatly=20
appreciated.

I have an LKM that hooks into the NF_IP_PRE_ROUTING hook for IP traffic. Th=
e=20
kernel module examines certain fields of the IP header and then makes a=20
decision as to either allow the packet on to its intended destination or to=
=20
re-route the packet to another system.

However I=91m having a problem re-routing the traffic. I can change the IP =

address but this invalidates the TCP checksum and simple won=92t work for t=
he=20
TCP handshake anyway. I=92d like to use DNAT to hold connection tracking=20
information and to handle changing IP addresses and checksums but have been=
=20
unable to use iptables for this; although I=92m not too sure why iptables=20
doesn=92t work (I think it could be something to do with the fact that both=
=20
the iptables version of DNAT and my LKM use the same NF hook, although my=20
LKM NF hook has a priority of NF_IP_PRI_FIRST).

Anyway, I guess my question is:
	Does anyone know how to implement DNAT from within an LKM?
	And if so, is it possible to just call the same functions iptables would=20
call? Or would it be necessary to shamelessly steel the code straight from =

the iptables source? Both would be fine for me!

Any pointers towards code or articles would be great.
Thanks for reading, Tom

_________________________________________________________________
MSN Hotmail is evolving =96 check out the new Windows Live Mail=20
http://ideas.live.com


