From: =?ISO-8859-1?Q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>
Subject: Re: nat problems
Date: 05 Nov 2002 08:08:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036480087.6593.55.camel@lilleulv>
References: <200211050103.26775.webmaster@colservers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211050103.26775.webmaster@colservers.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2002-11-05 at 07:03, Andr=E9s Su=E1rez wrote:
> Hi:
>=20
> I'm new to this list, and I have a problem that I don't know if is solved=
 yet,=20
> but I really need help.
>=20
> I have a linux machine, with one public IP address, running dns, www, smt=
p,=20
> and other services. I have some domains hosted on this machine. Those dom=
ains=20
> have the same IP, because I have only one. That is working fine, I can se=
e=20
> all of my domains, send mails from and to my machine. Thouse domains are=20
> visible to and from the internet.
>=20
> My problem begins here. I want to host one of this domains on other compu=
ter,=20
> inside my local network. This computer have a private IP.=20
> I create a rule on my iptable, that change the destination address for th=
at=20
> domain:
> iptables -t nat -A PREROUTING -s 0/0 -d mydomain.com -i eth0 -p tcp --dpo=
rt 80=20
> -j DNAT --to 10.0.0.2
>=20
> eth0 is the ethernet card that is connected to the internet. mydomain.com=
 is=20
> the domain that I want to host on the local machine wich have the local i=
p=20
> 10.0.0.2
>=20
> That make that all the traffic on the port 80, goes to the 10.0.0.2 ip, a=
nd=20
> the other domains, on the machine connected to the internet, goes to that=
 ip=20
> too, and I want ONLY that domain redirect to the private network, to make=
 a=20
> some kind of dedicated server, using one public ip, and some virtual serv=
ers=20
> on the main maiche (wich is connected to the internet and have the public=
=20
> ip).

The HTTP protocol, which is used on your web server to hand out the web
pages people ask for, is able to distinguish which domain name is
requested even (or rather particularly) the different domains' web sites
are served from the same IP address. This is what is called vhosts. In
detail, a web browser contacts your IP address and asks for a given
domain's web site. This is a feature of the HTTP protocol (1).

Iptables is not able to make such distinctions (and shouldn't either),
because it operates at lower levels (2) than the HTTP protocol.=20
Iptables makes its decisions quite some time before even asking for a
given domain name is an issue, and as such, *all* requests to your web
site will be routed to your 10.0.0.2 server.

You see, when you run your iptables rule given above, iptables checks to
see which IP address 'mydomain.com' has, and then decides that all port
80 access to this IP should be sent to 10.0.0.2. This will of course
affect any port 80 service you are running.

Maybe apache (I assume that's what you use) has an option for internal
rerouting of web sites, I don't know. Check with
http://httpd.apache.org/ for any apache features.

Hope this helps,

Bj=F8rn

(1) Yeah, I know it's version specific.
(2) iptables handles layer 3 and layer 4 in the OSI layer model, while
HTTP is at [5-7] in the same model.


