From: "Charles Romestant" <cromestant@gmail.com>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 08:26:33 -0400
Message-ID: <5078d3df0804220526u46919df1wf9af2f6fc9bb639a@mail.gmail.com>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
	 <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
	 <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
	 <002501c8a416$78a11ec0$8119fea9@MingChing>
	 <F124820A-A657-48D2-8670-A52F58493AE6@gmail.com>
	 <1208854129.2225.3.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=L14rpBBL9iK0MI+jD0iD1JMZpnD6zrhoBimPLi8d+Sw=;
        b=B8mPZCK72R7A03Dhv5NKalyV3MVaXZlLo1BIfkPwjC5/Jc/hd+e4gr9Re1kLUnwA532QZ+JzqhIp6PxJdik3S5cuJf0ZhZyBQwqvaAIhWd54uFHYV1w8+skHHBDcd4vnmiDoSg8vkcr4OqtPKjXXB0CHDnpdy9QiGHbpbbzn4Sk=
In-Reply-To: <1208854129.2225.3.camel@tara.firmix.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Ming-Ching Tiew <mingching.tiew@redtone.com>, "<netfilter@vger.kernel.org>" <netfilter@vger.kernel.org>

thanks all, got it to work

On Tue, Apr 22, 2008 at 4:48 AM, Bernd Petrovitsch <bernd@firmix.at> wrote:
> On Mon, 2008-04-21 at 21:03 -0430, Charles M. Romestant F. wrote:
>  > Actually no compile errors whatsoever.  Not at computer at the momment
>
>  add at least "-Wall -Wextra -Werror" to the gcc-command line and fix the
>  found errors.
>  Caveat emptor: if your gcc doesn't understand "-Wextra", try to get a
>  more current one.
>  [...]
>
>         Bernd
>  --
>  Firmix Software GmbH                   http://www.firmix.at/
>  mobil: +43 664 4416156                 fax: +43 1 7890849-55
>           Embedded Linux Development and Services
>
>
>



-- 
Charz
