From: "Higuera, Antonio" <ahiguera@broadnet.es>
Subject: cannot outgoing smtp with snat
Date: Fri, 24 Sep 2004 10:38:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <89045C600CF2D74F8B98B9A25B1E9D850488F5@procor.internal.broadnet.es>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,
I have a linux iptables fw with two interfaces: internal and external
(nating the internal traffic) with a public ip. In the internal
interface I have a ms exchange server that forward all the external mail
to the firewall via smtp.
- After setup the linux fw I had a cisco router nating the traffic to
internet and everything went fine. It seems therefore that the exchange
server works properly.
- With the linux machine everything works fine unless the outgoing
smtp.I can telnet the port 25 of the external server but something
happen once the smtp protocol has begun. In fact I can see with a
sniffer that the protocol stop when the external server send back DATA.
In this moment the local exchange stop of sending and the timeout is
reached.
- I tested other smtp applications to send out messages and work fine
with iptables. But what happens with exchange?: works with cisco but not
with iptables!! It's crazy!!!
Any ideas?
Thank you for your help


Antonio Higuera=20


broadnet, conectamos las ideas=20
Edificio Europa III: c/ San Rafael, 1-3.3=BA
28108 Alcobendas- Madrid
Tel. +34 91 334 36 00
Fax. +34 91 334 81 98
www.broadnet.es=20




