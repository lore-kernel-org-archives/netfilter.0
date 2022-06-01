From: Dave Osbourne <dave@osbourne.uk.eu.org>
Subject: Re: IPTables ISP Open Port Notices
Date: Wed, 1 Jun 2022 19:56:22 +0100
Message-ID: <339c5e38-a777-c10b-6df7-1a417aadb70d@osbourne.uk.eu.org>
References: <eb720ea4-1d97-8eb7-0529-1d0d8ed6473c@steinmetznet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <eb720ea4-1d97-8eb7-0529-1d0d8ed6473c@steinmetznet.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi,

Possibly a stupid question, and I'm doing this in haste, but you're 
FORWARDING the traffic between aa.bb.cc.12 and 192.168.1.29 ...  it 
won't appear on the INPUT or OUTPUT chains...

Dave

On 01/06/2022 17:30, Robert Steinmetz wrote:
> I keep getting notices from my ISP (ATT) that I have an open port. 
> I've tried to block it and nothing seems to satisfy them. So far I'm 
> not detecting any traffic on that port, but in an abundance of caution 
> I'm reluctant to post too much information. So I'll try to describe 
> what is going on.
>
> I have a computer running Ubuntu 18.04.6 LTS (GNU/Linux 
> 4.4.0-109-generic i686) using Iptables to do address mapping to my 
> block of static IP addresses. I am also running fail2ban, this appears 
> to be running as expected.
>
> In the routing section I have pairs of statements doing the Address 
> Translation, one pair for each ip address
>
> -A PREROUTING -d aa.bb.cc.12/32 -j DNAT --to-destination 192.168.1.29
> -A POSTROUTING -s 192.168.1.29/32 -j SNAT --to-source aa.bb.cc.12
> -A POSTROUTING -o enp1s0 -j MASQUERADE
>
> I have other ports I have blocked which seem to work. In fact I got 
> similar notices for those ports and added a INPUT and OUTPUT statement 
> for each port, both tcp and udp both general and for a specific IP 
> address ranges.
>
> -A INPUT -p udp -m udp --dport <port> -j DROP
> -A INPUT -p udp -m udp --dport <port> -j DROP
> -A OUTPUT -p tcp -m tcp --dport <port> -j DROP
> -A OUTPUT -p udp -m udp --dport <port> -j DROP
>
> -A INPUT -s aa.bb.cc.8/29 -p tcp -m tcp --dport <port> -j DROP
> -A INPUT -s aa.bb.cc.8/29 -p udp -m udp --dport <port> -j DROP
> -A OUTPUT -s aa.bb.cc.8/29 -p udp -m udp --dport <port> -j DROP
> -A OUTPUT -s aa.bb.cc.8/29 -p tcp -m tcp --dport <port> -j DROP
>
> The notice I get from my ISP says the port is a udp port for a Windows 
> service on a Windows server (the only one we have.
>  With my limited understanding of IP tables this seems like it should 
> work, but apparently it's not.
>
> I guess I could add an INPUT and OUTPUT statement for the specific IP 
> address, something like this:
>
> -A INPUT -s aa.bb.cc.9/32 -p udp -m udp --dport <port> -j DROP
> -A OUTPUT -s aa.bb.cc.9/32 -p udp -m udp --dport <port> -j DROP
>

