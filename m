From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Using firewall builder with iptables
Date: Fri, 21 Jul 2006 09:41:05 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127CC@knowledge.wizdom.nu>
References: <44C03CBD.3030202@tournet.com.ar>
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
To: sisdis@tournet.com.ar, "Netfilter (lista)" <netfilter@lists.netfilter.org>

I beleive this is an option you can set somewhere within fwbuilder.
=20
Better ask this question on the fwbuilder forums. They should know...
=20
BTW, your problem might have to do with published arp entries, though =
the fwbuilder generated script should take care of these. Anyways ask =
the people over at fwbuilder.org.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Alejandro =
Cabrera Obed
Sent: Fri 21-Jul-06 4:32
To: Netfilter (lista)
Subject: Using firewall builder with iptables



Dear all,

I'm building a firewall with Firewall Builder (fwbuilder) for
linux/iptables....I'm sure that my NAT and filtering rules using virtual
addresses for accesing my public servers from Internet are OK, but it
doesn't work.

I see that I consider that my firewall is NOT part of "Any", because I
consider Any =3D Internet, but I'm not sure if I'm right.

Can you tell me when do I have to consider my firewall as part of "Any"
using the Firewall Buildewr interface ??


Thanks a lot,


Alejandro




