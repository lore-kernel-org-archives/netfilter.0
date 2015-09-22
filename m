From: =?UTF-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Subject: Re: how to do port forwarding using nftables map
Date: Tue, 22 Sep 2015 10:21:23 +0800
Message-ID: <CAP8bwDX=O5hrdFK1dh-x+zHCXL6yLti7umTNXPSU-QQvpW27+g@mail.gmail.com>
References: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
 <20150921084906.GA3549@salvia> <CAP8bwDX6-5jVbZyc5JNoN8nos+QwR4QbXLhnZsxhYRc6ojxKXA@mail.gmail.com>
 <20150921200311.GA9230@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=HKNJBzYaLoi90ZzrScEuogTjpmTqTbD49YvGTr4hiMU=;
        b=v1qjtVp/UZD1c5XcdrzUQ6G0AiFKliHgZ5r+zjH6dAhfnK767KLFEg/t8l0GjanHqp
         XXV6cJ+H73KjAicQPludoC3CqCrUDN2sABXrjNYRGfxoq23ARZJuhlFNu4JQeTAKenK3
         TK47Pm/GBw9DjiCXuInuzYZOJvgjAmJHdvGHlmnGSFUyxn5GttUE2dlVU5dNdWnsw7LR
         YgXS/jUyYD8UirPliuIFG/OUzPS7f6A4wsOY+YQVx9VqhC0ofgf3RoXEKZFJySyAukh6
         hFqk/ONDDrD+BsdZFGL4O1Rv3+XpTYM8zVLbD7kZqK9nR+2VzmIUge9vvPAXQcErEre8
         8NMw==
In-Reply-To: <20150921200311.GA9230@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

great! it works, thanks.

2015-09-22 4:03 GMT+08:00 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Mon, Sep 21, 2015 at 11:30:54PM +0800, =E7=A5=9E=E6=A5=BD=E5=9D=82=
=E7=8E=B2=E5=A5=88 wrote:
>> iptables -t nat -A PREROUTING -p tcp --dport 1000 -j DNAT
>> --to-destination 1.1.1.1:1234
>> iptables -t nat -A PREROUTING -p tcp --dport 1001 -j DNAT
>> --to-destination 1.1.1.1:2222
>> iptables -t nat -A PREROUTING -p tcp --dport 1002 -j DNAT
>> --to-destination 2.2.1.1:1234
>> iptables -t nat -A PREROUTING -p tcp --dport 1234 -j DNAT
>> --to-destination 1.1.1.1:1234
>> iptables -t nat -A PREROUTING -p udp --dport 1000 -j DNAT
>> --to-destination 1.1.1.1:1234
>> iptables -t nat -A PREROUTING -p udp --dport 2000 -j DNAT
>> --to-destination 8.8.8.8:53
>> iptables -t nat -A PREROUTING -p tcp --dport 3000 -j DNAT
>> --to-destination 2.2.2.21234
>> (many of these)
>
> nft add rule nat prerouting dnat \
>         tcp dport map { 1000 : 1.1.1.1, 2000 : 1.1.1.1 } : tcp dport =
map { 1000 : 1234, 1001 : 2222 }
