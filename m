From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 21:10:35 +0100
Message-ID: <1372536635.3924.89.camel@andrew-desktop>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	 <CADuigkUCfERrvP3cM_nXPiP-27MP3FPRdf0rzPVNSqDEJ3YQMg@mail.gmail.com>
	 <alpine.DEB.2.00.1306292014350.26742@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1306292014350.26742@blackhole.kfki.hu>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1372536646;
	bh=7qe0Pdl1cuBApxXw/aFLI/ylzKCQO5S8nVcw1IowY2w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=KtTcgeDYBhXhxY8neW1DmGDFli2lEOKeqqgkpg374KGQF3HwSyiQfpxnCJ9L3duZy
	 I+0MRsMkz4CEW8qSC8MXI8wOC9rREgVOMj2oAcEkVOgzkZUQYk9oPLyMyZ36Mov3Bl
	 osaxqo8Ktt3xPF9NOBfCZilEfVVweXiVAgfWNQus=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Ricardo Klein <klein.rfk@gmail.com>, Nick Khamis <symack@gmail.com>, netfilter <netfilter@vger.kernel.org>

On Sat, 2013-06-29 at 20:19 +0200, Jozsef Kadlecsik wrote:
> > > * User logs into the website, and provides mac address
> > > * We insert the record in the database as an allow rule...
> > > * Restart iptables?
> 
> That's pretty similar to a captive portal, which is quite simple to setup: 
> you need a small webpage written say in PHP (IP and MAC can be gathered 
> directly if the webserver is on the same LAN) and a bitmap:ip,mac type of 
> set with timeout, and some static iptables rules. It's almost trivial if 
> the things run on the gateway.

And an example is here:

http://www.andybev.com/index.php/Using_iptables_and_PHP_to_create_a_captive_portal

Except it does not use ipset, which would be a *much* better way of
implementing it ;-)


