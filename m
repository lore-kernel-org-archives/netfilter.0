From: vivek rajagopalan <vivvek.r@gmail.com>
Subject: Re: Source based routing using LKM
Date: Sat, 11 Feb 2012 18:12:01 -0800
Message-ID: <CAKbcA9+2iVyHdj5issA8MCHN12629B3yNdjrGmFEHuuzv9QDVQ@mail.gmail.com>
References: <CAKbcA9L2XVTuR04TONTRo7ECrBip9VYWk3T_Ar2c_ucN1QqY_A@mail.gmail.com>
	<alpine.LNX.2.01.1202111624290.22796@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=GV4y8ElnSVzCqewAadZ7Vz8Iub+gTGDt68ZtJfkPQ5I=;
        b=siPKy/NogeMQi7miLVE1XQJaZEc6VhjanN2MuENyhknBIlHeGz9katA9hHibJxbMiG
         Fz2n8vOaFsb40pTGRz9gmhsc8hj7Lr+ovl2DVs4sPn+SEH6uyEI/jrN8mgh0B/9iBd/F
         YH7YZApL47xgsxshq/Vpf06q1HbtQPUY8iPSU=
In-Reply-To: <alpine.LNX.2.01.1202111624290.22796@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> rp_filter comes to mind.

I did reset rp_filter on all interfaces but it didn't help, not sure
if that is what you suggested

> Changing the addresses in-flight breaks end-to-end connectivity. It will
> be better if you would, for example, mark the packets in the RX
> path, based upon your desired criteria, and reuse this mark value to
> select the routing table.

I will explore this, thanks

Vivek
