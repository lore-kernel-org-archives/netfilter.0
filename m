From: "Willem-Jan Meijer" <meyer3@chello.nl>
Subject: RE: Firewall troubles
Date: Fri, 6 Jun 2003 10:08:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006f01c32c02$e05724b0$0500a8c0@m28721.findquick.com>
References: <200306052146.49757.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306052146.49757.pc-secure@home.nl>
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
To: 'Pascal Italiaander' <pc-secure@home.nl>
Cc: Netfilter <netfilter@lists.netfilter.org>

netfilter-admin@lists.netfilter.org
<mailto:netfilter-admin@lists.netfilter.org> schreef op donderdag 5 juni
2003 21:47:

> Op donderdag 5 juni 2003 15:43, schreef Willem-Jan Meijer:
>> Hello all,
>>=20
>> I'm running debian 3.0r1 stable with all security and usual updates.
>> I was running a firewall wich is send with this e-mail as attachment.
>>=20
>> It was running fine, but recently my hdd died and recovery was to
>> expensive and not necessary because I had a backup. I installed
>> debian again, did all updates and I wanted
>> to load the firewall, but when I load this one, my remote login
>> hangs, I can't ping my server anymore and my network isn't working
>> anymore, but the script has runned fine before. What is the problem?
>> At this moment ipmasq is also installed to keep my network running,
>> this is conflicting, I know but I don't know anything else.=20
>>=20
>> Can someone point me in the right direction? I'm using linux/debian
>> from november 2002, so my knowledge is very small.
>>=20
>> HTH,
>>=20
>> Willem-Jan Meijer
>> Netherlands
>>=20
>> Windows: Where do you want to go today?
>> MacOS:   Where do you want to be tomorrow?
>> Linux:   Are you coming or what?
>=20
> Heb je bij je backup ook erop gelet ,dat je de rechten ervan moet
> behouden ? Als die nu niet meer goed staan , loopt ook alles in de
> soep !=20
>=20
> Did you preserve the user-rights with taken your backup ?
> When they not match the old install , your in trouble !
>=20
> Pascal

How do you mean? What has my firewall to do with file permissions? Whit=20
my backup I mean: What my users stored on my server. I did a normal=20
Installation as i've done before. After the reinstall before this one
The firewall was running well, with the same way of making a backup

At the moment I want to load the firewall, everything what has to do =
with
networking freezes. Then I have to reboot the server and then it's =
working
Fine, but when I do a portscan at my ip-address there are more open =
ports
Than I like...

Wat hebben iptables regels te maken met bestandsrechten? Dit is niet de=20
eerste re=EFnstallatie, en na de installatie voor deze deed precies =
dezelfde
firewall het wel goed. Met de backup bedoel ik: alles uit=20
/usr/local/apache2/htdocs

Op het moment dat ik de firewall wil inladen hangt alles wat met het=20
netwerk van doen heeft, ik moet dan de server opnieuw starten en dan =
doet
alles het wel weer. Doe ik dan een portscan dan staan er veel meer =
poorten
open dan de bedoeling is.

HTH,

Willem-Jan

Windows: Where do you want to go today?
MacOS:   Where do you want to be tomorrow?
Linux:   Are you coming or what?



