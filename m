From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: Problems with xtables-addons 1.3.7 on Gentoo
Date: Fri, 05 Aug 2011 18:12:31 +0100
Message-ID: <4E3C247F.2030101@googlemail.com>
References: <CAA2qdGWwQC7G-YR=onrUBVAOEG1yrM8Ambr3m5JxvEOPjj1c+A@mail.gmail.com>	<1312551665.24824.9.camel@rybalov.eng.ttk.net>	<CAA2qdGV8wOB0t8ArT6xQWGLKtpDFCu5aKomBH4vZ7=Zky4L_Rg@mail.gmail.com>	<alpine.LNX.2.01.1108051708540.12042@frira.zrqbmnf.qr>	<CAA2qdGW5Qojg=Uyw5PBm1bgX56HCoPrbY=3r13xXpLw-62BNPg@mail.gmail.com>	<alpine.LNX.2.01.1108051830090.12042@frira.zrqbmnf.qr> <CAA2qdGVj4hfJAb0D=_=JkhNe=soM7EOhEAVtcfo-miva4V-rdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=yLAod+7WyKEvAi4HDlehNMDq9T26TkhP0AbnuzqjnaM=;
        b=k0KcEVy0+F0NcM3RQnqTPk92rdlGiTbbN2CWUaJ+IcRQru5U4J0safe/AuNx+46mVe
         6dIy2vQrSXzhp3rymu6aYFWmRvfr0iR2Aqjyjgobu67KZcZmY5h3RQR+ARdWBTkxGXSR
         0duWEMrom7gcV8OcG8IhOnXUuduHxc4h4Ddqo=
In-Reply-To: <CAA2qdGVj4hfJAb0D=_=JkhNe=soM7EOhEAVtcfo-miva4V-rdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pandu Poluan <pandu@poluan.info>
Cc: Jan Engelhardt <jengelh@medozas.de>, nowhere <nowhere@hakkenden.ath.cx>, netfilter@vger.kernel.org


> That begat a question though: Why the options in the kernel config, then?
>   
For people like myself, who do not use xtables, but use ipset (kernel 
modules) as part of the kernel build and then build/install ipset (the 
executable) separately.

