From: "Igor M Podlesny" <for.poige+linux.nf@gmail.com>
Subject: IP_MULTICAST_LOOP? /Re: Netfilter "sees" locally originated multicast traffic as external-incoming one/
Date: Sun, 23 Mar 2008 23:26:35 +0700
Message-ID: <43d009740803230926g20ec6f5dgc17ff4ece45097f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=555wyrnvdAAf2B2Uw6PXRF97KaniUsUvHStVxTgYqrk=;
        b=nrFf1hwtdtBqPNpbVySqvnz3D6QIDlvzAJ+PFx0dgTCJjzkdLDoh7OhUC/AtqxZI876NjYwiOGgJOzcZXoGCPoo6jO4UiX+C+srFkcGICHVfvO4TArAHHwgNtKY5qsxbwIJ31PWHVarTEsv07YeMBRTGBhEFQLtNTO7QioLJMPQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 23/03/2008, Igor M Podlesny <for.poige+linux.nf@gmail.com> wrote:
> Hello!
>
>  Recently my home network got additional network connection, so I
>  decided to try using Zebra to see if the whole set-up would be simpler
>  and easier to maintain. During the test period I've noticed that
>  Netfilter "sees" locally originated multicast traffic as
>  external-incoming one:
[...]
>  I'm not sure neither whether is this a bug or "feature" nor is this
>  Netfilter's bug/feature at all -- more likely it's the kernel's issue.
>  May be it's due to RIPv2/Zebra's "glitches"(?). What would you say?

	I dug a bit more and can suggest that RIPv2/Zebra sets
IP_MULTICAST_LOOP flag. But then another question arises: is there a
good way to detect such kind a traffic with Netfilter? I mean such a
way that excludes a possibility for bogus traffic being treated as
IP_MULTICAST_LOOP.

-- 
End of message. Next message?
