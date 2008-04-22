From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 10:48:49 +0200
Message-ID: <1208854129.2225.3.camel@tara.firmix.at>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
	 <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
	 <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
	 <002501c8a416$78a11ec0$8119fea9@MingChing>
	 <F124820A-A657-48D2-8670-A52F58493AE6@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F124820A-A657-48D2-8670-A52F58493AE6@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Charles M. Romestant F." <cromestant@gmail.com>
Cc: Ming-Ching Tiew <mingching.tiew@redtone.com>, "<netfilter@vger.kernel.org>" <netfilter@vger.kernel.org>

On Mon, 2008-04-21 at 21:03 -0430, Charles M. Romestant F. wrote:
> Actually no compile errors whatsoever.  Not at computer at the momment 

add at least "-Wall -Wextra -Werror" to the gcc-command line and fix the
found errors.
Caveat emptor: if your gcc doesn't understand "-Wextra", try to get a
more current one.
[...]

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


