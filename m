From: "Gebauer Ulrich" <Ulrich.Gebauer@soldan.de>
Subject: AW: iptables for ADSL
Date: Mon, 24 Nov 2003 10:48:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <74A3B74C09656B489667D19991666F8254DD95@exchange1.soldan.org.dir>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: tkevans@tkevans.com
Cc: netfilter@lists.netfilter.org

My 2 cents

I identify in my firewall script my dsl interface by it's interface =
name. Nothin else comes accross that way. Who cares of it's IP ? Tell me =
if I'm wrong.

Mit freundlichen Gr=FC=DFen
        Ulrich Gebauer

Hans Soldan GmbH, Dienste f=FCr Anw=E4lte
Organisation / IT
Bocholder Stra=DFe 259, 45356 Essen
Telefon:0201 / 8612-228, Telefax: 0201 / 8612-377
Email: gebauer@soldan.de
Internet: http://www.marktplatz-recht.de




-----Urspr=FCngliche Nachricht-----
Von: Tim Evans [mailto:tkevans@tkevans.com]=20
Gesendet: Freitag, 21. November 2003 20:40
An: Antony Stone; Netfilter lista (iptables)
Betreff: Re: iptables for ADSL


On Fri, 21 Nov 2003 19:29:28 +0000, Antony Stone wrote
> On Friday 21 November 2003 7:25 pm, Alejandro Cabrera Obed wrote:
>=20
> > Hi people !!!
> >
> > I have a basic doubt: I want to connect my Linux with iptables to=20
> > Intrenet via ADSL. Just one question:
> >
> > Do I have to set
> > echo "1" > /proc/sys/net/ipv4/ip_dynadrr
> > in order to work with dynamic addresses asigned by my ISP ????

You just need to capture your dynamically assigned IP address at =
iptables startup time and use it in your rules.  I have the following =
variable assignment in my RH 7.3 startup sdript (all one line):

INET_IP=3D`ifconfig eth1 | grep 'inet addr' | awk -F":" '{print $2}' | =
sed 's/=20
Bcast//'`

Then just use $INET_IP in your rules.
--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |   =20



