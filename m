From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Communication Redirect (Revised)
Date: 01 May 2003 00:47:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051742856.2545.3.camel@elendil.intranet.cartel-securite.net>
References: <3EB0371D.8080300@qwest.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EB0371D.8080300@qwest.net>
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
To: Sapient2003 <sapient@qwest.net>
Cc: netfilter <netfilter@lists.netfilter.org>

Le mer 30/04/2003 =E0 22:50, Sapient2003 a =E9crit :
> OpenBSD uses the packet filter pf to redirect communications to a=20
> program. Is ther anything like this for Linux? I tried IPTABLES for thi=
s=20
> task, like so: iptables -t filter -A INPUT -p udp -s 0/0 -d 66.47.159.1=
1=20
> --destination-port 53 -j REDIRECT dns ... As it turns out, REDIRECT=20
> isn't for forwarding packets to another program...

Netfilter has no such feature. What you can do is have your program
listen to a local port and then redirect traffic to this local UDP port
53. If you have a DNS server listening on this port, you're done.

This is a basic stup for transparent proxying.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

