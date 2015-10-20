From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: Re: nft 'script' not working
Date: Tue, 20 Oct 2015 20:15:53 +0200
Message-ID: <20151020181553.GA1430@salvia>
References: <1391689054.175444.1445351667675.JavaMail.ngmail@webmail12.arcor-online.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391689054.175444.1445351667675.JavaMail.ngmail@webmail12.arcor-online.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giorgio.nicole@arcor.de
Cc: netfilter@vger.kernel.org

On Tue, Oct 20, 2015 at 04:34:27PM +0200, giorgio.nicole@arcor.de wrote:
> Hi,
> 
> that's right but my main script fw_basic.nft should be a read only file;
> the dynamic behavior should result from the content of the included files
> at the end of the script.
> 
> ...
> include "/var/lib/nftables/user.nft"
> include "/var/lib/nftables/dnats.nft"
> 
> In my target system I have two configuration programs/daemons: the first
> generates the nft file '/var/lib/nftables/user.nft' with rules from the user, the
> second generates dnat rules (actually one rule with a set of multiple targets)
> on the basis of zeroconfig-found devices in the file '/var/lib/nftables/dnats.nft';
> 
> The main nft script then includes both the generated files actually implementing
> a dynamic firewall config.
> 
> This also works in case the user, for example, disables his part of the configuration:
> in this case the file '/var/lib/nftables/user.nft' will be empty and the next call to the script
> '/etc/nftable/fw_basic.nft' will actually (atomically) remove the user configs from the firewall.

Make sense.

Will ping you once I have push out the kernel patches to remove the
existing limitation on updating objects from the same batch, so you
have the chance to test it.

Thanks.
