From: Carlos Ble <carlosble@terra.es>
Subject: Re: Netmeeting and messenger ports
Date: Tue, 13 May 2003 17:53:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305131753.57809.carlosble@terra.es>
References: <002d01c31958$835ecb30$f000010a@pc207pca>
Reply-To: carlosble@terra.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002d01c31958$835ecb30$f000010a@pc207pca>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Pedro C. Arias" <parias@sede.unr.edu.ar>
Cc: netfilter@lists.netfilter.org

El Martes, 13 de Mayo de 2003 15:04, Pedro C. Arias escribi=F3:
> Hello, I use NAT to connect internet my internal network trougth a Firewa=
ll
> make with iptables, i use NAT, but when somebody external to my network
> send me a file messenger say "Error to receive File ...." somebody has th=
is
> problem ?, with netmeteeng too can't connect
>
> Help me ...
>
> Thanks
> Pedro
> Rosario - argentina

Hi Pedro. I think that we both can talk in spanish but let me write in
english to let people to correct to me if im wrong.
There are some problems with microsoft pptp that maybe corrected with
the linux pptp. Loock for it in google.
=46or netmeeting and messenger you must open some ports. One solution is
to do DNAT to a specified internal address. This is a example:

# Neetmeeting ports:
iptables -t nat -A PREROUTING -p tcp --dport 389 -i <interface> -j DNAT \
=2D-to 192.168.0.20
iptables -t nat -A PREROUTING -p tcp --dport 522 -i <interface> -j DNAT \
=2D-to 192.168.0.20
iptables -t nat -A PREROUTING -p tcp --dport 1503 -i <interface> -j DNAT \
=2D-to 192.168.0.20
iptables -t nat -A PREROUTING -p tcp --dport 1720 -i <interface> -j DNAT \
=2D-to 192.168.0.20
iptables -t nat -A PREROUTING -p tcp --dport 1731 -i <interface> -j DNAT \
=2D-to 192.168.0.20

# Messenger ports:
iptables -t nat -A PREROUTING -p tcp --dport xxxxx -i <interface> -j DNAT \
=2D-to 192.168.0.20

This corrects the problem for one user but the problem still when many
users wants to use netmeeting. Nowdays im loocking for a solution too.

Suerte.

