From: arif <djreef@yahoo.com>
Subject: RE: Help with Iptables Tutorial and Port Forwarding/NAT
Date: Fri, 12 Mar 2004 09:41:16 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040312174116.93905.qmail@web10206.mail.yahoo.com>
References: <7C9884991ADAE0479C14F10C858BCDF56791EF@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56791EF@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

thanks for the reply! unfortunately though when i
added the rule, i still get no connection from the
outside... although when i watch tcpdump, i see that
the packet now gets one step further - whereas before,
i would only see it come in from the outside and get
dropped, now i see a packet sent to the internal
webserver... but in my logs i still get the same
error:=20

Mar 12 09:16:04 router IPT FORWARD packet died:
IN=3Deth0 OUT=3Deth1 SRC=3D1.2.3.4
6 DST=3D10.0.0.3 LEN=3D44 TOS=3D0x10 PREC=3D0x00 TTL=3D47
ID=3D26103 DF PROTO=3DTCP SPT=3D46322
DPT=3D80 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

the other thing i notice -  on a server where this is
working - while watching tcpdump i notice different
behavior.=20

here is basically what i see on the internal
interfaces:
1.1.1.1 =3D box on internet im trying to connect from
2.2.2.1 =3D external IP of old firewall
2.2.2.2 =3D external IP of new firewall

(old box)
eth0: <1.1.1.1> -> <2.2.2.1:80>
eth1: <10.0.0.15> -> <10.0.0.3:80>

(new box)
eth0: <1.1.1.1> -> <2.2.2.2:80>
eth1: <1.1.1.1> -> <10.0.0.3:80>

i don't even see it use the internal IP on the new
firewall (10.0.0.12) while watching the traffic.

the "old" box has a super simple rule, basically just
sets up masquerading and then forwards port 80. i hope
this makes sense to someone!  THANKS!!!!

--- Daniel Chemko <dchemko@smgtec.com> wrote:
> arif wrote:
> > Hi, I am having a hard time trying to figure out
> why
> > any packets I am trying to forward to my internal
> > network are being dropped. I am using the
> > 'rc.firewall' file that is included in the
> 'Iptables
> > Tutorial'
> >
>
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>=20
> >=20
> >=20
> > Everything is fine, except I can't get any packets
> to
> > forward to an internal webserver here. I am using
> this
> > line:
> >=20
> >=20
> > /sbin/iptables -t nat -A PREROUTING --dst 1.2.3.4
> -p
> > tcp --dport 80 -j DNAT --to-destination
> 10.0.0.3:80
> >=20
> > When I look at the packet count doing iptables -t
> nat
> > -L -v I can see the packet count go up on that
> rule,
> > every time i try and connect to port 80. But in my
> > logs, I see that it matched a logging rule, and
> shows
> > up as 'IPT FORWARD packet died", so i guess it is
> > ending prematurely in the forward chain? Any help
> > would be greatly appreciated!!! THANKS!!!
>=20
> NATing does not bypass the filter rules. So, insert
> this:
>=20
> iptables -A FORWARD --destination 10.0.0.3 -p tcp
> --dport 80 -j ACCEPT
> =20
> >=20
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Search - Find what you're looking for
> faster
> > http://search.yahoo.com=20


__________________________________
Do you Yahoo!?
Yahoo! Search - Find what you=92re looking for faster
http://search.yahoo.com

