From: giorgio.nicole@arcor.de
Subject: Aw: Re: Re: nft 'script' not working
Date: Tue, 20 Oct 2015 16:34:27 +0200 (CEST)
Message-ID: <1391689054.175444.1445351667675.JavaMail.ngmail@webmail12.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1445351667; bh=WDvdv/yW1XTSDZFgaRsZeZd0sw9lVGnvH9d8FX/LHpI=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=dVfHnUfxOq8KSQLnAwPXdR8zVrd7IDFLvNf6/HAarJi5RKLAhz9pU/Sw9R1a+0qrC
	 NPh1QcJYDlSI6ZZ7Eukn7UduhN7NrUXhO/69r1BLcDW8c3wY+ZkjGMBdlfizEKC6x3
	 aCOrQkOYTvf8T4aOjazTjqM9r+PImwZABi9TIL38=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pablo@netfilter.org
Cc: netfilter@vger.kernel.org

> On Tue, Oct 20, 2015 at 02:37:46PM +0200, giorgio.nicole@arcor.de wrote:
> > Hi,
> > 
> > thanks for your answer,
> > 
> > your answer to the first question confirms what I already supposed,
> > my workaround is now to add a last 'drop' rule to the input table
> > instead of changing the table policy:
> > 
> > add rule inet filter input drop
> > 
> > instead of
> > 
> > add chain inet filter input { policy drop; }
> 
> You also can specify the policy by the time you create the basechain
> in one go:
> 
> add table inet filter
> add chain inet filter input { type filter hook input priority 0; policy
> drop; }
> 
> 
Hi,

that's right but my main script fw_basic.nft should be a read only file;
the dynamic behavior should result from the content of the included files
at the end of the script.

...
include "/var/lib/nftables/user.nft"
include "/var/lib/nftables/dnats.nft"

In my target system I have two configuration programs/daemons: the first
generates the nft file '/var/lib/nftables/user.nft' with rules from the user, the
second generates dnat rules (actually one rule with a set of multiple targets)
on the basis of zeroconfig-found devices in the file '/var/lib/nftables/dnats.nft';

The main nft script then includes both the generated files actually implementing
a dynamic firewall config.

This also works in case the user, for example, disables his part of the configuration:
in this case the file '/var/lib/nftables/user.nft' will be empty and the next call to the script
'/etc/nftable/fw_basic.nft' will actually (atomically) remove the user configs from the firewall.

giorgio
