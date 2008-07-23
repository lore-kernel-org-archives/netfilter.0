From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Wed, 23 Jul 2008 09:43:21 -0700
Message-ID: <7915e7b50807230943n1b946febw3615fa03a7176739@mail.gmail.com>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
	 <20080723094512.GA2250@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=8Q3Wdii/ayivrLkupAwHgfigzL+HSsOjbyiKt6grCW4=;
        b=aIG+nwgaYT5Mq3rdN5RRIOXgI+weyyzcALRFZ8Ca2zv8HK1vr1E1mTppAA1LagDO0Z
         WoipIlyo8A26o1cBexh1czfSwyzqBuyTQNOzB/A+2qXJlQE/b7Q/f6ENAe4JjHfrwPYd
         bov0W6n+LrJg6tkf4fxyqliQ59ZC4b4slA4X0=
In-Reply-To: <20080723094512.GA2250@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

On Wed, Jul 23, 2008 at 2:45 AM, Eric Leblond <eric@inl.fr> wrote:
> On Tuesday, 2008 July 22 at 17:02:14 -0700, Curtis Wyatt wrote:
>>
>> Will libnetfilter_queue do this for me?
>
> Yes, but you will have to compute the checksum of the modified packet by
> yourself.
>
>
> BR,
> --
> Eric Leblond

I have to do that with ip_queue as well.  I just can't understand why
the packet disappears then after I do the NF_ACCEPT on it.  Or why the
payload is shifted over 7 spaces for me.  I have to increment the
pointer to the payload 7 times to get it to line up correctly.

I really do appreciate the help guys :)
-----------------------------
Curtis
http://gocalipso.com
