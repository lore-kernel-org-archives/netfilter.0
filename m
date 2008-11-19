From: sriliam <sriliam@free.fr>
Subject: How to make NFQUEUE ?
Date: Wed, 19 Nov 2008 20:28:30 +0100
Message-ID: <1227122910.6445.14.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

Some days ago, I present a question and I been oriented to NFQUEUE.
Ok ... but how does it work ?

Really strange behavior.



Data :

I said : "~# iptables -I INPUT -j NFQUEUE".

So, I suppose that I will have all packets of INPUT filter table playin=
g
with NFQUEUE : am I wrong ?

Next, I rely this to some example programs in order to ACCEPT the
packet, like from net-perl-bindings : I made a network mirror like.



Questions :

=46irst, not all packets get through NFQUEUE : with perl and more
dramaticaly with C too.

Second, not all packets get the policy ACCEPT, so my browser don't get
images ... but only text, perfectly indeed. Is there a way to get ACCEP=
T
on an handler that have no lenght ?

If someone know about this, I would happy to read an HowTo.

Thanks, best regards.
S=C3=A9bastien Major

