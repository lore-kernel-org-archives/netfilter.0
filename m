From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: iptables traffic shaping question
Date: Wed, 2 Sep 2009 15:08:39 +0200
Message-ID: <9151ac2a0909020608g3139b1detc505b80e5d609ced@mail.gmail.com>
References: <4A9E6804.3060300@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=hryib77+d9yxtHR6EVOPh+D1KyvQWdCN36Ei7bzaa9Q=;
        b=frU9XaYKrQe0oBYy6fpdCkZVfLx87rvAI2iTfBt+soblx1fF4KuSoAKJvaxne+iY8Z
         iRNDwJb+5UVdQsVKR+SfFTfpRe67tyu/3wTkK0RUC7jvYS2oc8gGA5VVrq+XrYCuc8xe
         rJMB1XMSmAuwkKyguuajxJzOLLOymOdxvLXKQ=
In-Reply-To: <4A9E6804.3060300@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, Sep 2, 2009 at 2:41 PM, J. Bakshi<joydeep@infoservices.in> wrot=
e:
> Dear list,
>
>
> I like to get a good response ( min wait ) from my ssh and =A0stable =
( max
> throughput ) connection from the apache running at a remote server. I=
s
> there any setting =A0in iptables which allow me to set in my server
> accordingly ?
>
iptables isn't really the tool for this. look into the "tc" command of =
the
iproute package.

I used to go to this site:

http://lartc.org/

It's still, up although it looks unmaintained.

Best regards,
=46ilip
