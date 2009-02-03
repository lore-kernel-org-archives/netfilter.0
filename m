From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 11:49:22 -0800
Message-ID: <49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com> <4988992f.20038e0a.3b6a.ffffd8a6@mx.google.com> <200902031940.09273.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=yprQQ3gHdDB0AyLW6jv15dRZGd0genfcpmQGFCXwM+0=;
        b=mkO27dLRzz6RJA5V7k8ZZwm1a7WNCX5/BVZU7Cc7ie5OR+A/v1DH5hLSz4Y80jj8Ge
         ZZFDHitj4Mb1mck230aAGV2OlYD3x5Qn91PEo6rPmCd4m+eN06MxEB9ad6RAQEcAg0uw
         mfkJUDYWR1sXxisfw7g3ZVJhmtn3z5BafGmB8=
In-Reply-To: <200902031940.09273.Karlis.Repsons@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?windows-1257?Q?'K=E2rlis_Repsons'?= <karlis.repsons@gmail.com>, 'netfilter' <netfilter@vger.kernel.org>


> -----Original Message-----
> 
> On Tuesday 03 February 2009 19:21:05 Gilad Benjamini wrote:
> > Your description is not very clear, but my guess is that you want to
> run a
> > bridge on this PC. "man brctl" is a good place to start.
> It is all very simple: think of one computer with two RJ45 inputs, one
> connected to LAN, other to laptop, which needs access to LAN too. The
> problem
> is: I have only one cable to LAN and no extra switch.
> 

You say yourself that your problem is the lack of a switch; i.e. you want
your Linux machine to serve as the switch; i.e. you need a Linux bridge

