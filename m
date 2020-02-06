From: Florian Westphal <fw@strlen.de>
Subject: Re: Redirect bridged traffic
Date: Thu, 6 Feb 2020 09:46:44 +0100
Message-ID: <20200206084644.GN26952@breakpoint.cc>
References: <1291389071.153642.1580977922721.ref@mail.yahoo.com>
 <1291389071.153642.1580977922721@mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1291389071.153642.1580977922721@mail.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaga Doe <jaga.doe@aol.com>
Cc: fw@strlen.de, netfilter@vger.kernel.org

Jaga Doe <jaga.doe@aol.com> wrote:
>       Hello,
> 
>    I have discovered a great mechanism of understanding what is happening, but setting nftrace flag. With that I can see the dataflow:
> 
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect packet: iif "eth1" ether saddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 ip daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags == syn tcp window 64240 
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect rule log tcp dport 3000 meta pkttype set host ether daddr set 00:0c:29:15:7b:a0 counter packets 5 bytes 300 meta nftrace set 1 (verdict continue)
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect verdict continue 
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect policy accept 
> trace id 9af9e0b6 inet tlcRedirect clcRedirect packet: iif "br0" ether saddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 ip daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags == syn tcp window 64240 
> trace id 9af9e0b6 inet tlcRedirect clcRedirect rule log tcp dport 3000 counter packets 5 bytes 300 redirect to :3000 (verdict drop)
> 
> I don't understand why the redirect rule is leading to the drop verdict.

Most simple explanation: your bridge doesn't have an ip address
(redirect is really just 'dnat to' with the primary address of the
 incoming interface).

