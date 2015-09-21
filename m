From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: how to do port forwarding using nftables map
Date: Mon, 21 Sep 2015 22:03:11 +0200
Message-ID: <20150921200311.GA9230@salvia>
References: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
 <20150921084906.GA3549@salvia>
 <CAP8bwDX6-5jVbZyc5JNoN8nos+QwR4QbXLhnZsxhYRc6ojxKXA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP8bwDX6-5jVbZyc5JNoN8nos+QwR4QbXLhnZsxhYRc6ojxKXA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Sep 21, 2015 at 11:30:54PM +0800, =E7=A5=9E=E6=A5=BD=E5=9D=82=E7=
=8E=B2=E5=A5=88 wrote:
> iptables -t nat -A PREROUTING -p tcp --dport 1000 -j DNAT
> --to-destination 1.1.1.1:1234
> iptables -t nat -A PREROUTING -p tcp --dport 1001 -j DNAT
> --to-destination 1.1.1.1:2222
> iptables -t nat -A PREROUTING -p tcp --dport 1002 -j DNAT
> --to-destination 2.2.1.1:1234
> iptables -t nat -A PREROUTING -p tcp --dport 1234 -j DNAT
> --to-destination 1.1.1.1:1234
> iptables -t nat -A PREROUTING -p udp --dport 1000 -j DNAT
> --to-destination 1.1.1.1:1234
> iptables -t nat -A PREROUTING -p udp --dport 2000 -j DNAT
> --to-destination 8.8.8.8:53
> iptables -t nat -A PREROUTING -p tcp --dport 3000 -j DNAT
> --to-destination 2.2.2.21234
> (many of these)

nft add rule nat prerouting dnat \
        tcp dport map { 1000 : 1.1.1.1, 2000 : 1.1.1.1 } : tcp dport ma=
p { 1000 : 1234, 1001 : 2222 }
