From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Restoring rulesets containing dynamic sets with counters
Date: Tue, 10 Mar 2020 14:09:43 +0100
Message-ID: <20200310130943.wg24juixdz4fzvom@salvia>
References: <5e5cfaed-d2c6-02e1-8019-dd6ba2613034@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e5cfaed-d2c6-02e1-8019-dd6ba2613034@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

On Mon, Mar 09, 2020 at 07:35:15PM -0400, Frank Myhr wrote:
> Hi,
> 
> I've created a ruleset that contains several dynamic sets with counters that
> are incremented from the packet path using rules like:
> update @suspect { ip saddr counter }
> 
> After awhile in operation, "nft list ruleset" produces output like:
> table ip ip_filter {
> 	set suspect {
> 		type ipv4_addr
> 		size 65535
> 		flags dynamic,timeout
> 		timeout 30d
> 		gc-interval 1d
> 		elements = { 1.2.3.4 expires 19d23h52m27s576ms counter packets 51 bytes
> 17265 }
> 	}
> 
> But "nft -f" then chokes when loading the saved ruleset, with
> "Error: syntax error, unexpected counter, expecting comma or '}'".
> 
> For now I can use sed to blank the counter text before reloading the ruleset
> (as after reboot). That's bit clunky, and obviously loses the counter
> values.
> 
> I do want to keep the dynamically-added elements across reboot. Is there a
> better way to do so?

Not yet, this is incomplete. I have a unfinished patchset here in a
branch.
