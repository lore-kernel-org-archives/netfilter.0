From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through iptables FW...
Date: Mon, 1 Jul 2002 08:56:13 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002d01c22117$d41c63f0$6b01a8c0@s3ac>
References: <002601c22107$7f39fe70$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002601c22107$7f39fe70$3864a8c0@discmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: "'Aldo S. Lagana'" <alagana@discmail.com>, netfilter@lists.samba.org



> I haven't looked into this, but is there a method to connect=20
> to a pptp server from behind an iptables firewall?  I have=20
> seen glimpses of persons using something called=20
> ip_conntrack_pptp (sp?) and that seems it will fit the=20
> bill...not sure..here is ASCII art:
>=20
> Client-----IPTABLES Firewall------INTERNET--------Remote PPTP=20
> server------Server
>=20
> I am currently using IPTables 1.2.5
>

I guess I'll just share what I have learned. The below link details pptp
filtering.
I'm not familiar with conntrack_pptp (assuming this is a module)  The
method I have beeb
Following is transpaerent but is compiled in as a kernel patch kernel
2.4.17 or earlier.
Thus far I'm not getting a stable setup. Ie no filtering thus far.
Wouldn=92t' mind working on this one.
=20

ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html


