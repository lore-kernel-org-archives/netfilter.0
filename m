From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Masquarede stalls?
Date: Tue, 10 Aug 2004 15:13:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051264@asimail2.alphanumeric.com>
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

> Unfortunately "tcpdump -n -nn -p -i ppp0 icmp" gives nothing (I hope i =
did it well :)).
> (what is -nn ? I cannot find that in the manpage.)

       -n     Don't convert host addresses to names.   This  can  be  =
used  to
              avoid DNS lookups.

       -nn    Don't convert protocol and port numbers etc. to names =
either.

guess that depends on the specific tcpdump you have...

>
> Are you sure this is a ICMP related problem? I can ping everything =
very quickly and correctly from the internal net. The things go wrong =
somewhere during the connections. :-( However you must be right, im not =
guru.
>

it's not an ICMP problem--it's a TCP problem.  the error message that =
tells you there is a TCP problem is an ICMP packet, however...

>
> And whats  that clamp-mss-to-mtu thing ? :)
>

you can try adding:

  iptables -I FORWARD -i $INTERNAL_IF -p tcp --syn -j TCPMSS =
--clamp-mss-to-pmtu
-OR-
  iptables -I FORWARD -i $INTERNAL_IF -p tcp --syn -j TCPMSS --set-mss =
1400

to your test scenario to see if that fixes your problem.  if i recall =
correctly, MSS =3D MTU - 40.  if you have an MTU issue--you're best bet =
is to play around with tcpdump and different values of "--set-mss" until =
you don't have the problem anymore (unless "--clamp-mss-to-pmtu" =
magically works for you--it didn't for me).

-j

