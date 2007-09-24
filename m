From: "Nir Tzachar" <nir.tzachar@gmail.com>
Subject: libipq thread safety
Date: Mon, 24 Sep 2007 11:18:08 +0200
Message-ID: <9b2db90b0709240218r67da35f0n280f8718b42a4059@mail.gmail.com>
References: <9b2db90b0709240216j95b58bch35a234527f9d97f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=mfYtkn0fQVXgtWoh6NWzalzTcs/BOzl35RfnJICMhUY=;
        b=mPj4w7DYgqmRT0OYS0wETDNX2YZmHG43bSPFqYZ6K0I/wFbmTcxj2j2pGJonzcYc+7DVtyOPNokF9LXzN6Xicggym6vI3uwSUbX2kd1g9hRHoav7ucCF5nC/Y1OERAP2mgLwF4zY8d9RUtb7zGADBoRZ8OsUVltIYL21JpghCoI=
In-Reply-To: <9b2db90b0709240216j95b58bch35a234527f9d97f4@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

I am writing an application which uses the QUEUE target and am using
the libipq library.

I have a question regarding the thread safety of the library: is it
possible to do a
ipq_read from one thread and an ipq_set_verdict from another?
Searching the archive of both netfilter and netfilter-devel yields no
definite answers...

Thanks for your help.
