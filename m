From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: string is not working, any help?
Date: Wed, 11 Jun 2003 11:31:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E35@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Michael Kearey <mutk@iprimus.com.au>, IPtables Users <netfilter@lists.samba.org>

Incorrect. You specify the module you want to use with a '-m string' and =
then give it's parameter with a '--string "search this"'

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Michael Kearey [mailto:mutk@iprimus.com.au]
Sent: Wednesday, June 11, 2003 11:17 AM
To: IPtables Users
Subject: Re: string is not working, any help?


Esteban wrote:
<snip>
> root@dejawu:~# iptables -t mangle -A PREROUTING -p tcp -m --string
> "pepee" -j DROP
> iptables v1.2.7a: Couldn't load match
> `--string':/lib/iptables/libipt_--string.so:=20

The clue is above. You don't have 'so' called libipt_--string, it's=20
called libipt_string.so

>cannot open shared object
> file: No such file or directory
>=20
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> why is not working --string match??
> im using pom version patch-o-matic-20030107 under 2.4.20 kernel.

The correct syntax is :

iptables -t mangle -A PREROUTING -p tcp -m string "pepee" -j DROP

Cheers,
Michael



