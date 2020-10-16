From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables iifname and currently unknown interfaces
Date: Fri, 16 Oct 2020 12:54:22 +0200
Message-ID: <20201016105422.GA1151@salvia>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Sander <r.sander@heinlein-support.de>
Cc: netfilter@vger.kernel.org

On Fri, Oct 16, 2020 at 12:37:58PM +0200, Robert Sander wrote:
> Hi.
> 
> with iptables it was possible to specify "-i ifacename" even when the
> interface was currently not available.
> 
> nft bails out with an error:
> 
> ./nft:225:1-75: Error: Could not process rule: No such file or directory
> add rule ip filter FORWARD iifname bond0.16 oifname bond0.42 accept
>
> We are generating a single firewall configuration for a number of
> firewalls with different interfaces. How do we migrate to nftables?

Strange, that rule works fine here and I don't have such device.

iifname allows you match on the device name, so such interface does
not need to be available.

What nft version and kernel are you using there?

Error: Could not process rule: No such file or directory
add rule ip filter FORWARD iifname bond0.16 oifname bond0.42 accept
            ^^^^^^

With relatively recent nft userspace and kernel, you should get
context on why the ENOENT error is displayed.

Either by missing table like above, or missing chain:

Error: Could not process rule: No such file or directory
add rule ip filter FORWARD iifname bond0.16 oifname bond0.42 accept
                   ^^^^^^^

What nft version are you using?

Then, moving forward, a general error means that some of your kernel
components in missing. Did you compile kernel, if so, could you also
post your .config file for your kernel?
