From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ftp
Date: 31 Jul 2003 15:50:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059659423.2375.42.camel@elendil.intranet.cartel-securite.net>
References: <3F26B8F7.9040806@lou-telecom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F26B8F7.9040806@lou-telecom.net>
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
To: Gary Metcalf <gtm@lou-telecom.net>
Cc: netfilter@lists.netfilter.org

Le mar 29/07/2003 =E0 20:12, Gary Metcalf a =E9crit :
> I set my INPUT tables to DROP all tcp entries. Before that line I put i=
n=20
> some ports to ACCEPT such as port 80 for http. This works as I had a=20
> friend run nmap to my ip and it came back with all blocked except for=20
> port 80. He could also get my Web page via a browser. I Have one proble=
m=20
> still. When I try to ftp out to a site I can get loged in but if I ente=
r=20
> any command such as 'ls' or '?' I get the message back that 200 PORT=20
> command successfull but I never see the list of files or commands. I=20
> can't even execute a 'bye' command and get out. What port do I need=20
> opened up to use ftp from my computer to another.
>    I tried ports 20, 21, 69 and 115 but they did no good. I found these=
=20
> in the /etc/services file.

This a VFAQ...

	modprobe ip_conntrack_ftp.

Then use state matching aginst ESTABLISHED and RELATED packets to let
them get in.

	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

(quick and dirty, but it works ;)).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

