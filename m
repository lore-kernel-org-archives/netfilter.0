From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: Mon, 04 Aug 2003 16:29:53 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2E0B71.9010408@mega-bucks.co.jp>
References: <3F2DEB07.1060801@mega-bucks.co.jp> <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Cedric Blancher <blancher@cartel-securite.fr>

Cedric Blancher wrote:

> Do you use patches such as tcp-nopickup that could make an ACK packet
> fall into INVALID state because not matched against any existing
> conntrack entry ?

How can I check? I installed iptables v1.2.8 with no patches so I don't
think I ahve tcp-nopickup installed.

Thanks,

Jean-Christian Imbeault


