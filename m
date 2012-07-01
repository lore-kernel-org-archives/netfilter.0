From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Valid requirement for REDIRECT target on IPv6 where TPROXY won't
 do.
Date: Sun, 01 Jul 2012 23:23:14 +1200
Message-ID: <4FF03322.3050104@treenet.co.nz>
References: <072301cd54cd$f434eaf0$dc9ec0d0$@telsatbb.vu> <4FEBE69D.4020400@treenet.co.nz> <074301cd550b$6e3942a0$4aabc7e0$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <074301cd550b$6e3942a0$4aabc7e0$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: netfilter@vger.kernel.org

On 28/06/2012 8:52 p.m., Steve (Telsat Broadband) wrote:
> Hi AYJ,
>
> Thanks for the reply.
>
> In this particular instance it's not for redirecting packets to Squid, it's
> to a custom service listening on a socket for both TCP and UDP data.

My point was that it *is* working, for at least one software 
implementation. I've heard of other software too, but not sure enough to 
name names.


>    It's
> capturing packets on all ports and forwarding to their appropriate handler.
> In addition for unauthenticated users it's also 'redirecting' their DNS
> queries to the built-in DNS server so as to properly handle the
> authentication process.
>
> This all works seamless (without NAT) on IPv4 but there are simply no signs
> of life when using TPROXY; it's simply as if the packets disappear into thin
> air.
>
> In the setup of the TPROXY rules, I can see packets getting counted on the
> rule and the appropriate TPROXY mark and ip rules are in place, but they
> never appear on the service nor do any of the DNS queries arrive.

At the very minimum you should be receiving the packets. We see this 
missing behaviour in two circumstances:
  1) rpfilter in the system is configured to drop the packets.
  2) NAT is configured on the same box as TPROXY.

I'm not sure what is going on there in that second case. Just that NAT 
and TPROXY on the same packets does not mix well on any kernel up to 3.2.

AYJ

