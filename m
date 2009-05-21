From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Thu, 21 May 2009 11:17:04 +0300
Message-ID: <38db14850905210117u762600abifae41ce448363644@mail.gmail.com>
References: <4A0DE859.7000209@tigertech.com>
	 <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>
	 <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>
	 <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
	 <4A1466F6.8070304@tigertech.com>
	 <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=WLj0pzEx5ZmpC+MUm2gOTOJVvQH7I7CP2rO3qGLgQjg=;
        b=OsVbr+naYcDivkYXblVD8XOVghueRakbtOPEMfzuDcN+qeMflDVq+OaCUupLgswnR1
         amBg7XLQQodABkbTo+wkNqM7c7gzkYRV+XXNfnFCyrexCIm1izrirKmgVYZ39zd9e/8B
         lE+IYtdcIbqfeYkC3nX6q2RxkhMfefh5YERCQ=
In-Reply-To: <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I would like to put in some words.
Obviously the problem is in conntrack code.
IMHO, to solve this issue the code should track tcp sequence number
and check it correctness on receiving RST packet and on the following
decision about removing the conntrack entry.

2009/5/21, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
>
> Because connlimit/connbytes rely on conntrack, the latter should be
> "fixed". However I do not see any way to make it resistant against such
> attacks: if we shrink the window (by which alogrithm?) we may block valid
> RST segments and thus cause connections to hang instead of termination.
>
> Best regards,
> Jozsef


-- 
Best regards
Anatoly Muliarski
