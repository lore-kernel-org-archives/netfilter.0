From: Noino <mg8c1zu02@sneakemail.com>
Subject: Re: local NAT; reconfigured kernel, problems still
Date: Tue, 01 Apr 2008 18:15:56 +0200
Message-ID: <20080401161556.3223378C8B@gam.mel.teaser.net>
References: <20080401094014.8143178C95@gam.mel.teaser.net>
            <20080401110029.GA1025@lion.gg3.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080401110029.GA1025@lion.gg3.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Georgi Georgiev writes : 

>>>> iptables -t nat -A OUTPUT -o lo -p udp --dport 53 -j DNAT 
>>>> --to-destination :10053
>>>> iptables: Invalid argument

> Maybe it is the "-p udp" that is causing the message. Does -j LOG
> (instead of -j DNAT --to-destination) work? If it does not, then you
> need to add "-m udp" in front of "-p udp".

"-j LOG" does not yield an error message; the above rule, with the addition 
of  "-m udp" gives the same error as without it. 

I think my last trial will be compiling a fresh iptables in replacement of 
the version that came with my SUSE (originally kernel was 2.6.4, updated to 
2.6.5. Maybe low level structures have changed, just a guess of course) 

Again, what version number should I be getting from the iptables archive ? 

-- 
Noino

