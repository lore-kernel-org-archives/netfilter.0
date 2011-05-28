From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: Re: On ebtables and tap.
Date: Sat, 28 May 2011 15:13:02 +0200
Message-ID: <BANLkTi=gChnxiFcsJ+qWEEBo2yt2sLVRww@mail.gmail.com>
References: <BANLkTi=sUAEdfGtte35ex=MucrCSfPXVqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=xR5Ai4smyoxA/U1Gc+otr8Zc7C4YEx9B49OzWZIKh3Q=;
        b=pnsMS7S3B1ztCGHxZDX1pciHDAq8EOJw8Qln1Ji33Gj93qTB/bGXf/7uRdWaNr6cNv
         4W0hVOvxYbuGsKobphLFBzaIpt32Hn0lOtDHI8ACQCpW7DiYN8oKC0vNDwMaSWgtzi/M
         qBStc2TjugDlQiAWQF8Ptt/nlnr7peftKfJ7Y=
In-Reply-To: <BANLkTi=sUAEdfGtte35ex=MucrCSfPXVqg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

And quite obviously I'm an idiot...
I was looking at the OUTPUT instead of the FORWARD chain.

Argh.
