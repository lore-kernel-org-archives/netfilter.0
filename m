From: Steve Brown <sbrown25@gmail.com>
Subject: Re: can't use MARK target
Date: Thu, 27 Aug 2009 11:26:51 -0500
Message-ID: <1f4ef0970908270926k645ae15cg614009487f3ac5e6@mail.gmail.com>
References: <1f4ef0970908270744x941cc84i3e85cb2600325d3a@mail.gmail.com>
	 <4A96AEEC.5040902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5cBF4ZYEHQ8cIIcZ73TkzvGx2JniTHqFN5QlRS0tbrs=;
        b=joiP+BEtaGcxiNP316CDSb6MI65m5OL9socFQ9Hj0x/9GmHmcz5YYhP1/Qvg4Vz6CK
         FXCeB+Szlw4vSSn0HclNJqc6dMF3MaqrVy3bSAA1rcCy8YuUnDAuLeSWKKitkL95uFp4
         24gktdcm+CbSEfm6Mqn4dVQ4jQnohuM5/dZ9w=
In-Reply-To: <4A96AEEC.5040902@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> My wild guess something to do with dynamic linking, does adding
> /usr/local/libexec/ path to /etc/ld.so.conf help ?

Doh!  Of course.... forgot about ld.so.conf.

Thanks!
