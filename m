From: Pat Riehecky <prieheck@iwu.edu>
Subject: Limit match ! and and question (manpage error?)
Date: Mon, 27 Aug 2007 10:01:26 -0500
Message-ID: <1188226886.6506.36.camel@thales.iwu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

According to the manpage for iptables:

   limit
       This module matches at a limited rate using a token bucket
filter.   A rule  using  this  extension  will  match  until  this limit
is reached (unless the =E2=80=98!=E2=80=99 flag is used).  It can be used=
 in combination
with  the LOG target to give limited logging, for example.

So why then do I get

# /sbin/iptables -t filter -A SYNFLOODCHECK -m limit --limit ! 151/s -j
DROP
iptables v1.3.5: limit does not support invert
Try `iptables -h' or 'iptables --help' for more information.

# /sbin/iptables -t filter -A SYNFLOODCHECK -m limit ! --limit 151/s -j
DROP
iptables v1.3.5: limit does not support invert
Try `iptables -h' or 'iptables --help' for more information.

Is the manpage wrong?  Am I supposed to put the ! some place else? =20

Pat


