From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Suggestions for some patch-o-matic extensions (comment, ipp2p,
 random, etc...)
Date: Wed, 16 Feb 2005 23:19:41 +0100
Message-ID: <4213C6FD.5080705@arcoscom.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

In some extensions, I detected that before I apply patch-o-matic (last=20
source package) without problems, i can compile kernel and kernel=20
modules fine.

But when I try to compile iptables, i have a common error with some=20
extensions:
    error: near initialization for `<struct_name>.<struct_member>'

Some of these extensions are:
    * comment
    * ipp2p
    * random (IPv6)

Thinking about it, I had applied successfully these extensions over=20
1.2.11 iptables version, but with 1.3.0, seems that some structure=20
declaration has been changed and these modules don't compile without a=20
manual user modification of the sources.

The "manual modification" should be an explicit member initialization in=20
the struct, but some modules need more revision.

Here is the warning exposed.

Good Luck


--
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

