From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: multiple webservers behind iptables
Date: Wed, 9 Feb 2005 15:10:38 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DDB2@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

raul,

edu.ar doesn't resolve so none of the rest of the fqdn will either.

the domain doesnt even resolve...whois from internic.net reports
that the edu.ar subdomain doesn exist or is lame.
Whois Server Version 1.3

Domain names in the .com and .net domains can now be registered
with many different competing registrars. Go to http://www.internic.net
for detailed information.

No match for domain "EDU.AR".

>>> Last update of whois database: Wed, 9 Feb 2005 07:51:57 EST <<<

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Wednesday, February 09, 2005 2:45 PM
To: netfilter@lists.netfilter.org
Subject: Re: multiple webservers behind iptables


On Wed, 2005-02-09 at 13:24, Raul I. Becette wrote:
> Hello list
>=20
> This is my first post.
> I am in charge of a LAN connected to internet through a firewall box=20
> PIII 500MHz with iptables 1.2.10.
>=20
> There are different internal webservers that I don't adminnister and =
are=20
> located physically in different parts of the building.
> There is an internal DNS server which I administer to resolve internal =

> www queries.
>=20
> My problem is that from the outside I cannot access those webservers=20
> when I type www.xxx.unp.edu.ar (xxx being the name of the server).
> My net schema is the following

um--not to be silly, but does www.xxx.unp.edu.ar resolve to an IP
address externally?

>                                      INTERNET
> Mail Relay            Main Web Server             Router
>=20
>=20
> -------------------------Firewall--------------------------------
>=20
>=20
> POP Server         Proxy         Webserver1      Webserver2
>                                          LAN
>=20
> My question is how can I use iptables rules to be able to access those =

> servers from the outside.

depends on whether you need to use NAT to make the servers accessible
from the Internet (i will assume you do not).  for each webserver IP,
add a rule like:

  iptables -A FORWARD -i $EXT_IF -p tcp --syn -d $WEB_SRV_IP \
    --dport 80 -j ACCEPT

this assumes that somewhere above this rule you have:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-j

--
"Me fail English? That's unpossible."
	--The Simpsons



