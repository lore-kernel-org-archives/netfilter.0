From: "info" <info@mail.apd-hp.de>
Subject: iptables psd with kernel 2.6.18
Date: Wed, 11 Oct 2006 15:49:22 +0200
Message-ID: <6407D8226F45114A973E9E4005AE9E5C165164@ns1.apd-hp.de>
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
To: netfilter@lists.netfilter.org

Hello,=20

I've tried to compile iptables and kernel 2.6.18 with some extensions
I'd used with a prior kernel as they're string and psd match.

Now I'm getting a little confused about patch-o-matic-ng.=20

A lot of the extension I've seen before went out from patch-o-matic-ng
(like string and psd) but they're described in base or extra.

I'm getting string working but psd does'nt work. I was lookin' in an old
branch psd code which was portet to 2.6.11 but it does'nt work also.

Iptables prints out an "invalid size 0 !=3D 12" on psd match.=20

Any hints?=20

Thanks in advance for your help.=20

Best regards=20

Chris=20



