From: Michael Gale <mgale@utilitran.com>
Subject: Re: public ip on LAN
Date: Fri, 2 Jan 2004 11:46:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040102114623.79028242.mgale@utilitran.com>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
	<3FF5A9FB.7000302@nerim.net>
	<1073068231.18243.11.camel@e500>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073068231.18243.11.camel@e500>
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

Hello,

	Can you provide an example ? We have a web serve behind the firewall. I am=
 not sure what type of links our web master is using. But we have not had a=
ny problems.

We have links to other web servers that our out side of our network on the =
web site that work.

Michael.



On Sat, 03 Jan 2004 02:30:32 +0800
Craig Steadman <spinout@yakbox.shacknet.nu> wrote:

> The issue with redirecting web traffic using DNAT is that if
> any of the web pages have absolute links then they fail to
> work for clients connecting from the internet.
> Does anyone know of an apache module that can be configured to
> parse and change the anchors in a html page on the fly, for this
> scenario ?
>=20
> Craig.
>=20
> On Sat, 2004-01-03 at 01:27, Fabien LE BLEVEC wrote:
> > In the PREROUTING chain, you said for example :
> >=20
> > iptables -A PREROUTING -s 203.122.51.179 -j DNAT --to 172.16.1.2
> > iptables -A PREROUTING -s 203.122.51.180 -j DNAT --to 172.16.1.3
> > ....
> > or more accurate :
> > iptables -A PREROUTING -s 203.122.51.181 -p tcp --dport 80 -j DNAT --to=
=20
> > 172.16.1.4
> > ...
> >=20
> > I think it should  be correct for your configuration.
> >=20
> > Don't forget to authorize the traffic in the FORWARD chain .
> >=20
> >=20
> > Fabien
> >=20
> >=20
> > Amit Pasari a =C3=A9crit :
> >=20
> > > Thanks John,
> > > Let me explain
> > > on My LAN i have ip address - 172.16.1.1
> > > subnet - 255.255.0.0
> > > on My WAN i have ipaddress - 203.122.51.178
> > > subnet - 255.255.255.240
> > >
> > > Now , my clients want to have public / Live ip instead of private ips=
=20
> > > which i am giving as  many of my clients uses webserver , and other=20
> > > applications which people from outside world needs to access .
> > > I can redirect  ports for one clients but how about 10 clients wantin=
g=20
> > > the same .
> > > So i need to give them a public ip so that all the traffic can be=20
> > > redirected their ip .
> > >
> > >
> > > Regards
> > > Amit
> > >
> > > At 09:54 PM 1/2/04, you wrote:
> > >
> > >> On Fri, 2004-01-02 at 11:30, Amit Pasari wrote:
> > >> > Hello,
> > >> > I am using Redhat 8.0 with iptables to provide my client internet=
=20
> > >> services
> > >> > . Everything is going well .
> > >> > i have been giving private ips of 172.16.0.0 series to my clients .
> > >> > But now some of my clients need public ips . i do have many public=
=20
> > >> ips with
> > >> > me .so can somebody tell how can i give public ips to my clients .
> > >> >
> > >> > Thanks & Regards
> > >> > Amit
> > >> > Orangeinfoways.com
> > >>
> > >> Could you please clarify what you mean by giving ips to your clients?
> > >> Thanks - John
> > >> --=20
> > >> John A. Sullivan III
> > >> Chief Technology Officer
> > >> Nexus Management
> > >> +1 207-985-7880
> > >> john.sullivan@nexusmgmt.com
> > >> ---
> > >> If you are interested in helping to develop a GPL enterprise class
> > >> VPN/Firewall/Security device management console, please visit
> > >> http://iscs.sourceforge.net
> > >
> > >
> > >
> > >
> > >
> >=20
> >=20
> >=20
>=20
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation

