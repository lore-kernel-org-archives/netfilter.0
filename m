From: "Nigel Clarke" <nigel@forever-networks.com>
Subject: RE: IPTABLES vs Checkpoint
Date: Tue, 26 Nov 2002 21:17:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MKEJJFIGIGKMFKMKEEDBAEILCAAA.nigel@forever-networks.com>
References: <20021127011338.D14289@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021127011338.D14289@funkyjesus.org>
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
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.netfilter.org

I guess redundancy is not important? 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Nick Drage
Sent: Tuesday, November 26, 2002 8:14 PM
To: netfilter@lists.netfilter.org
Subject: Re: IPTABLES vs Checkpoint


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



