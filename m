From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 13:32:40 -0800
Message-ID: <4988b807.18068e0a.29e0.ffffcb26@mx.google.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com> <200902031940.09273.Karlis.Repsons@gmail.com> <49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com> <200902032004.44533.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=zSX+mo+jN1RLPlvWxv6LS/g5esnZxTqXAz5YYmsmNPA=;
        b=noTcT6XaFWQ6/Q5Od9BJsT1Lmr8Gl9LIwGSOvL2Fts48JusYiVliztmfGbOMzumDRj
         RO4hLXOSneV/awWT1oUGgxFOnq2/A7ek6/VHfPt3YykvFyZNwF1Q2C2zfd2/lEnWNoxO
         XK9n5MFuN10OV6w7v4yJXPB99T08BcMP2WwtE=
In-Reply-To: <200902032004.44533.Karlis.Repsons@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?windows-1257?Q?'K=E2rlis_Repsons'?= <karlis.repsons@gmail.com>, 'netfilter' <netfilter@vger.kernel.org>

> -----Original Message-----
> Well, most likely you are right and I will spend some more (but maybe
> not as
> much) time tomorrow to set up that bridge. I just want to know, if its
> absolutely necessary and there is no way to do routing / forwarding?
> --

There is definitely a way to do routing, but it's more complicated, and it
seems like a bridge (which is also a forwarding device) better suits your
needs.

