From: Askar <askarali@gmail.com>
Subject: Re: slow ftp
Date: Thu, 17 Feb 2005 22:11:55 +0500
Message-ID: <a0f69e505021709116d1ee760@mail.gmail.com>
References: <a0f69e505021708481c4be836@mail.gmail.com>
	<030e01c51511$cf9c6e10$b000a8c0@cybergeneration.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <030e01c51511$cf9c6e10$b000a8c0@cybergeneration.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Maxime Ducharme <mducharme@cybergeneration.com>
Cc: netfilter@lists.netfilter.org

Hello Maxime,

Thanks  for your quick reply, I added the above rules for all our
company DNS servers but no luck still it takes times on
Connecting.......

flushing firewall rules makes a difference that is "quick" connection :)

regards



On Thu, 17 Feb 2005 11:57:49 -0500, Maxime Ducharme
<mducharme@cybergeneration.com> wrote:
> Hello Askar
>=20
> Usually it is because of reverse DNS done
> when a client connects.
>=20
> If your firewall doesnt have access to any DNS
> and tries to resolve the client hostname, each time
> a client connects, it will have to wait until the server
> times out on DNS requests.
>=20
> Configure DNS and add
> iptables -A OUTPUT -p udp --dport 53 -d $DNS_SERVER -j ACCEPT
> iptables -A OUTPUT -p tcp --dport 53 -d $DNS_SERVER -j ACCEPT
>=20
> Replace $DNS_SERVER with your DNS server's IP.
> If you have more, add as much rules as needed.
>=20
> You may also take a look into proftpd config, maybe
> you can simply deactivate reverse DNS lookup on connect.
>=20
> Hope this helps
>=20
> Have a nice day
>=20
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>=20
> ----- Original Message -----
> From: "Askar" <askarali@gmail.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, February 17, 2005 11:48 AM
> Subject: slow ftp
>=20
> > hi list
> >
> > we are running ftp "proftpd" server it takes times when a user
> > connects to ftp server however when I flush the iptables rules
> > connection doesn't takes time, iptables firewall on the same machine,
> > default policies are DROP,
> > firewall script is very straight forward
> >
> > rules
> > .
> > .
> > # Using Connection State to By-pass Rule Checking
> > iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > .
> > .
> > .iptables -A INPUT -p tcp --dport 20:21 -m state --state NEW -j ACCEPT
> > .
> > .
> >
> > # Load the FTP connection state helper module.
> > modprobe ip_conntrack_ftp
> > # Load the FTP NAT module.
> > modprobe ip_nat_ftp
> >
> > any idea?
> >
> > regards
> >
> > --
> > I love deadlines. I like the whooshing sound they make as they fly by.
> > Douglas Adams
> >
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

