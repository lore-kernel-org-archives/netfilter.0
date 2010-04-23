From: Elison Niven <elison.niven@gmail.com>
Subject: Re: Cannot use iptables with kernel 2.6.30
Date: Fri, 23 Apr 2010 18:29:36 +0530
Message-ID: <j2g21df6cb71004230559m7449897cr8639269dc7c53a5d@mail.gmail.com>
References: <g2g21df6cb71004220358y9a5f23f1w1b7795a90fae82e2@mail.gmail.com>
	 <alpine.LSU.2.01.1004230927130.24961@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type;
        bh=FZf4Ah3DFOEBOWyd0FUO6gxmbUtA+jYAnzlVtuvGZ4c=;
        b=HXiGa4jHRYI75slIm7IZoPESNXqPDvdmbv2C+m7Fowd6od3QgHud9Dk/d2sqQ8k1xf
         h6KRNJxIvi2i4U0MnY05HRz0UuA3oKpk0JEBIsOcRpR/MLIiJ9OSUyRn9U3lwl5NjbUq
         Krp5p5Uxpdebyllk/epNuMPth5vMUi2MvZuC8=
In-Reply-To: <alpine.LSU.2.01.1004230927130.24961@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Hi,

I should have mentioned that I am trying to run iptables on an
AT91RM9200. While compiling the linux kernel I had enabled the option
Use the latest ABI to compile the kernel. With this option enabled,
iptables did not work.

I disabled this option in the Linux kernel and iptables is now working
fine. So I guess this problem is solved.

I use all modules as built in the kernel so there aren't any .ko files
needed to be inserted.

Thanks,
Elison
