From: supercodeing35271 supercodeing35271 <supercodeing35271@gmail.com>
Subject: Re: Who can give me any existing iptables rules for reference?
Date: Wed, 10 Feb 2010 00:12:08 +0800
Message-ID: <28efc0211002090812n45a75ea3x62538e7d43f029d9@mail.gmail.com>
References: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
	 <20100207161539.GA21229@minipax>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=7cAq37X1sAIsUWqGM8vtiTjCXB8MIRz+lafxUsJ5uJw=;
        b=iofxMoPL1nWUCQgqXP53Rr0eRaMm/SeGpSka4H7TyI3jK3SG0DGVMXAaW8A6oJZ648
         0+BJJo96K9pwmLU0Y+FwTjL8f3uAo0JfnG+Tip84WVHYiK/3pKPfzBWSma+GN4ASZeo4
         MmRNYh2029tyyXoGdE9FZemGs9PS+8igKiH2Y=
In-Reply-To: <20100207161539.GA21229@minipax>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thank you for your advice,seem that i should

On Mon, Feb 8, 2010 at 12:15 AM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Sat, Feb 06, 2010 at 08:50:20PM +0800, supercodeing35271
> =A0 supercodeing35271 wrote:
>> Hi,i'm a rookie.As learning netfilter/iptables for the first time,
>> i wanna look some good existing iptables rules scripts as that i
>> think reading good rules scripts will be useful.
>
> A problem in that is that a script is not typically the best way to
> load a set of rules. Race conditions can occur when more than one
> trigger invokes the firewall script, when the first instance wasn't
> completed yet. iptables-restore(8) (of a ruleset which had been
> saved with iptables-save(8)) is the solution to this problem; it
> loads the entire ruleset into memory atomically.
>
> I think a lot of folks who want to learn firewall skills get caught
> up in trying to do fancy bash(1) things. And way too many of the
> ready-made firewall scripts I have seen are clueless and over-
> complicated with silly shell tricks.
>
>> So anyone here can share some rules or tell me where to see any
>> good rules scripts. =A0I must underline that i just need some
>> references, i do not have any other reason about this.
>
> I would start with a tutorial such as the ones at netfilter.org and
> Oskar's frozentux tutorial. Those are slightly out of date, but
> should still give you a good start. The man page is maintained, and
> should be a good reference for syntax and application of the various
> match and target extensions.
>
> Unfortunately I am not aware of a good, up-to-date basic tutorial
> that I could recommend. I have not had the time to try to start one,
> myself.
> --
> =A0 =A0Offlist mail to this address is discarded unless
> =A0 =A0"/dev/rob0" or "not-spam" is in Subject: header
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
