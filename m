From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Need diagram on *order* IP packet traverses iptables 'tables'
Date: Thu, 20 Jan 2005 16:10:36 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679673@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: seberino@spawar.navy.mil, netfilter@lists.netfilter.org

seberino@spawar.navy.mil wrote:
> I am looking for a diagram to remind me of path
> a NAT'ed IP packet takes thru all the iptables tables
> when it goes from Internet to a private firewalled PC and vice versa.
>=20
> e.g. What order does packet traverse INCOMING, FORWARD, PREROUTING,
> POSTROUTING guys?
>=20
> Chris

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSING
OFTABLES

