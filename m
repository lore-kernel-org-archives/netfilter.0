From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: Mon, 04 Aug 2003 16:49:58 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2E1026.2040000@mega-bucks.co.jp>
References: <3F2DEB07.1060801@mega-bucks.co.jp>	 <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>	 <3F2E0B71.9010408@mega-bucks.co.jp> <1059982839.921.10.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059982839.921.10.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher wrote:

> 
> Also check if your conntrack table is not full (see
> /proc/net/ip_conntrack file) and kernel log entries for some related
> errors.

Had a look and no errors were logged in that file.

Also, is my rule overkill in the sense that specifying all three of NEW,
ESTABLISHED and RELATED states is not necessary. I could get away with
just NEW and RELATED?

thanks,

Jean-Christian Imbeault


