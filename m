From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Guaranteeing bandwidth through netfilter-based router?
Date: Fri, 7 Jan 2005 08:48:09 +0000
Message-ID: <200501070848.09790.gdh@acentral.co.uk>
References: <132A17DB-6023-11D9-BC93-000A95CFE5AA@latencyzero.com>
	<20050106222649.GA26877@acentral.co.uk>
	<1105064717.7100.78.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105064717.7100.78.camel@localhost>
Content-Disposition: inline
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

On Friday 07 January 2005 02:25, John A. Sullivan III wrote:

> Not really, there are pertinent elements of netfilter.  Linux will to
> some rudimentary traffic shaping based upon the TOS bits.  One can
> change those in the mangle table.  Set the VoIP packets as best as you
> can identify them with TOS of minimize-delay - John

Interesting stuff - I didn't know the kernel itself would prioritise packets 
simply by having these bits set, I thought they only existed so that some 
upstream router / ISP could manage them.

Cheers,
Gavin.

