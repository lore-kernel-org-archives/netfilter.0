From: SamLT <sam@sltosis.org>
Subject: Re: iptables and vlan tagging
Date: Tue, 10 Jul 2012 12:13:14 +0200
Message-ID: <20120710101314.GB5772@tosh.sltosis.org>
References: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1341915197; bh=FnxTyt4i3bHc2QueKBA7vYEBTc/ibrgM4XJIusbS6qo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lryXvzigrpZlLP5cfhD3r6CJZFU71Sip+9PBKTTKu6zaNtS37UyT0HSlTHuKZxCwv
	 49Dl5CwM+X2rwE288E3Iwxo0E6Py/EViVy3iPrNR/0wRTDoO2kInGw7mEIHdViUxVf
	 Q+PcJ+rTUA2qHvhM+qT0wHNCsFRkNGUzCeq8nGtQ=
Content-Disposition: inline
In-Reply-To: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Jul 10, 2012 at 05:04:15PM +1000, Nikolai Lusan wrote:
> Hi,
> I have a 2 vlans, 1 untagged with private IP's (vlan1) and 1 tagged
> (vlan2) with non-private IP addresses, and I want to remove the vlan
> tags before sending vlan2 packets out over my internet link and add them
> back before sending packets from the internet to vlan2. Should this be
> done in the iptbales mangle table? or do I need to use ebtables? And
> exactly how should I go doing this?

I'm not really sure to understand your question. Viewing the commands
you used to set this up would certainly help.

anyway, assuming you configured this with iproute: eg:
ip link add link eth0 eth0.10 type vlan id 10
...

Then the tagging depends on your routing:
   * If it has to go out from eth0.10 -> tagging
   * If it has to go out from eth0 -> no tagging


HTH


> 
> Thanks
> -- 
> Nikolai Lusan <nikolai@lusan.id.au>


