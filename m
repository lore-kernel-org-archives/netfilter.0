From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: locally access server behind firewall
Date: Wed, 1 Sep 2004 11:20:55 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794D2@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Deepak Seshadri <dseshadri@broadbandmaritime.com>, Tom <tom@tomdp.com>, netfilter@lists.netfilter.org

Deepak Seshadri wrote:
> Hi Tom,
>=20
> I think your Apache server is expecting connections on port 80 & your
> Nat'ing will occur only if the packet comes in form the $WWW
> interface. Since you are on the local LAN the packets are not Nat'ted
> and hence you get the connection refused from the server as it is
> getting requests on a port where no application is listening.
>=20
> You don't need any rule, just type http://myserver.com within the LAN.

Problem:

You root problem is that your resolving myserver.com as an intrernet
address. The client connects to the GW (linux) in order to get routed to
the box. The linux machine passes the connection request on to
${internal_www} server without making any changes. The Server reads the
client's source address (knowing its in the internal network) and passes
it back to the client directly. So, your route  now looks like this:

Client->Firewall->Server->Client

THIS DOES NOT WORK
The every packet after the SYN will be tossed because the firewall never
received the corresponding SYN-ACK packet from ${internal_www}


Solution:

There are two ways to accomplish this: The right way and the wrong way.
The easiest way is just to implement the lines below.
=09
	iptables -t nat -A POSTROUTING --destination ${internal_www} -p
tcp --dport 80 -j SNAT ${internal_gw_ip}
	# In case this isn't covered by other rules, you need a loopback
rule for that network interface
	iptables -A FORWARD -i ${internal_if} -o ${internal_if} -j
ACCEPT

The other solution is to use Split DNS. Where myserver.com resolves to
an internal DNS address like 192.168.1.1 instead of 24.1.1.1. There's a
lot of information about split-dns on the internet. I'm not going to
repeat it here again and again...


