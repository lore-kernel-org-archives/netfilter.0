From: "=?ISO-8859-1?Q?Gwenha=EBl_Pasquiers?=" <gegefr@gmail.com>
Subject: Re: Captive portal and DNAT
Date: Mon, 17 Dec 2007 17:44:40 +0100
Message-ID: <47050bf90712170844p2b4057ckaf97c5974c2bd617@mail.gmail.com>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
	 <1197905123.19486.231.camel@grateful.d.umn.edu>
	 <47050bf90712170825j5ba29561oba08f023de7f6dd4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=2FIJn1TjHdJRKVgFzQTf5EXVq2TwggfiMYynNUn/QY4=;
        b=a+Njx47hjL88uVNlfS29iQ51xuQjKz2xnIZXtXauHORqdhkH321rH5Gln7S7bkuv4TThVm+4ww0Zilf2bZGeRoDc0ZWrAKgIR5EjbWmx/zetHGZqkK5IHT/dPDrr1GhDzdf65uhXCoiYFQ7+jeEcKvuG2cQoazTBvh+kzPiDLNY=
In-Reply-To: <47050bf90712170825j5ba29561oba08f023de7f6dd4@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter@vger.kernel.org

Now that you mention it it's true that I don't know if the TCP NAT
connections are monitored and closed when the TCP connection itself
finishes.

I sure like it would.

However it means that the NAT would have different behaviour depending
on the protocol (IP, UDP, TCP, SCTP ) is that the case ? is it linked
to the connection monitoring ?

I think I'll run some tests tomorow, trying to open a tcp socket on
the same port just after having unauthorised that IP and closed the
previous socket.
