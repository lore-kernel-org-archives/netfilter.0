From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 23:21:28 +0300
Message-ID: <38db14850806231321k70813efbx1513c7c1f52511b4@mail.gmail.com>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>
	 <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>
	 <alpine.LNX.1.10.0806231717480.26570@fbirervta.pbzchgretzou.qr>
	 <38db14850806231109p4ef2197cu48082c445fea34ce@mail.gmail.com>
	 <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr>
	 <38db14850806231212y4326697cwe0ab96c842aa7749@mail.gmail.com>
	 <alpine.LNX.1.10.0806232125430.16957@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Kii6xDeUq+9YKKAVX8f2XYBXpoQ9pAFX448rWQi6o6A=;
        b=CabYMzOt2yUmb3mZnsR4ijy+4kMTzuww2wofjZiUgT0hNl6Bi0jX+Y0wk+Dfwz9sXn
         0Ba6L9qVAiPzxfJ4oHVOzoWe8ArOOCBt4FDqWCK6DZAXsLInpCc+y6Y+zgWr6ZFUdsty
         qjR6Ulm2iezMenXMLvsxSD4qu+bp1HgJq/VfE=
In-Reply-To: <alpine.LNX.1.10.0806232125430.16957@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thank you.
You have cleared the subject up to me and I shall try to play with it.
git.kernel.org is the best doc :)


2008/6/23, Jan Engelhardt <jengelh@medozas.de>:
>

>
> -m limit has a ... math problem related to accuracy it seems.
>
> See linux kernel commit 50c164a81f1c0dfad056f99e5685537fdd0f07dd
> for a use case. Two rate estimators are only used if you are
> going to calculate the delta between them.
>


-- 
Best regards
Anatoly Muliarski
