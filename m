From: Andrew Kraslavsky <andykras@hotmail.com>
Subject: match for limit on bytes per second?
Date: Fri, 2 Oct 2009 01:46:43 -0700
Message-ID: <COL115-W26948C4C123AB36007B7C7D6D20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Hello,
=20
I am looking for a way to throttle throughput:
=20
1) globally as opposed to per interface
=20
- AND -
=20
2) in terms of bytes (or bits) per second as opposed to in terms of pac=
kets
=20
Since the goal is a global limit and not a  per interface limit, as use=
ful and powerful as tc is, tc does not appear to be an option so I am w=
ondering if there is a way to do this using an iptables match.
=20
The closest match I have found is the "limit" match but it seems to onl=
y deal with traffic at the packet level.
=20
Is there an alternate match that can basically do what "limit" does (no=
t necessarily using a token bucket filter implementation but that would=
 probably be best) except in terms of bytes per second?
=20
Thanks,
=20
- Andrew 		 	   		 =20
_________________________________________________________________
Microsoft brings you a new way to search the web.  Try  Bing=99 now
http://www.bing.com?form=3DMFEHPG&publ=3DWLHMTAG&crea=3DTEXT_MFEHPG_Cor=
e_tagline_try bing_1x1