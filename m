From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: How to block only MX query made to DNS server
Date: Sat, 27 Nov 2004 13:23:24 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56795EA@alderaan.smgtec.com>
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
To: pravin rane <pgr_80@yahoo.com>, netfilter@lists.netfilter.org

pravin rane wrote:
> Hi all,
>=20
> I want to block DNS MX query made through my network.
> What iptables rule I should use.

You don't use iptables to do this. named has built in ACL's to determine
who can perform what oeprations. Look at bind 'view's for more
information on how to properly deal with name resolution issues.

