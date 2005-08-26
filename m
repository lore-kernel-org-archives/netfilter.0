From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: disabling conntrack ...
Date: Fri, 26 Aug 2005 14:42:22 +0200
Message-ID: <430F0E2E.4040106@mnemon.de>
References: <B81183566FF73947875C3A207CD60AA61DFAE4@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B81183566FF73947875C3A207CD60AA61DFAE4@LONEX01.tideway.com>
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

Kerryn Wood schrieb:
> Hi All,
> 
>  
> 
> I need to disable connection tracking and, although I've seen an old
> post here and a few mentions doing a search of the web, I haven't been
> able to find any conclusive information.

If you *really* want to disable connection tracking, configure your
kernel without NAT support. If this is no option for you, compile in raw
table and use the NOTRACK target.

Have a nice time,

Joerg

