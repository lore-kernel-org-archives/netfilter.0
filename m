From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 20:57:35 +0200
Message-ID: <bc2e17dc-76ad-cc86-733b-32700b5adc07@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
 <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: slow_speed@att.net, Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org



Am 27.06.21 um 20:32 schrieb slow_speed@att.net:
> As it turns out, I am learning two ways at once.  One is my desktop 
> computer running Debian 10 which used nftables (and I believe 
> nftables-persistent is built-in to the nftables mechanism).  The other 
> is a little Raspian server which is based on Debian 10, but does not use 
> nftables.

it's very distribution specific and that's why this is likely the wrong 
mailing list

> In the second case, one must reload iptables when changes are made to 
> it.  If I correctly understand, one must use sudo iptables -F

why do you think you need a manual flush?

> followed 
> by sudo iptables-restore < /etc/iptables.up.rules (or wherever they 
> are).  Doesn't it need the little left arrow/less-than sign?  Does that 
> sound correct?
why don't you at least show at the help output?

how does adding "<" make sense when the last param is already a file path?

[root@srv-rhsoft:~]$ iptables-restore --help
Usage: iptables-restore [-c] [-v] [-V] [-t] [-h] [-n] [-T table] [-M 
command] [-4] [-6] [file]
            [ --counters ]
            [ --verbose ]
            [ --version]
            [ --test ]
            [ --help ]
            [ --noflush ]
            [ --table=<TABLE> ]
            [ --modprobe=<command> ]
            [ --ipv4 ]
