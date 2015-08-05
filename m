From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: Re: Tree view for rules/chains?
Date: Wed, 5 Aug 2015 12:30:40 -0700
Message-ID: <20150805193040.GA14052@Mail.Linux-Consulting.com>
References: <CAGYMsbtfZWaFfE7XzKOhJCoSexZ50KBMmzngwhi4i3h_fUNYFA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGYMsbtfZWaFfE7XzKOhJCoSexZ50KBMmzngwhi4i3h_fUNYFA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Miller <johnmill@brandeis.edu>
Cc: netfilter@vger.kernel.org


hi ya john

On Wed, Aug 05, 2015 at 12:50:43PM -0400, John Miller wrote:
> Hi folks,
> 
> We keep pretty simple firewall rulesets for the most part.  That said,
> it'd be nice to be able to display chains and rules in a tree-based
> format: it'd help to visualize more complex rulesets.  Do you all know
> of any existing tools that'll let me display things in a tree
> structure--sort of the iptables equivalent of the 'tree' command for
> files and directories?

how and what would you want to change for the output of "iptables -nvL"

you could start with:
	iptables -nvL | awhk '{ show only what you want to see}'

pixie dust
alvin
# http://IPtables-BlackList.net
#
