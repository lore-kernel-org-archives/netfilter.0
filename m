From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNS with iptables
Date: Thu, 11 Dec 2003 09:59:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312110959.11243.Antony@Soft-Solutions.co.uk>
References: <4D365C260C742A4AABFBF2EE41B7E59F312D8D@itfbsv01.itservices.intern>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4D365C260C742A4AABFBF2EE41B7E59F312D8D@itfbsv01.itservices.intern>
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

On Friday 05 December 2003 2:31 pm, Centkowski, Peter (SSFB) wrote:

> Helo

220  :)

> Kann ich statt IP-Adresse auch ein Name in Iptables verwenden?

Yes, you can use both hostnames and IP addresses in netfilter rules, howe=
ver=20
any hostnames are resolved to an address only once, when you put the rule=
 in.  =20
You cannot get netfilter to resolve names every time it sees a packet, fo=
r=20
example.

> Es geht um Dyndns und damit einem Problem...

Ja, das ist ein Problem :(

Viele Gr=FC=DFe

Antony.

--=20
The difference between theory and practice is that in theory there is no=20
difference, whereas in practice there is.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


