From: Renaud Drousies <renaudd@gmail.com>
Subject: Re: Slow 'connection refused' on REJECT rules
Date: Mon, 29 Jan 2018 07:03:32 +0100
Message-ID: <CAEHu7ETX3jkE+59wmuko=CRAwkaGZhK-cV+Yk7hCPat=j4=4Mw@mail.gmail.com>
References: <CAEHu7ET=6osh9-Njwdgqo4RW5jqGju++hHZEV-spZjZ61fiuXw@mail.gmail.com>
 <7d57480998924477867886c07050e122@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6S897NlvvcvjfcPIVhXtDXiSjzVmw6zf1EuiHSajmKs=;
        b=Avc/s7awyTOTHTllaB+URcqZ7S79nnqefj0tI30jaW0ipEOH/W5qPeRKjm/Fpq358e
         P8v7SmEaYFutBvEHtu3k2UKltU7g1VkLZ/VhWBUGSOn96CDLKPm1zOn/h1ZWXONKCCI4
         6WSRPjtgIRJX3nKNkYJOCrsEOP2kfmgBsmWEO4WZx+/nIT1cT8sGDu5U928cSkBXrq5u
         qEpqtsU1lKrJ6pWggvwuB5qVEHV4cywfnCEWjQ2CPAjcBy++wOEfKcekGzteeNiteGKg
         eMEDq5TP2YOvCNbXfjqnZ82X4tIbUD2vKzREhwntLCguHumpxwSSa/qOOKW8VUKPjVU6
         aYOQ==
In-Reply-To: <7d57480998924477867886c07050e122@CCDEX023.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello Andr=C3=A9,

Thanks for your answer!

> If you see under you can see that you have 2 hits on the rule for using t=
he ICMP contra RST , because some client software will RETRY with 1 second =
delay .

Indeed, I tcpdump'ed on my side as well and I had 2 ICMP messages
separated by ~ 1 second, like you had.
I tried to set a rule on a remote machine to reject with icmp port
unreachable connections made on some port (but on the INPUT chain this
time), and in this case connect() gave up at the first ICMP reply, so
maybe he's missing the first one sent by iptables, not sure...

> SIDENOTE : Typically when using TCP , it makes more sense to use "-j REJE=
CT --reject-with tcp-reset" but doing otherwise is also OK ,
> I am not saying this is the solution to your issue but it will work as a =
almost 100% workaround for all TCP sessions .

That is definitively a solution, at least for me, thanks a lot!

Best regards,
Renaud
