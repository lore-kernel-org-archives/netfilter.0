From: "Billy Crook" <billycrook@gmail.com>
Subject: Re: Question about packet flow picture.
Date: Mon, 25 Aug 2008 22:23:40 -0500
Message-ID: <a43edf1b0808252023w4e48d4c5j23e2bfa3014f156@mail.gmail.com>
References: <4c4b58e80808251641ge01d7e4pca4fff19e8621d8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=D/lLziubYg/CgTJTUKtARDFc8bry+9HpOqnaYb/PlaM=;
        b=sE0/VQgSqB+ZfduyZz9IR+lfFIYyacz8a2uzuppsoKgt/mae+BGLnATf6N3tNnJps5
         XLD7DcB1rRWzCHCSD3Dkr09rKdTCyuVYZ1KTXJPkc40Y3FoXPhCmM+fvVkN+c8gMnvck
         BCYny5ZvJ5KhDKCIGEllQZAHkUSt72BY73LQs=
In-Reply-To: <4c4b58e80808251641ge01d7e4pca4fff19e8621d8a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jose Ildefonso Camargo Tolosa <ildefonso.camargo@gmail.com>
Cc: netfilter@vger.kernel.org

I do not believe it is accurate.  Primarily because  it appears to
indicate that forwarded packets go through the INPUT and OUTPUT
chains, and AFAIK, they do not.

This is much newer, and I believe, more accurate:
http://jengelh.medozas.de/images/nf-packet-flow.png

For something simpler, iptables-only, and less intimidating:
http://dmiessler.com/images/DM_NF.PNG

I have also referenced this in the past:
http://linux-ip.net/nf/nfk-traversal.png

On Mon, Aug 25, 2008 at 18:41, Jose Ildefonso Camargo Tolosa
<ildefonso.camargo@gmail.com> wrote:
> Hi everybody!
>
> I have been using for quite a while this picture (
> http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png ) as a
> reference for understanding/teaching iptables packet flow, I know it
> is still valid, but I don't know how accurate is it, I mean, there has
> been changes to the netfilter code since the time that picture was
> made, the first thing you can see is that, there is no raw table
> there.
>
> Yes, I know, that's from ebtables site, but It also includes netfilter tables.
>
> Can anybody take a look at it and evaluate whether or not it is still accurate?
>
> Thanks in advance,
I
> Ildefonso Camargo
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
