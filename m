From: alexb@spsul.com.br
Subject: Re: Is it possible connecting to a forwarded port from inside the network?
Date: Mon, 17 Mar 2003 15:17:09 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047925029.3e761125061db@www.spsul.com.br>
References: <!~!AAAAAO0Ci8RCKNNHt538Ob9jsx6kk0gA@taralnetworks.com> <200303161503.41910.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303161503.41910.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

And on the Gateway ? It seams that the PREROUTING DNAT on the OUTPUT chain =
has
some problems. It seams that the replays from connections started at the Ga=
teway
to the DNATed ip:port doesn't get unDNATed when it comes back to the INPUT =
chain.

Exemple


            |
            | 200.200.200.200
         -------
         | GW  |
         |     |
         -------
            | 192.168.200.1/24
            |
      |--|--|--|--|
      |  |  |  |  |
                  |  192.168.200.200  DNS Server


iptables -t nat -A PREROUTIND -p tcp -d 200.200.200.200 --dport 53 -j DNAT =
--to
192.168.200.200:53
iptables -t nat -A PREROUTIND -p udp -d 200.200.200.200 --dport 53 -j DNAT =
--to
192.168.200.200:53
iptables -t nat -A OUTPUT -p tcp -d 200.200.200.200 --dport 53 -j DNAT --to
192.168.200.200:53
iptables -t nat -A OUTPUT -p udp -d 200.200.200.200 --dport 53 -j DNAT --to
192.168.200.200:53
iptables -t nat -A POSTROUTING -s 192.168.200.0/24 -d 192.168.200.200 -p tcp
-dport 53 -j SNAT --to 192.168.200.1
iptables -t nat -A POSTROUTING -s 192.168.200.0/24 -d 192.168.200.200 -p udp
-dport 53 -j SNAT --to 192.168.200.1

But the GW can't use 200.200.200.200 for his DNS server while external host=
s and
internal host could.



Alex

C=F3pia Joel Newkirk <netfilter@newkirk.us>:

> On Sunday 16 March 2003 02:18 pm, Jiwei Wang wrote:
> > Hello,
> >
> >
> >
> > I'm using iptables on a RedHat 8.0 box to do firewalling and port
> > forwarding. The port-forwarding works perfectly when accessed from
> > outside my internal networks.   However, I cannot access the
> forwarded
> > ports from inside the network.
> >
> >
> >
> > I tried to use two IP addresses to do this. That is, I have public
> IP
> > addresses a.b.c.x and a.b.c.y both assigned to my Internet facing
> > eth0; I use a.b.c.x for SNAT and a.b.c.y for DNAT port forwarding
> > (a.b.c.y:80 is forwarded to an internal host port 80); from the
> > Internet a.b.c.y:80 works ok, but I still cannot access a.b.c.y:80
> > from any of my internal box.
>=20
> add this, where d.e.f.y is the IP of the internal host, and d.e.f.z is
>=20
> the internal IP of the firewalling box:
>=20
> iptables -t nat -A POSTROUTING -o eth1 -d d.e.f.y -p tcp --dport 80 -j
> SNAT --to d.e.f.z
>=20
> This will force a.b.c.y to respond to the firewall instead of directly
> to=20
> the client, so that the reverse DNAT can take place.  As it stands, the
>=20
> server is probably trying to reply directly to the client, which is=20
> discarding the reply.  (it's waiting for a response from a.b.c.y, not=20
> d.e.f.y!)  Once the reply comes back to the firewall, it will undo the
>=20
> SNAT, setting the destination of the reply back to the original client,
>=20
> then it will undo the DNAT, setting the 'source' of the reply back to=20
> the public IP a.b.c.y.
>=20
> j
>=20
>=20

