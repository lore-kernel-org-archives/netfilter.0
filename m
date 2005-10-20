From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28Infojoi=29?=
	<tiao@infojoi.com.br>
Subject: I can not connect a Windows 2000 Server RAS
Date: Thu, 20 Oct 2005 18:29:43 -0200
Message-ID: <00f001c5d5b5$02b8f5c0$3200000a@PIVT>
Reply-To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28Infojoi=29?=
	<tiao@infojoi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi People!

We have the follwing problem:

We have a Windows 2000 server with RAS and PPTP in a remote site.

The protocol 47 services and dest port 1723 are directed by DNAT to the=20
Windows 2000 server with RAS.

When a vpn client connect using a vpn dialler only the first connection=20
works.

Well here more information.

If  I stay in a local network using a redhat 9 and iptables doing NAT to al=
l=20
protocol, only the first conex=E3o can connect with the Windows 2000 server=
=20
RAS.

If in the same local network I NOT use the Iptables to NAT and so use the=20
W2k Server or Windows XP doing NAT using a netcard sharing option,=20
everything works.

Anyone how to solve this problem?

Thank you.

.


