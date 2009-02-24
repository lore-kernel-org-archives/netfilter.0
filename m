From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd and UDP
Date: Tue, 24 Feb 2009 14:47:35 +0100
Message-ID: <49A3FA77.2090305@netfilter.org>
References: <1235464670.9964.13.camel@menhir.cc.uniud.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1235464670.9964.13.camel@menhir.cc.uniud.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michele Codutti <michele.codutti@uniud.it>
Cc: netfilter@vger.kernel.org

Michele Codutti wrote:
> Hello, I'm using conntrackd in a ha clustered firewall. Since the
> initial setup I configured conntrackd (version 0.9.6-4 from a a Debian
> Lenny) to sync only TCP connections.

BTW, that's a one year old release, I *strongly* suggest you to upgrade 
to some recent release. Similarly, I also suggest you to use lastest 
kernel release which includes recent versions of ctnetlink.

> In the past few days I've read this tutorial:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> and after that I've one question:
> Conntrackd is capable to sync also the UDP entries of the state machine?
> If it is so: it is a good thing to configure conntrackd to sync also the
> UDP entries in a clustered firewall?

It depends on the UDP traffic and your rule-set, for example, I don't 
synchronize UDP DNS traffic but you may want to do it for long-standing 
UDP flows for real-time communications. With regards to your rule-set, 
if you perform UDP filtering based on who starts the communications, 
like from A -> B allow starting UDP flows, but not the opposite (B -> 
A), then it may be of help to avoid communications hangs after the failover.

UDP is unreliable, so you will lose data during the failover, in 
real-time applications the user would experience a temporary 
communication breakage, but the communication would not hang which is 
one of the targets of conntrackd.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
