From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Match strings with periods
Date: Wed, 04 May 2011 06:25:07 -0600
Message-ID: <C9E6139B.7331%jlay@slave-tothe-box.net>
References: <20110504021544.GA15438@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110504021544.GA15438@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

On 5/3/11 8:15 PM, "/dev/rob0" <rob0@gmx.co.uk> wrote:

>On Tue, May 03, 2011 at 05:46:19PM -0600, James Lay wrote:
>> Been trying to nuke DNS resolution for a couple domains.
>snip
>> Does anyone have any
>> hints on how to get this to work?  Thanks all!
>
>Use an appropriate tool for the job, e.g., dnsmasq(8), available in
>most major GNU/Linux distributions. This would be trivial.
>-- 
>    Offlist mail to this address is discarded unless
>    "/dev/rob0" or "not-spam" is in Subject: header


Thanks Rob, I think that's exactly what I'll do.  My question still kinda
stand though...is it only possible to match ASCII strings?  Maybe since
it's udp?  Funny thing is, in my tests I could log pings by matching this:

sudo iptables -I INPUT -p icmp -m string --string "./012" --algo bm -j LOG
--log-prefix "ping test "

Packet below:
06:12:39.283417 IP 192.168.1.2 > 192.168.1.1: ICMP echo request, id 8969,
seq 169, length 64
        0x0000:  4500 0054 0794 0000 4001 efc1 c0a8 0102  E..T....@.......
        0x0010:  c0a8 0101 0800 1099 2309 00a9 4dc1 42b7  ........#...M.B.
        0x0020:  0004 4835 0809 0a0b 0c0d 0e0f 1011 1213  ..H5............
        0x0030:  1415 1617 1819 1a1b 1c1d 1e1f 2021 2223  .............!"#
        0x0040:  2425 2627 2829 2a2b 2c2d 2e2f 3031 3233  $%&'()*+,-./0123
        0x0050:  3435 3637                                4567

Odd.


James


