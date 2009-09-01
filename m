From: Diogo Sperb Schneider <vonsperb@live.com>
Subject: RE: Routing HTTP Through Another Link
Date: Tue, 1 Sep 2009 19:42:33 +0300
Message-ID: <BLU116-W2A7824EB05C8C413B3AA3A2F10@phx.gbl>
References: <BLU116-W25EED7BAB4A40766109367A2F20@phx.gbl>
	<20090901075506.478a8a6c@catlap>
   	<BLU116-W61B4883A90045AEF7BDB6A2F10@phx.gbl> 
   <20090901135848.793936a7@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090901135848.793936a7@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Hello, Marek!

> iptables -t mangle -A PREROUTING -i LAN_INTERFACE -m multiport --dpor=
t
> 80,443 -j ROUTE --oif WWW_ONLY_LINK
> iptables -t nat -A POSTROUTING -o WWW_ONLY_LINK -j MASQUERADE

I tried that, adding "-p tcp" on the first command, because iptables co=
mplained about it.

It didn't work, making my navigation completely stop. I don't get insta=
nt errors from the browser, but it tries to connect endlessly.

I've tried tuning a few rules and changing orders with the existing rul=
es for the main link, but the result is the same. I'm kinda clueless ab=
out what to do next, so if you have any more tips I'd really appreciate=
=2E

By the way, the web interface doesn't allow me to specify the --oif opt=
ion, just --gw so I have set it to the gateway of the alternative link.=
 I thought the basic routing table should take care of the rest.

PS: I've just realized our conversation has gone off the list, so I'm p=
utting it back on it again.

_________________________________________________________________
Voc=EA sabia que com o Hotmail voc=EA tem espa=E7o ilimitado para guard=
ar seus e-mails? Come=E7e a usar j=E1!
http://www.microsoft.com/brasil/windows/windowslive/products/hotmail.as=
px