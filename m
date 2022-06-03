From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Fri, 3 Jun 2022 17:21:05 +0200
Message-ID: <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stefan Riha <stefan@sriha.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 03.06.22 um 16:54 schrieb Stefan Riha:
> I'm a beginner and noticed than when I do e.g.
> 
> iptables -A INPUT ... -s 10.0.0.2/24 ...
> 
> this gets interpreted as "allow from source 10.0.0.0/24" i.e. from the entire network. I think it would be more beginner-proof if iptables would interpret this as incorrect input and error. Or at least, interpret 10.0.0.2/24 as 10.0.0.2/32. So if there is incorrect input, and that input is automatically re-interpretet (which in itself is unsafe, I would think), then at least interpret it in the way that is more restrictive (i.e. single IP instead of subnet). Otherwise I like iptables a lot, thanks for all the great work!
sorry - garbage in - garbage out
that's how netmasks are working

you are supposed to review your inputs and the final ruleset and the 
decimal way of writing ip's is completly different to the internal way 
of the tcp stack

ipcalc 10.0.0.2/24
Address:        10.0.0.2
Network:        10.0.0.0/24
Netmask:        255.255.255.0 = 24
Broadcast:      10.0.0.255

Address space:  Private Use
HostMin:        10.0.0.1
HostMax:        10.0.0.254
Hosts/Net:      254
