From: Patrick McHardy <kaber@trash.net>
Subject: Re: Bug/Problem with DNAT on OUTPUT chain (-t nat -A OUTPUT) that
 breaks routing? (fwd)
Date: Thu, 23 Oct 2003 04:37:56 +0200
Sender: netfilter-devel-admin@lists.netfilter.org
Message-ID: <3F973F04.8090703@trash.net>
References: <Pine.LNX.4.44.0310221957110.29188-100000@kinison.puremagic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310221957110.29188-100000@kinison.puremagic.com>
Errors-To: netfilter-devel-admin@lists.netfilter.org
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter-devel/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Evan Harris <eharris@puremagic.com>
Cc: netfilter@lists.netfilter.org, netfilter-devel@lists.netfilter.org

Evan Harris wrote:

>I am using a stock linux kernel 2.4.20, with iptables 1.2.8.
>
>  
>
Try 2.4.22 first, there were countless changes, some related to
routing.

Best regards,
Patrick



