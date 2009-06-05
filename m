From: Rakotomandimby Mihamina <mihamina@gulfsat.mg>
Subject: DNAT vs REDIRECT
Date: Fri, 05 Jun 2009 13:01:44 +0300
Message-ID: <4A28ED08.3090104@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
On my gateway, I usually made a
   -A INPUT ... -dport 80 ... -j REDIRECT 192.168.x.y:80
In order to reach the webserver located on the LAN.
What would be the difference if I use a DNAT instead?

What's the diferences between those?

--=20
Architecte Informatique:
Administration Syst=E8me, Recherche et D=E9veloppement.
Phone: +261 33 11 207 36
