From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 13:52:10 +0200
Message-ID: <20200928115210.GA21841@salvia>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
 <20200923083042.GB10267@salvia>
 <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 11:02:00AM +0000, ѽ҉ᶬḳ℠ wrote:
[...]
> It seems that updating a set and dropping the packet in the same rules does
> not work either, e.g.
> 
> ip protocol tcp update @glv4 { ip saddr limit rate over 50/second burst 15
> packets } log prefix "foo " drop
>
> would seem to only update the named set but is neither logging nor dropping
> the frame.

This example is working fine here:

table ip x {
        set glv4 {
                typeof ip saddr
                size 65535
                flags dynamic,timeout
                timeout 15m
        }

        chain y {
                type filter hook output priority filter; policy accept;
                ip protocol tcp update @glv4 { ip daddr limit rate over 1/minute burst 2 packets } log prefix "foo " drop
        }
}

hping3 -S x.x.x.x -p 80 -c 1
HPING x.x.x.x (enp0s25 x.x.x.x): S set, 40 headers + 0 data bytes
len=46 ip=x.x.x.x ttl=53 DF id=0 sport=80 flags=SA seq=0 win=29200 rtt=31.8 ms

--- x.x.x.x hping statistic ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 31.8/31.8/31.8 ms

hping3 -S x.x.x.x -p 80 -c 1
HPING x.x.x.x (enp0s25 x.x.x.x): S set, 40 headers + 0 data bytes
[send_ip] sendto: Operation not permitted

[137712.162113] foo IN= OUT=enp0s25 SRC=10.141.1.219 DST=x.x.x.x LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=57787 PROTO=TCP SPT=2904 DPT=80 WINDOW=512 RES=0x00 SYN URGP=0

