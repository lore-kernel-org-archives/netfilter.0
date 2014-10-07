From: Meike Stone <meike.stone@googlemail.com>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Wed, 8 Oct 2014 00:15:05 +0200
Message-ID: <CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>
	<5434458A.2030701@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=QBKClwDW3z3plhdWE9JfKHJfGflgYqtiGBGD9izYw/0=;
        b=YtmZgP0qnXmRnQGf/kQ/A8k7axqBo0lITGdIx3BaRSjQIMybmoaC2M2URYvHECger6
         3wsAdMJIgrIxs6hk7EcPndS0+IfNWdP0EXVF4eTyIBIvbYBaCf6ySpBUrR6of7f97aJo
         TFcFI/W+x3aYv15SJh84Xape8SHO4rrlakJgGfvDbTRPQqQX924GPkTrqcE7grNubpL+
         MIyfT8/uPwx097NRa21lQ+YlrC3Ou1UufyjtJEbvCmUDTM9puVsOfxdW7TRxonn9fIxR
         LRdckjJtcgARDKdJTsIdvst9rsph3mdadMWvJui3iYiV3mI5X+yUZgZrj3k42cnRZ/9h
         izNA==
In-Reply-To: <5434458A.2030701@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> I am still unsure why do you need the complications?
> A basic masquerade rule should be good enough to work with a fileserver.

Yes and No, SMB does work over NAT but NOT for more than ONE Client.
The reason is described in the link I gave
(msdn.microsoft.com/en-us/library/ee441661.aspx)
There are two possibilities.
- Clients counts VC from 1 instead 0
- Server ignores "special meaning -> reseting) of VC=0

If Fileserver = samba, the you have the option to disable reseting on VC=0
(reset on zero vc, default disabled) On Windows server does not exist
such option.
=> .. or read man page for smb.conf and read "reset on zero vc"


For Clients, Microsoft brings for Windows 2008/Windows 7 and greater
a special patch, that
counts from VC from 1.

Now, over 100 Terminal Servers (w2k3) must use a fileserver in a other
company ....
Update all of them is no option in short time ...

> Maybe you are having other settings wrong.
No!

> You can use a routing rule to use a specific device with specific IP
> for a specific src.
I don't understand ...

> iptables do not really supports dynamic NAT rules by default.
that sounds, that there are hacks available?


Thanks Meike
