From: Jason Opperisano <opie@817west.com>
Subject: Re: Filtering in the nat table
Date: Tue, 22 Mar 2005 11:29:04 -0500
Message-ID: <20050322162904.GA18464@bender.817west.com>
References: <20050322160638.GA347@ikkoku.ath.cx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050322160638.GA347@ikkoku.ath.cx>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Mar 22, 2005 at 05:06:39PM +0100, Toby wrote:
> Dear netfilter users,
> 
> 	I've found it handy to put filtering rules in the nat table,

<--snip-->

do *NOT* filter in the nat table.  only --state NEW packets ever traverse
the nat table.

if you want to filter packets pre-filter table, do it in mangle.

-j

