From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: learning firewall
Date: Thu, 2 Sep 2004 12:31:00 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794DA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Pablo Allietti <pablo@lacnic.net>, netfilter@lists.netfilter.org

Pablo Allietti wrote:
> hi all i have a question.
>=20
> exist any soft based in iptables to have the option LEARN ??
>=20
> example
>=20
> i run snort in my system when detect a intrusion add the ip address to
> the iptables table.
>=20
> exist this ??

No, but you can use Snort itself to manage blocking connections. Look
for the snort-inline project for more information on how this works.
http://sourceforge.net/projects/snort-inline


