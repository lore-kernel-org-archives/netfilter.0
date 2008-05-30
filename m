From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: TEE in filter table
Date: Thu, 29 May 2008 18:27:58 -0700
Message-ID: <d95317090805291827n6fc80781wcf4078099a086a0a@mail.gmail.com>
References: <d95317090805291827h1209422bl37ef53eb720c6609@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=H1B9BC1RfD6ploewd/tq/RMVSD2bfjKl6NBqAq1hv7g=;
        b=xgb0ecfwkhU5xB6wheREWC/fgpAYcz9qT5MS10uxLW1MwbfBz0JXhoo6HGAxjbGVbbCg8xvCV4W2KF2kno05aNTg8Exhz/5ZpcoQCzrBbuaCHiqFvAioHcxZNkB5Y3T+pNQqlUrchbQALX6x6YuIHFzlZCcwSp6geCVNJORfvFI=
In-Reply-To: <d95317090805291827h1209422bl37ef53eb720c6609@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The TEE target is currently limited to the mangle table.
I need to TEE on the filter table, specifically, when forwarding
traffic on a bridge.
Is there a problem with simply changing the code to allow that ?
