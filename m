From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: IPTABLES vs Checkpoint
Date: Wed, 27 Nov 2002 01:13:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127011338.D14289@funkyjesus.org>
References: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za> <1038349954.22977.34.camel@tux.go-nix.ca>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1038349954.22977.34.camel@tux.go-nix.ca>; from nix@go-nix.ca on Tue, Nov 26, 2002 at 05:32:34PM -0500
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 26, 2002 at 05:32:34PM -0500, Nix N. Nix wrote:
> On Tue, 2002-11-26 at 14:28, Wayne de Nobrega wrote:

<snip>

> Nonetheless:  Checkpoint and iptables are not necessarily mutually
> exclusive.  Consider the following setup:
>     ________      __________      ________      ________________
>    /        \    /          \    /        \    /                \
>   | Internet +--+ Checkpoint +--+ iptables +--+ Internal Network |
>    \________/    \__________/    \________/    \________________/

As stated elsewhere, Checkpoint isn't just a proxy server.

But anyway, if it was a mere proxy, wouldn't you want it on the clean side
of the iptables box, rather than the dirty side?

-- 
FunkyJesus System Administration Team


