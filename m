From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 16:54:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031165427.1c8781b0.netfilter@schuetter.org>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70843@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70843@u.library.Arizona.EDU>
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
To: netfilter@lists.netfilter.org

Hallo Yan,

On Thu, 30 Oct 2003 17:12:47 -0700
"Han, Yan" <hany@u.library.arizona.edu> wrote:

>=20
> Hi!=20
>=20
> I am using IPTables to do some re-routing tests. Basically I try to
> re-route the traffic from one box to another box. But it failed (not
> forwarding, but timeout). Can anyone point to what errors about my
> script.  p.s. I did open forward (net.ipv4.ip_forward =3D 1) in Linux.
>=20
>=20
> #set the dafault policies;=20
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
>=20
> # what is wrong ??
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 --dport 80=
 -j
> DNAT --to 150.135.45.96

what is the ip address of the firewall?
Is there a route which says that net 150.135.44.0/24 (or similar) is

Gru=DF
  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


