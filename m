From: =?utf-8?q?Andr=C3=A9s=20Su=C3=A1rez?= <webmaster@colservers.com>
Subject: nat problems
Date: Tue, 5 Nov 2002 01:03:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211050103.26775.webmaster@colservers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi:

I'm new to this list, and I have a problem that I don't know if is solved=
 yet,=20
but I really need help.

I have a linux machine, with one public IP address, running dns, www, smt=
p,=20
and other services. I have some domains hosted on this machine. Those dom=
ains=20
have the same IP, because I have only one. That is working fine, I can se=
e=20
all of my domains, send mails from and to my machine. Thouse domains are=20
visible to and from the internet.

My problem begins here. I want to host one of this domains on other compu=
ter,=20
inside my local network. This computer have a private IP.=20
I create a rule on my iptable, that change the destination address for th=
at=20
domain:
iptables -t nat -A PREROUTING -s 0/0 -d mydomain.com -i eth0 -p tcp --dpo=
rt 80=20
-j DNAT --to 10.0.0.2

eth0 is the ethernet card that is connected to the internet. mydomain.com=
 is=20
the domain that I want to host on the local machine wich have the local i=
p=20
10.0.0.2

That make that all the traffic on the port 80, goes to the 10.0.0.2 ip, a=
nd=20
the other domains, on the machine connected to the internet, goes to that=
 ip=20
too, and I want ONLY that domain redirect to the private network, to make=
 a=20
some kind of dedicated server, using one public ip, and some virtual serv=
ers=20
on the main maiche (wich is connected to the internet and have the public=
=20
ip).

Thanks,

Andres Suarez
Webmaster
http://www.colservers.com

