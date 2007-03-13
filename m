From: "Joris Dobbelsteen" <Joris@familiedobbelsteen.nl>
Subject: RE: Matching packets by HTTP header "Host"
Date: Tue, 13 Mar 2007 12:15:21 +0100
Message-ID: <73427AD314CC364C8DF0FFF9C4D693FF0379EC@nehemiah.joris2k.local>
References: <45F68159.5040606@aldu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Giovanni Lovato <giovanni.lovato@aldu.net>, netfilter@lists.netfilter.org

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
>Giovanni Lovato
>Sent: dinsdag 13 maart 2007 11:48
>To: netfilter@lists.netfilter.org
>Subject: Matching packets by HTTP header "Host"
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Hi all.
>I'm trying to forward packets to different hosts depending on=20
>the "Host"
>header in HTTP packets, e.g. packets on port 80 requesting "Host:
>one.example.org" to 192.168.0.1 and all other on port 80 to=20
>192.128.0.2.

This processing is at a too high level for NetFilter (without proper
extensions).
You should rather use a HTTP proxy, like squid or apache with proxy
module, for this operation. These are capable of handling such requests.

>I did:
>iptables -t nat -A PREROUTING -p TCP -i eth0 -m string --algo bm
>- --string "Host: one.example.org" --destination-port 80 -j DNAT
>- --to-destination 192.168.0.1
>
>iptables -t nat -A PREROUTING -p TCP -i eth0=20
>--destination-port 80 -j DNAT --to-destination 192.168.0.2
>
>But all packets are going to 192.168.0.2. Do I miss something?

The problem is that at connection-time there you cannot make the choice
to which server you must connect. This can only be decided when you are
already connected.

- Joris


