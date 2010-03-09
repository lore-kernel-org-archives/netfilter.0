From: "Marco Schuth" <marco@it-schuth.net>
Subject: transparent proxy
Date: Wed, 10 Mar 2010 00:44:14 +0100
Message-ID: <21B7BA85E0A248919216BC6546842EFB@sence>
Reply-To: "Marco Schuth" <marco@it-schuth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org


Hello,

Iam using iptables on my router, and have a dedicated proxy server with=
=20
squid sarg and squidguard running.

all the clients send the request for a website to the default gw (route=
r=20
10.12.0.1) the router redirects (dnat)
the package to the proxy server ip:10.12.0.250
but in the logs i get the ip from the router.

so squid guard doesent work and the squid analytic didn=B4t work becaus=
e it=20
shows only the ip from the gw (router) with all requestet pages.

how can i change this, that i get in the logs the original ip of the cl=
ients=20
?

-----------------------
maybe: snat with the original ip, but how? and make a second entry in t=
he=20
proxy to send all packets back to the proxy ?

no idea.

thanks 4 you help!!!=20

