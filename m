From: "Michel Benoit" <murpme@gmail.com>
Subject: Re: IP forwarding with MASQUERADE
Date: Thu, 9 Oct 2008 18:36:33 +0200
Message-ID: <c88e466f0810090936h7fb69cf1t62cffc8f9b0f3710@mail.gmail.com>
References: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>
	 <48E62AD3.9060001@riverviewtech.net>
	 <c88e466f0810070858o18687b09yabd9cc7e5a46391@mail.gmail.com>
	 <48EBA72B.80306@riverviewtech.net>
	 <c88e466f0810080912s46f24354xc8e5fa7aae12a4f8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=V+AFTYJaLBFZNR8MHI/TURdsV/Fvzvm9tw6KIjZ93JU=;
        b=iE/64/imhaQtJvNjDqrATNbqn84kZn/xNXReMMmAz+B4ZmnsL+CR0X0D4apmpDyrVF
         4HLglJ+VXGdhl7xHfQDr+YsDe/6JPGSyHifyViGsLxVSYo1izsTx9HMFPqXvYs2B8L24
         kKIXn3Q9yXlkgxZNUg7o/kewKNpAM+RtqZn9g=
In-Reply-To: <c88e466f0810080912s46f24354xc8e5fa7aae12a4f8@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

FYI, I tried running exactly the same script and configuration with
linux kernel version 2.6.20.4 and it worked fine.
Packets are correctly masquerade through the embedded linux box.

Something must be wrong with my configuration or netfiler in my 2.6.25 kernel.
Is anyone else succesfully running netfilter with MASQUERADE on a
2.6.25 or 2.6.26 kernel.
I will post something on the list when I figure out what I did wrong.

Thanks for the help!
