From: "Rakotomandimby (R12y) Mihamina" <mihamina@mail.rktmb.org>
Subject: I cant flush rules
Date: Sun, 06 Mar 2005 20:41:34 +0100
Message-ID: <1110138094.6856.65.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,
I have one big problem with my iptables 1.2.11 on a Debian testing box.
Though I explicitely drop, some connections can be done.
The iptables-save output is also strange.

http://www.etud-orleans.fr/Members/mihamina/divers/rules.txt/file_view

And here is the output of iptables-save:
http://www.etud-orleans.fr/Members/mihamina/divers/ipt-save.txt/file_view

As you see, although I tried to flush, ...

The critical thing is I'm running a test daemon listening on port 8000,
and it can be accessed though I told to DROP by default...

What did I do wrong ?
--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14


