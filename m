From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 11:47:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084895268.7272.2.camel@localhost>
References: <7528A97D83FBD411BEF40003471B905B05D8FEF7@smtp.retecal.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7528A97D83FBD411BEF40003471B905B05D8FEF7@smtp.retecal.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: CPD - David =?ISO-8859-1?Q?Carde=F1osa?= Rubio <dcardenosa@cac.retecal.es>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I do not believe that is necessarily true.  I'm not the expert but I
believe that if all you want is inbound access, connection tracking will
take care of the source alteration.  You would only need SNAT if you
wanted to originate outbound packets with the altered source.  Someone
please correct me if I am wrong - John

On Tue, 2004-05-18 at 11:33, CPD - David Carde=C3=B1osa Rubio wrote:
> HI!
>=20
> if you add
>=20
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
>=20
> you need=20
>=20
> iptables -t nat -A POSTROUTING -s 192.168.0.2 -p tcp --dport 80 -j
> SNAT --to 192.168.0.1:8080
>=20
> you can test the conections with tcpdump=20
>=20
> Un saludo
>=20
> David Carde=C3=B1osa
>=20
> -----Mensaje original-----
> De: alucard@kanux.com [mailto:alucard@kanux.com]
> Enviado el: martes, 18 de mayo de 2004 17:13
> Para: netfilter@lists.netfilter.org
> Asunto: Re: forwarding
>=20
>=20
>=20
> > Although it probably did, are you sure nmap scanned port 8080? How
> about
> > nmap -sT -p 8080 10.73.219.156
> >
> > I would then trace both the wire and the iptables rules to find out
> > where it is breaking - John
>=20
> Yes, it filters now but now it seems that the problem is in the 2nd
> server
> because I try to telnet to server 1's 8080 port and I get no response.
> Is
> it any missconfiguration on the router? take a look at this:
> ----
> root@mail:~# nmap -sT -p 8080 10.73.219.156
>=20
> Starting nmap 3.48 ( http://www.insecure.org/nmap/ ) at 2004-05-18
> 11:06 VET
> Interesting ports on mail.aeropostal.com.ve (10.73.219.156):
> PORT     STATE    SERVICE
> 8080/tcp filtered http-proxy
> ----
>=20
> the webserver in server 2 is working perfectly but im not able to
> reach it
> from server one, look at this in server 2, maybe im doing something
> wrong
>=20
> [root@linserv root]# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref  =20
> Use Iface
> 192.168.0.0     *               255.255.255.0   U     0      0      =20
> 0 eth1
> 10.73.216.0     *               255.255.252.0   U     0      0      =20
> 0 eth0
> 169.254.0.0     *               255.255.0.0     U     0      0      =20
> 0 eth0
> 127.0.0.0       *               255.0.0.0       U     0      0      =20
> 0 lo
> default         192.168.0.1     0.0.0.0         UG    0      0      =20
> 0 eth1
>=20
>=20
> Thanx a lot for this great help
> Juan
>=20
>=20
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


