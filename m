From: alexb@spsul.com.br
Subject: RE: Masquerading on local ports
Date: Thu, 20 Mar 2003 15:34:23 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048185263.3e7a09af5b967@www.spsul.com.br>
References: <FD8F124A387AD6119F7900A0D218B321019C75@hslex01.hslbz.local> <1048177609.1493.127.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048177609.1493.127.camel@localhost.localdomain>
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
To: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

This one works for me:

iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport 81 \
         -j REDIRECT --to-ports 80

Alex

C=F3pia Henry Ritzlmayr <h.ritzlmayr@gmx.at>:

> Am Don, 2003-03-20 um 16.29 schrieb Rob Sterenborg:
> > > And here is the question. How is it possible to nat a lokal port?
> > >=20
> > > IPTABLES -t nat -A PREROUTING -p tcp -d 127.0.0.1=20
> > > --destination-port 81 -j DNAT --to-destination 127.0.0.1:80
> > >=20
> > > telnet localhost 80  <<< works
> > > telnet localhost 81  <<< Connection refused
> >=20
> > iptables -t nat -A PREROUTING -d 127.0.0.1 -p tcp --dport 80 -j
> REDIRECT
> > --to-ports 81
> >=20
> >=20
> > Rob
>=20
> Tanks for the answer,
> I tried that one already but it behaves the same.
> I also tried=20
>=20
> IPTABLES -t nat -A PREROUTING -p tcp -d 172.16.172.12
> --destination-port
> 81 -j REDIRECT --to-ports 80
>=20
> wich works perfect for both port 80 and 81 from a foreign host.
>=20
> Henry
>=20
>=20

