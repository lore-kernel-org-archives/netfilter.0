From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Re: Iptables Drop rule - strange behaviour
Date: Sat, 16 Jun 2012 22:53:22 +0530
Message-ID: <CACJKonrTvFuk9geVDomSdRT7mS98DPTakSAAnB2UFQaTjGbjtQ@mail.gmail.com>
References: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com>
	<CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
	<CACJKonp5yY9Gt8s+9Zc4wXHhbGdamJF257OhbV4hktSA5E3V1w@mail.gmail.com>
	<CACJKonoaTzoo-ppEOKcxgQ-3kQ7FpcVgyZ4NTr5EZcaZRgxikA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=ZNRiN5OYxTG7JyY+PdIRQ/uHMIuke7uLoBRBck9OAxc=;
        b=WZWIX9tgkVQ4HKTi5uFLn1WdXOlwxXQ7ta7Vq2LQW/AI8BI/gvmHR4X+5Yu6g28VN7
         YRAsNd6zn15F8W/MPrQktctoIAi4lNXZT+k0CxD2UCGHWD+6w8Pu1OtG1QMnx693dWGZ
         u1qP38zRJYhDaLe02kCQ7NI1lNJhv3g9t8/CN6SH7dmpNBn/W/W2Mjy7WzyNj+SKGCAZ
         tjSpkDh43/V72+xWfb1FIHPLIOCwdvEz1dpejm/IEA9/qwJysGM+JK9K4J3Mwl+uXs7l
         CTWphOPA1/9Hzlv5MpC1kewpMz5UwPOHWI/GWlyTgkpt3+E2foVZQmCbuCwRNEAVw5H7
         4AyQ==
In-Reply-To: <CACJKonoaTzoo-ppEOKcxgQ-3kQ7FpcVgyZ4NTr5EZcaZRgxikA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I found out the reason for dropping the packet.

On Debugging Kernel I found that in the forward path (ip_forward.c), a
particular part of code under a configuration flag
(CONFIG_NETFILTER_TABLE_INDEX) is getting executed and was giving the
wrong verdict of DROP for the packets.

I removed the same from .config file. Now the rules are working as
expected. I dont know the meaning of CONFIG_NETFILTER_TABLE_INDEX flag
and hence i cannot say whether it is a bug or not.

Thanks for the support. :-). I hope this mail might help somebody in the future.

thanks and regards
sreejith
