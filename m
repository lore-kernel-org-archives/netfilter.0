From: Ben K <benkloester@gmail.com>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 10:58:24 +1100
Message-ID: <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
	<alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=tebRAJ8hCeRl/n1HUemBMcULeZxZJI3jMSbGVCXSqeA=;
        b=t6e3f6Kwot7DxDo3jmO6ux0N1eFd96p1a2BxSCC/7uQY3JXPubuSTJxr9pM6trPynt
         y/4l9QZavIics30Nmbx8bNXaAmvBrthvE4gcw3F8LXm7xnYOtIWgJ10iuOVSgSTxsX5g
         ekRfy0GJAkm0uxy0GKLVgnira47wdRom+pfyI=
In-Reply-To: <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thank you for the speedy reply.

So I'm guessing the answer to the main question below, about whether
that patch ever made it into iptables, is "no".
Is this because of the limitations of string matching with regards to
packet fragmentation, as per your response, or for some other reason
(eg unwanted complexity)?

If the former, then why does iptables include the string match (but
not replace) extension, which surely suffers from the same
limitations?

>Does anyone know if the --string-replace functionality ever made it
>into iptables? If not, what are my chances of the patch from 2004
>playing nice with the current Git head revision?
