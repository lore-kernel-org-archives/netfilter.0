From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Preferred way of preserving firewall rules on system reboots?
Date: Thu, 13 May 2004 11:11:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A39E31.40905@pbl.ca>
References: <40A38ABF.4090907@pbl.ca> <1084460291.1771.183.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084460291.1771.183.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Cedric Blancher wrote:
> Le jeu 13/05/2004 =E0 16:48, Aleksandar Milivojevic a =E9crit :
>=20
>>What is your preferred way of preserving firewall configuration on=20
>>firewall reboots?  I know this is probably distribution specific.
>=20
>=20
> Every time I need to save the ruleset :
>=20
> 	iptables-save > /etc/firewall
>=20
> Then, in a startup script (/etc/init.d/networking on my Debian), I add =
:
>=20
> 	iptables-restore < /etc/firewall

This is something what Red Hat's init.d script is doing (if called with=20
"save").  However, using this approach, there's no space left for any=20
comments.  It is questionable I would still remember why I have some=20
"special" set of rules one year from now, if there was no comments in=20
the file.  And it makes very hard for somebody else to change anything I =

created (something obvious to me might not be obvious to somebody else,=20
hack it might not be obvious to me couple of months down the road).  I=20
find having comments in configuration files very important.

--=20
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

