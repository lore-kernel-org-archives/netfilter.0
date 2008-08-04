From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: Help me... please
Date: Mon, 4 Aug 2008 06:12:19 +0300
Message-ID: <38db14850808032012y3ff0581etdfb159c8f0286c16@mail.gmail.com>
References: <K50XWH$4383AA3D9D187A48A82DB26F0FDC5E0B@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=/YKxeexquKmd3cBg7zDkpjV5sxuqBkhEEWOsuv02BEQ=;
        b=hd8fuZq/u3SoR4pUnlR4N+3uts663hOCvg5cznEMc29ro2qYfSZ7LmspwHSrRZIt2z
         ecc22EfdH5fNTvESSUCiUYSNIOzYUJHAm/W7mffEXdg/PxdmstxzYFfYlq7cEm11y4EL
         09yY8DKz6GHRu+zKAdLWIYGN35ir5KHCJjRbQ=
In-Reply-To: <K50XWH$4383AA3D9D187A48A82DB26F0FDC5E0B@libero.it>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linuxmc@libero.it" <linuxmc@libero.it>
Cc: netfilter <netfilter@vger.kernel.org>

2008/8/3, linuxmc@libero.it <linuxmc@libero.it>:
> The strange thing is that this problem occurs only with the rule where hosts are defined with mac address.... the hosts defined with ip address works correctly.
> And another very strange thing is that until few days ago, works correctly also the rules defined with mac address.
> Next, i have installed squid proxy server and modified the firewall script in order to grant direct access to outgoing http connection only for 3 hosts (those defined with mac address)...... and boom.... i have this problem.
>

The problem must be in order of your firewall rules.
Send iptables -L -n output.


-- 
Best regards
Anatoly Muliarski
