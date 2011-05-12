From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: Re: problem in openning a port
Date: Thu, 12 May 2011 10:12:29 -0700 (PDT)
Message-ID: <206218.92200.qm@web111703.mail.gq1.yahoo.com>
References: <713633.15807.qm@web111723.mail.gq1.yahoo.com> <1305214450.32402.77.camel@sjohnson.state.ar.us> <alpine.LNX.2.01.1105121737030.19920@obet.zrqbmnf.qr>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1305220349; bh=wnuxqdcpn7X1fPb6RTo59IS3f37qxu+xJnlVmTuVAAw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=y4Fvh3qgQxXDjmBEkfd/0IofjOwO9JBZy9HwSUPf5vWGzA1KujrqmrPR9bSFR7hD6KGJF288L0+AuXd0wR+kIQxtmZbsysqueFSgpfyVIBJa/dMVky8sCkSIjdiEhI92sa36bd1GGXHwZuirR2HFVnHXwWNG8YwDh6k1vwtMFIY=
In-Reply-To: <alpine.LNX.2.01.1105121737030.19920@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>Why do you specify redundant arguments like -s 0/0?
=A0
I found that command while searching for "How to open a port in ubuntu"=
=2E=20
=A0
Anyway I understand what you said.
=A0
Thanks Jan, Stephen=A0 and Ryan

// Naderan *Mahmood;

=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Stephen Johnson <stephen.johnson@arkansas.gov>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>; Mahmood Na=
deran <nt_mahmood@yahoo.com>
Sent: Thursday, May 12, 2011 8:08 PM
Subject: Re: problem in openning a port

On Thursday 2011-05-12 17:34, Stephen Johnson wrote:

>On Thu, 2011-05-12 at 10:05 -0500, Mahmood Naderan wrote:
>> Hi,
>> beofore openning=A0 a port, I checked which port is open:
>>=20
>> Then I opened a port with
>> mahmood@client:~$ sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dpor=
t 4949 -j ACCEPT

Why do you specify redundant arguments like -s 0/0?
Secondly, the rule may be appended in a place where it is never reached=
,=20
rendering it useless.

>> However netstat doen't show it is open:

And for the record, use modern tools like ss (ss -an; ss -alntp=20
perhaps in this case).


PS: Wraths to those who strip the Cc list.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
