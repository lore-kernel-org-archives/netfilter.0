From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: [PATCH-2.4-POM] NF_REPEAT was ignored !
Date: Wed, 22 Oct 2003 12:42:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E101199092@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Willy Tarreau <willy@w.ods.org>
Cc: netfilter list <netfilter@lists.netfilter.org>

Hi,

There are quite recent changes to the tcp-window-tracking patches. You =
can
look them up on the CVS interface to p-o-m at the netfilter site:
http://cvs.netfilter.org/netfilter/patch-o-matic/extra/tcp-window-trackin=
g.patch
I haven't checked if they include a solution to your problem, but maybe =
you
can. (My knowledge of C is... rather limited ;)

Also, I was wondering if this might not be better suited for the =
developer
list?

Regards,

Gaby Schilders
IBFD network admin

-----Original Message-----
From: Willy Tarreau [mailto:willy@w.ods.org]
Sent: woensdag 22 oktober 2003 12:26
To: Jozsef Kadlecsik
Cc: Harald Welte; netfilter@lists.netfilter.org; Netfilter Development
Mailinglist
Subject: [PATCH-2.4-POM] NF_REPEAT was ignored !


Hi,

after updating the production firewalls to handle the CW->CL state, I =
saw the
rate of drops decrease, but not as much as I would have expected it to.

I captured lots of data (/p/n/ip_conntrack, logs, tcpdump) and =
discovered
another problem with tcp_window_tracking that I could easily reproduce =
on
a lab : if a client reused a port too early, then the SYN/ACK from the
server was dropped, and the client could only connect after the next SYN
retransmit. I simply checked it with nc -p 1234 server 80. The first one
succeeds immediately, the second one needs 3 seconds to establish. There
is a logical explication to this :

The client completes a first connection to server:80 with spt=3D1234. A =
few
seconds later, he reuses the same port to initiate a new connection to =
the
server. The firewall still sees the connection in TIME_WAIT state, so =
its
state matrix switches it to SYN_SENT  (orig:sTW--(SY)-->sSS).

In ip_conntrack_proto_tcp.c:tcp_packet(), there is a test for this case. =
The
existing session is deleted and NF_REPEAT is returned so that the caller =
tries
again (here, ip_conntrack_core.c:ip_conntrack_in()). This one simply =
returns
the same code NF_REPEAT to its caller which will call it again =
(nf_iterate()).

The problem is that once ip_conntrack_in() is called again with the same =
pskb,
it already has its ->nfct filled, so ip_conntrack_in() immediately =
returns
NF_ACCEPT without doing any lookup. The result is that the SYN is passed =
to
the server, and the deleted session is not recreated. When the server =
replies
with a SYN/ACK, this one has no matching session it is blocked by the =
firewall
rules. Then, 3 seconds later, the client retransmits its SYN, which =
reaches
the firewall without any matching session, and correctly initiates a new =
one.

The solution is to correctly clear the ->nfct field in ip_conntrack_in() =
if
we return NF_REPEAT. This is what the following patch does. It's to be =
applied
to 2.4+POM-20030912, but I'm confident it may be easily applied and/or =
ported
to later versions.

I've not checked yet if the mainline conntrack code is also affected, =
but this
could be possible.

Regards,
Willy


--- ./net/ipv4/netfilter/ip_conntrack_core.c.orig	Tue Oct 21 14:21:08 =
2003
+++ ./net/ipv4/netfilter/ip_conntrack_core.c	Tue Oct 21 16:14:53 2003
@@ -856,6 +861,14 @@
 	IP_NF_ASSERT((*pskb)->nfct);
=20
 	ret =3D proto->packet(ct, (*pskb)->nh.iph, (*pskb)->len, ctinfo);
+
+	if (ret =3D=3D NF_REPEAT) {
+		/* we must loop here again */
+		nf_conntrack_put((*pskb)->nfct);
+		(*pskb)->nfct =3D NULL;
+		return ret;
+	}
+
 	if (ret =3D=3D -1) {
 		/* Invalid */
 		nf_conntrack_put((*pskb)->nfct);




