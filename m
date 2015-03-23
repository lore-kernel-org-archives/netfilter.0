From: Laurent Bercot <ska-devel@skarnet.org>
Subject: nftables feature request: don't fail "flush" on nonexistent tables
 (was: nftables: nft fails to add rules to chains)
Date: Mon, 23 Mar 2015 14:32:34 +0100
Message-ID: <551015F2.7060801@skarnet.org>
References: <550B3069.7080209@skarnet.org> <20150322183106.GA4150@salvia> <550F0DBE.7000905@skarnet.org> <20150322190033.GA7145@salvia> <550F1155.5000501@skarnet.org> <20150323114515.GA5552@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150323114515.GA5552@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 23/03/2015 12:45, Pablo Neira Ayuso wrote:
> Please, manually apply this:
>
> http://patchwork.ozlabs.org/patch/453392/
>
> And provide feedback. Thank you.

  Done. It's working beautifully. Thank you.

  Now that I can play with nft, I have a feature request:

  I'm saving my rule set in a file, called whenever the rule
set must be applied/reapplied via nft -f. (It's to be applied
whenever my DHCP client obtains a new lease.)
  I would like the rule set file to be the same for the first
time and the subsequent times the rules are applied. It's only
logical.
  I have to "flush table nat" and "flush table filter" at the
beginning of the file, so nft does not duplicate rules on the
second and later invocations.
  Problem is, the first invocation fails on those "flush" lines,
because the tables are not defined yet!

  Is there a way for me to tell nft -f to ignore failures on "flush" ?
I'm ok with an option to nft if you so choose. I'm also ok with a
warning in my logs, provided nft keeps reading the ruleset, does the
job, and exits 0.

  Thanks,

-- 
  Laurent

