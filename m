From: Lopsch <lopsch@lopsch.com>
Subject: IPSec with 2.6.9 and Windows clients
Date: Tue, 26 Oct 2004 15:40:52 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417E53E4.6000208@lopsch.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

Hi,

is there a good howto for a Linux VPN-Gateway using racoon and IPSec
provided with the actual kernel 2.6.9? Also one for how to set up a
connection to the gateway using Windows XP and the client shipped with=20
it? I=B4m a bit confused, when do I need also the L2TP (l2tpd)? I thought=
=20
IPSec would be enough to secure a connection over ethernet but also over=20
internet via ppp (pppoe). But I=B4ve read that over the internet L2TP is=20
also needed. If someone could explain me what is needed when it would be=20
great for the examples

Linux ------ internet ------ Linux
Linux ------ ethernet ------ Linux
Windows ------ internet ------ Linux
Windows ------ ethernet ------ Linux

Thank=B4s in advance.




