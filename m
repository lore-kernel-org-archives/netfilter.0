From: "Gebauer Ulrich" <Ulrich.Gebauer@soldan.de>
Subject: AW: MAC BLOCK  in a DHCP server
Date: Fri, 14 Nov 2003 16:52:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <74A3B74C09656B489667D19991666F8261F3@exchange1.soldan.org.dir>
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
To: curlybraces <curlybraces@dialogsl.net>
Cc: netfilter@lists.netfilter.org

imho DHCP server uses raw sockets, grapping it's packets before =
netfilter is impossible ?
Use fixed ip & macs in dhcp configuration to prevent usage bei unknown =
macs.
btw: macs can be faked.

Mit freundlichen Gr=FC=DFen
        Ulrich Gebauer

Hans Soldan GmbH, Dienste f=FCr Anw=E4lte
Organisation / IT
Bocholder Stra=DFe 259, 45356 Essen
Telefon:0201 / 8612-228, Telefax: 0201 / 8612-377
Email: gebauer@soldan.de
Internet: http://www.marktplatz-recht.de

-----Urspr=FCngliche Nachricht-----
Von: curlybraces [mailto:curlybraces@dialogsl.net]=20
Gesendet: Freitag, 14. November 2003 12:42
An: netfilter-admin@lists.netfilter.org; netfilter@lists.netfilter.org
Betreff: MAC BLOCK in a DHCP server


can some body help me to do the configurations.........

as a default rule , block every MAC adrresses and

let few of known MACs to Allow come in to a DHCP server  using iptables =
................pls

i did some configurations , but those r not working .

if all the input , forward , output DROP in the default policies , no =
one can access the dhco server ....is it ?
but my dhcp clients tkaing the ips.....how come this ?

pls reply me asap

thanx

