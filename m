From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables based appliances
Date: Sun, 7 Jun 2015 15:51:20 -0400
Message-ID: <20150607155120.43e0eab8@playground>
References: <201506071504.t57F4fuH020015@Mail.Linux-Consulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201506071504.t57F4fuH020015@Mail.Linux-Consulting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 7 Jun 2015 08:04:40 -0700 (PDT)
alvin <alvin.sm@Mail.Linux-Consulting.com> wrote:

> 
> hi netfilter ml
> 
> i was curious, 
> 
> does anybody know which ddos appliances uses IPtables to
> mitigate incoming ddos attacks ?
> 
> ----
> 
> in the past few years, i've tarpit'd about 10,000 IP# of DDoS
> attackers on a little ole box ( EPIA-800 w/ 1GB of memory ) and it
> barely can handle the load ... but than again, 10,000 iptables
> entries is fairly steep and semi-ridiculous :-)
> 
> http://networknightmare.net/Tarpits/#Install
> 
> even if the src IP# might be spoof'd, you, i still do NOT want those
> incoming DDoS attacks coming in at 1,000 or 10,000 packets per second

Yes, 1000 rules is a little overboard.

Have you tried ipset? Last I knew, it becomes more efficient than
individual rules when there are more than 16 IPs to check.

N
