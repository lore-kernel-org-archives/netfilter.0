From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:42:38 +0100
Message-ID: <4DD83FDE.9000901@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=hyzdX/vC9+yAQ/PUS0UQTJ4Z/psweR1fEWadA2tYZuk=;
        b=e5mnXCGv4nc8Gxi96kwAV+zSO5difDLY3Co36Iwuwj4gzlO5KGpGZ16cPD2uI38zoB
         /HBzq5WemFq5olhOZn/8adeSmcwgrrHVhvJ7/rqpPAw9KaoH7UJK4yTXqFP7XJ5pLFtj
         Aku+AQRKmE8GN3cRLMtRop/fFb+Zvg+gWBb2g=
In-Reply-To: <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> The ipset-4.x packages support patching the kernel source tree, and in the 
> kernel tree you can select module or static compiling. The ipset-6.x 
> packages support only compiling as external modules.
Fair enough, is there any reason why I can't include them as part of the kernel (i.e. static) as I used to with 4.5?

