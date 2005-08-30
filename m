From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: patch-o-matic error while comipling for pptp
Date: Mon, 29 Aug 2005 22:36:01 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829074F2@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: suneel cumar <suneelcumar@yahoo.com>, netfilter@lists.netfilter.org

Sunell,=20

Below is just a suggestion.  I'm not an expert... Please keep that in
mind.

> unable to find ladd slot in src

Search the archive for this.  There was a change that brought the ladd
slot forward to 2.6.9 which probably broke the older versions (just a
guess).  Find that date of the article and go back into CVS and pull out
that single patch to the ladd before the change was made.  Don't pull
the entire CVS just that file.

With the new ladd file for the pptp_conntrack modules you should be able
to insert it into your kernel tree now.

Gary=20

