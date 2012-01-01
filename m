From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Sun, 1 Jan 2012 21:41:24 +0100
Message-ID: <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=rlpoDKdohKY/u7rkQh2a2/teOjEj3W2mx/qtJjVIOE4=;
        b=HTU92cI2oDf6fZfEVr7/WY+wqZhijhh0TdBhE1MiGwjnxLTAeIZwyiuoqJ/J3PJv68
         3UHkbsICAgjMF0X4GRluk2MMeoXzYOMNHiHRIsoDcSz6WCh4snZgP1KsGjENN1F79VPp
         t7cuBKDhIP74v2yD1CI/xwGUlkgIFHQn4stBw=
In-Reply-To: <op.v7e9nhxox1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

=2E..
> Hi,
> I am new to this list and I have little experience with netfilter, bu=
t I
> think I can help you. However, I need some clarification:
>
> When you say your machines need to be able to send email from each of=
 those
> 1600 public IPs, do you mean your 3-8 machines serve as SMTP relays f=
or 1600
> hosts, each with a public IP? =C2=A0Do you mean that you are *not* th=
e ISP, and
> are providing only smtp service for the hosts?

ESP. Think Mailchimp just a little smaller. Lots of clients need lots
of IPs (it's a reputation thing, and quite an interesting computing
problem, see http://blog.mailchimp.com/should-you-send-from-a-dedicated=
-ip-address/
or just search for "email marketing dedicated ip" for an intro).
A

--=20
echo '16i[q]sa[ln0=3Daln100%Pln100/snlbx]sbA0D4D465452snlbxq' | dc
This will help you for 99.9% of your problems ...
