From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Thu, 6 Nov 2014 09:37:44 -0500
Message-ID: <CAPJdpdA-zXM+rhu5FHxCVgg1DVHAkuZaeord4JzJcZbZUz3uJw@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
	<CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
	<CAH_OBifYvkOK-RqS76ODT2En1r0bN99oU8cCQFJdDE7CGH67_g@mail.gmail.com>
	<CAPJdpdBj2va5U_PZs_WSWe0XWX4jreSdMBEpOFO-_Fpi=EEKdA@mail.gmail.com>
	<20141105235538.GA3599@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=wz+2j+yEPS1FBGG7imFYqhPfYh2534i1pTDSM0d5qb8=;
        b=IB/HU7wtjWfkadwwlLibmsHjWruEKzYnvTnGAh1whN7hwmKkSLil8jObN8aF4tRjuE
         uRD0IYzrbMMMOEY2zEqWRLdTeb/1ZnH39zAkKZ52hgvZmuUmyfgfm7a5g5uyXnWkmbfs
         xLIJq7+oKB2y9qLRfyAVj0x1uo6ACGb0cxfEB+ab3Al6GgIk/DZeRZz8xuAckBkWNPnE
         RAZQANV+o6LxI+zbdghtCqIUfQq1ZQ0PXMdOrOBEC7FNmrRudL3eJtqrSQVzWU+q0Qrs
         398XzBW7s3Wovuoetm9dUjh7f9BbUkeL0Z9RLKoijbV5HSdDLG1iDSQFSiRTbh5Sjxm4
         5IUQ==
In-Reply-To: <20141105235538.GA3599@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: shawn wilson <ag4ve.us@gmail.com>, Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>, Ricardo Klein <klein.rfk@gmail.com>, netfilter <netfilter@vger.kernel.org>

I asked about update the documentation before and no one responded. I
was perfectly willing to do it I just didn't know the procedures.
I know its on the todo list and has been for quiet some time. I was
stunned that no one replied to my inquiry.


On Wed, Nov 5, 2014 at 6:55 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, Nov 05, 2014 at 05:43:39PM -0500, Paul Robert Marino wrote:
>> I've actually been doing this successfully with conntrakd, keepalived,
>> and quagga
>>
>> Essentially I'm using quaga for OSPF and BGP externally with equal cost paths.
>>
>> For conntrackd with FTFW and "DisableExternalCache On"
>>
>> Do NOT use the howto's on the web or the examples that come with
>> conntrakd or keepalived for configuring keepalived they are outdated
>> and can cause major problems.
>
> It would be great if you can contribute a patch to extend the
> conntrack-tools manual to document this. The documentation is
> available in docbook format in the git tree. People asks for this
> configuration on the mailing list from time to time.
>
> Thanks.
>
> P.S: I think that update should also indicate that possible race
> conditions may happen between the synchronization and packets in
> active/active asymmetric path, so people are aware of it too.
