From: Paul Reilly <paul@astropaul.com>
Subject: MATCH_PHYSDEV missing from 2.6.16.29 ??
Date: Sat, 18 Nov 2006 08:22:52 -0800
Message-ID: <1163866972.455f335c3fc1d@mail.third-rock.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello,
I need to use kernel 2.6.16.29, but oddly enough it appears there
is no MATCH_PHYSDEV option? A fresh kernel source only has these
match targets (see below). Is it gone? Or have I missed something?

Paul

# grep XT_MATCH .config
CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dy
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dy
CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dy
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
CONFIG_NETFILTER_XT_MATCH_DCCP=3Dy
CONFIG_NETFILTER_XT_MATCH_HELPER=3Dy
CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dy
CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dy
CONFIG_NETFILTER_XT_MATCH_MAC=3Dy
CONFIG_NETFILTER_XT_MATCH_MARK=3Dy
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dy
CONFIG_NETFILTER_XT_MATCH_REALM=3Dy
CONFIG_NETFILTER_XT_MATCH_SCTP=3Dy
CONFIG_NETFILTER_XT_MATCH_STATE=3Dy
CONFIG_NETFILTER_XT_MATCH_STRING=3Dy
CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dy

