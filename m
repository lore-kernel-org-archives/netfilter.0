From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: Iptables v1.4.4 + kernel 2.6.31 mangle marking changed?
Date: Thu, 5 Nov 2009 11:52:51 +0000
Message-ID: <56378e320911050352p64455be8ga21655668c361d95@mail.gmail.com>
References: <4AF0CF8C.7000602@deboom.biz> <4AF1628D.5080401@trash.net>
	 <4AF17E57.2060206@deboom.biz> <4AF18B57.6060707@trash.net>
	 <4AF1A397.90806@deboom.biz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=ZFurDLDdoT3kU0WLGCW33lOSfMM21jYGMAIGge8EW3k=;
        b=ISeyWvBibw2yYoGlr8pNV6i6uo2a8EBrewVg3Fo3JfaQMtMmbyqNR4oyzBhCuYOg8o
         6QxLBRhTPoEhhvtWQu3EvR09lLTo+1N5at1GuTntRZOgCvCUt3F5qxZts0W7oY3nuD44
         FIA2jgSS7YFYdRxcTjeU+W898uU8t8hrRt1o8=
In-Reply-To: <4AF1A397.90806@deboom.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralph de Boom <lkml@deboom.biz>
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

>
> Right, at this point you've lost me, how I will manage to do that, and where
> does the infomation get stored?

You will need to turn trace on...
iptables -A PREROUTING -t raw -J TRACE will turn tracing on for everything.

The information is then stored in the syslog as per your syslog
configuration - TRACE will show which rules etc your packets have
encountered.

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
