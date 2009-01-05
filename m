From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: iptables terminating targets
Date: Mon, 5 Jan 2009 12:57:11 -0800
Message-ID: <49627434.1d078e0a.1f5a.3263@mx.google.com>
References: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com> <49626c31.1e078e0a.2f44.ffff94af@mx.google.com> <4ls4m4hj393j1ekptolcv97rsk8je5isuv@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:content-language:thread-index
         :message-id;
        bh=XXrRQmk0njKLsqmnkUsJoU1Q8Iw59OdK4d+abj5UxPs=;
        b=vCfWDILM02OXriM8SodJcSr4kG1FiR5Or5chTqJErbGvcXpsuvQ5Adw4LPqFEXuruB
         UqhlPcmgmgMAtjwXGsRG0Pt59JYF7gyezOyMr2uRFlMjDlDl0RZ2mOz3dEhypO94hBO+
         C84yBvwbL+bPw+FIo4heFWiy4Dp+7KcQ2zdGM=
In-Reply-To: <4ls4m4hj393j1ekptolcv97rsk8je5isuv@4ax.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: BrainChild@Skyler.com, netfilter@vger.kernel.org

> 
> <snip>
> 
> >Up to the (false) conclusion, all your assumptions are true. I believe
> I see
> >the source of your confusion, which was also mine when I started with
> >iptables.
> >Each built-in chain is traversed at a different location (a.k.a. hook)
> in
> >the packet path. See two graphic variations of this below.
> >A terminating target means that the packet has completed traversing
> the
> >current built-in chain, but might be further processed by other
> chains, by
> >means of a different hook.
> >Specifically for the FILTER table, which is your main concern for a
> >firewall, its hooks are located such that each packet goes through
> exactly
> >one built-in chain of the table.
> >
> >HTH,
> >Gilad
> 
> This seems at odds with another answer I got to this question:
> 
> "DROP target means packet is dropped and no other chains are
> traversed. ACCEPT means that no more rules in the current built-in
> chain get considered but traversal of next built-in chain occurs."
> 
> This answer seems to say that there are 2 different behaviors for
> "terminating" targets - that one (DROP) behaves as I interpreted the
> documentation, while the other (ACCEPT) behaves as you describe above.
> 
> I can't seem to reconcile these two answers.
> --

It's simple. The other guy phrased things better than me :-)


