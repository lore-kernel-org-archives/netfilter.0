From: "=?windows-1257?q?K=E2rlis_Repsons?=" <karlis.repsons@gmail.com>
Subject: Re: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 20:04:44 +0000
Message-ID: <200902032004.44533.Karlis.Repsons@gmail.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com> <200902031940.09273.Karlis.Repsons@gmail.com> <49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=f+NQpHhMjVFlbry2gJykwCg3XZvlo2X+crHtYHULkA4=;
        b=s0Dhr9EaOc1cMUdZPn6+4jB9ZY5UYML+SBtlWUHjrT14RQQAhEVfg/ZNFH3M03LvlV
         4qSg7hpyykDs7HnhlYbVwmOS7gJVywe28rR4dEoU4jwhXBOkVEUCTLEXB0LXuBOmlCY4
         crmXTcRKpZEy98iMfnQoD06GY26E4VKXFLYBk=
In-Reply-To: <49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@vger.kernel.org>

On Tuesday 03 February 2009 19:49:22 you wrote:
> > -----Original Message-----
> >
> > On Tuesday 03 February 2009 19:21:05 Gilad Benjamini wrote:
> > > Your description is not very clear, but my guess is that you want to
> >
> > run a
> >
> > > bridge on this PC. "man brctl" is a good place to start.
> >
> > It is all very simple: think of one computer with two RJ45 inputs, one
> > connected to LAN, other to laptop, which needs access to LAN too. The
> > problem
> > is: I have only one cable to LAN and no extra switch.
>
> You say yourself that your problem is the lack of a switch; i.e. you want
> your Linux machine to serve as the switch; i.e. you need a Linux bridge

Well, most likely you are right and I will spend some more (but maybe not as 
much) time tomorrow to set up that bridge. I just want to know, if its 
absolutely necessary and there is no way to do routing / forwarding?
