From: "Brian Mearns" <mearns.b@gmail.com>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Fri, 29 Aug 2008 08:28:19 -0400
Message-ID: <4df3a1330808290528s70be7ac6r4da4fdb9b4a0b1c0@mail.gmail.com>
References: <488A7D17.4070506@gmail.com>
	 <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com>
	 <488EF032.5020000@gmail.com>
	 <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr>
	 <48B744CC.6080903@gmail.com>
	 <alpine.LNX.1.10.0808290748360.30197@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=R05BDBym2wPIRlWBw2hkwxNBSOorYk2RWi8ZJlDMLvc=;
        b=d2Rv2eG/37tEA4JG5RfzfRiph5iJDsGQDWDqzKl/p6akZfPgnN3cGCWGpsM9CDllCW
         cGQQ84hph7Ls0mqtPJ9dnXB44fYwj5HonewrG9Hv/P/LLw61+JS2zrKykqX1uT0SboYc
         SkeeAhmF/Xq7cqVE22jdfF/B4NYiaESqvrrLI=
In-Reply-To: <alpine.LNX.1.10.0808290748360.30197@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Andrew Schulman <andrex@alumni.utexas.net>, netfilter@vger.kernel.org

Thanks Jan, responses below:

On Fri, Aug 29, 2008 at 7:53 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
<snip>
>> I found libxt_TARPIT.so in /usr/local/libexec/xtables/. Is it in
>> the wrong spot or something?
>
> If you used -combined, there is no problem, as the same prefix (see
> below) is passed to both the bundle's components ./configure. You may
> need to run `depmod -a` after make install.
>
> I added a patch that will always do this now.
>

Sorry, I tried looking through the man page for depmod, but it's not
very clear to me: what will that do for me, and does it matter where I
run it from?

Thanks,
-Brian
