From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Round Robin Load Balancing
Date: Tue, 29 Jul 2003 08:50:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E35ED@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Javier Govea <jgovea@magma.ca>, George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

Found a note in the patch:

/* Send the packet. This will also free skb
+		 * Do not go through the POST_ROUTING hook because=20
+		 * skb->dst is not set and because it will probably
+		 * get confused by the destination IP address.
+		 */

Maybe try the ROUTE command in FORWARD instead. Hey, why not even try
PREROUTING.

-----Original Message-----
From: Javier Govea [mailto:jgovea@magma.ca]=20
Sent: Tuesday, July 29, 2003 8:39 AM
To: George Vieira; Javier Govea
Cc: netfilter@lists.netfilter.org
Subject: RE: Round Robin Load Balancing

Hi guys,

Well, i tried with only the SYN packets (my rules are below) and still
nothing. My hosts
cannot access the net. Any more ideas???=20

Here are are my rules (if they are wrong, please correct me):

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ip-of-ppp0>
.

iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 -p tcp
--syn \
	-j ROUTE --oif ppp0
.

Thanx...
Xavier



On Jul 29, "George Vieira" <georgev@citadelcomputer.com.au> wrote:
>=20
> probably because you should be doing that on the SYN packet ONLY.. not
on any packet
because it'll send 1 connection across multiple interfaces...
>=20
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>=20
> Citadel Computer Systems Pty Ltd
> <a
href=3D'http://www.citadelcomputer.com.au'>http://www.citadelcomputer.com=
.
au</a>
> =20
>=20
> -----Original Message-----
> From: Javier Govea [mailto:jgovea@magma.ca]
> Sent: Tuesday, July 29, 2003 7:15 AM
> To: Chris Wilson; Javier Govea
> Cc: Daniel Chemko; George Vieira; netfilter@lists.netfilter.org; Ramin
> Dousti; netfilter@lists.netfilter.org
> Subject: Re: Round Robin Load Balancing
>=20
>=20
> Hi guys,
>=20
> Thanx for all your suggestions, but i have bad news. The rules you
guys are suggesting=20
> make a lot of sense to me but they don't work. My hosts still cannot
surf the net.=20
>=20
> This rule:
>=20
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source
<ip-of-ppp0>
>=20
> is another form for the masquerade rule:
>=20
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>=20
> Using either of these two rules my hosts can access internet, but i
still have the=20
> problem of the load balancing. Some ppp links are used more than
others in situations=20
> such as loading the same web page in four different browsers.
>=20
> As soon as i add the "nth" rules to the mangle table my browsers stop
working, they just=20
> can contact the web servers and eventually they time out. I'm not sure
if by adding any=20
> rule to my mangle table the browsers stop, but at least they stop when
i add your=20
> suggestions to the mangle table.
>=20
> Any other ideas, suggestions, tips?? all are very welcome...
> Thanx to all, i really appreacite all your time and interest....
> Xavier
>=20
>=20
> >=20
> > Try something like this:
> >=20
> > iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 0 \
> > 	-j ROUTE --oif ppp0
> > iptables -t mangle -A POSTROUTING -m nth --every 4 --packet 1 \
> >         -j ROUTE --oif ppp1
> > ...
> >=20
> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source
<ip-of-ppp0>
> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source
<ip-of-ppp1>
> > ...
> >=20
> > Cheers, Chris.
> > --=20
> >    ___ __     _
> >  / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
> > / (_ / ,\/ _/ /_ \ | NetServers.co.uk <a=20
> href=3D'<a href=3D'http://www.netservers.co.uk&#39;&gt;<a
href=3D'http://www.netservers.co.uk&lt;/a&gt;'>http://www.netservers.co.u=
k
</a></a>'>http://www.netservers.co.uk'><a
href=3D'http://www.netservers.co.uk&lt;/a&gt;'>http://www.netservers.co.u=
k
</a></a></a> |
> > \ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
> >=20
> >=20
> >=20
>=20
>=20


