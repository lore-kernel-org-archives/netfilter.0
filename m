From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: ssh overflow blacklisting not working properly
Date: Mon, 29 Mar 2010 09:18:24 +0100
Message-ID: <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com>
References: <4BB0574A.2060106@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=SiD4OVwQEIAjkVmmjcZqvJBdBsi0oSwgM1nsi8bTGDQ=;
        b=g05PfPCnv2mJCr5HeCbkcpY4OPQn0AHcwcD3Xq6OF30oCElndNBXZ7ZipeHYH9Llsz
         3MCOGRMRNAYXcxRJ/WRSK61xkpg2tjltHz9NyuS5Ouo/jaooGMoCBjQDLWujB3SSYOCw
         7hHZ/F3Dp4IDex34Sx1U7Y8p5JFNaFUUh5LZI=
In-Reply-To: <4BB0574A.2060106@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

On 29 March 2010 08:31, J. Bakshi <joydeep@infoservices.in> wrote:
>
> iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -m
> hashlimit \
> --hashlimit 3/min --hashlimit-burst 1 --hashlimit-htable-expire 180000 \
> --hashlimit-mode srcip --hashlimit-name sshlimit -j ACCEPT
>
> #----------------------------------------#
>
> As expected connection attempt more than 3 in a min is dropped and
> ensure only 3 connection per minute. But It should also block the source
> IP for 3 min and this part is not working here. Could any one kindly
> suggest any clue or reason behind this ?


Unless you have other rules floating around all the rule does is allow
upto 3 connections per minute to ssh based on source-ip. It won't
block other connections from that source ip, just the ssh ones which
exceed your defined limit (3/min).

I'd guess from your comments there are additional rules, without
seeing them though very hard to work out what is wrong as all I can
say is that rule does its job... blocking ssh > 3 connection attempts
per min per soucre ip.

R.
