From: Damien Mason <damien@suse.net.au>
Subject: Re: http access - fixing DNAT port forwarding access from internal
 networks.
Date: Fri, 21 Nov 2003 09:39:54 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBD42BA.4000504@suse.net.au>
References: <1069364822.3fbd3656723b4@roma-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: skydive <skydive@megamail.pt>, netfilter@lists.netfilter.org

you need an SNAT rule in there too.

iptables -t nat -A POSTROUTING -p tcp --dport $PORT -s=20
$INTNETWORK/SUBNET -d $INTIPSERVER -j SNAT --to-source $INTIPFIREWALL

eg.
iptables -t nat -A POSTROUTING -p tcp --dport 80 -s 192.168.0.0/24 -d=20
192.168.0.1 -j SNAT --to-source 192.168.0.254
(assuming .254 is your firewall and .1 is your webserver)


skydive wrote:

>hi all
>
>i have been experienced a problem since i'm trying to
>access my web server from my lan through my internet ip.
>=20
>i have no problems doing DNAT, from those who access my
>web page form the outside:
>
>iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80
>-j DNAT --to 192.168.0.1:80
>
>this is solving the problem
>
>let's say my web page has the following address
>www.example.org, and that it is host  [like it is ;)) ]
>in one machine on my lan with the following IP:
>
>192.168.0.1
>
>when i write www.example.org on my web browser, it just
> hits eth1 on my gateway/firewall and stucks there.
>maybe i'm missing something on my prerouting rules, or
>maybe my small brain just can't reach it :)
>
>the way i see it, when i put www.example.org on my web
>browser, i send i request to my gateway, and it was
>supposed to take it back to my lan, where the site is
>hosted.
>
>not working though...
>
>can somebody please help with these missing rules?! or
>is it just something else i'm missing?
>
>thanks to those who took the time to ride all this
>garbage and i'm greatfull even if you are not able to
>help whatever your reason is ;)))
>
>[][] * * *
>skydive!
>
>-------------------------------------------------
>Email Enviado utilizando o servi=E7o MegaMail
>
>
> =20
>

--=20
Damien Mason
SuSE Systems Specialist

http://www.suse.net.au./
damien@suse.net.au

SuSE Linux Asia-Pacific Pty Ltd
Ph: +61 (2) 943 943 94
Fax:+61 (2) 9437 38 39




