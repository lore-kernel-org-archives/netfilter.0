From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Where to drop packets ...
Date: Tue, 12 Nov 2002 09:08:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021112090821.EYP27595.mta05-svc.ntlworld.com@there>
References: <1037022417.16834.64.camel@rayw>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037022417.16834.64.camel@rayw>
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
To: netfilter@lists.samba.org

On Monday 11 November 2002 1:46 pm, Ray Leach wrote:

> Hi
>
> Is it better to drop or reject packets in the mangle-prerouting table or
> in the filter-forward chain?

Filter-forward.

The mangle tables are for mangling packets.

The filter tables are for filtering them.

Drop and reject are filtering actions.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

