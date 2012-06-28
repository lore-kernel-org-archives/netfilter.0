From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: RE: Valid requirement for REDIRECT target on IPv6 where TPROXY won't do.
Date: Thu, 28 Jun 2012 19:52:59 +1100
Message-ID: <074301cd550b$6e3942a0$4aabc7e0$@telsatbb.vu>
References: <072301cd54cd$f434eaf0$dc9ec0d0$@telsatbb.vu> <4FEBE69D.4020400@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FEBE69D.4020400@treenet.co.nz>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Amos Jeffries' <squid3@treenet.co.nz>, netfilter@vger.kernel.org

Hi AYJ,

Thanks for the reply.

In this particular instance it's not for redirecting packets to Squid, it's
to a custom service listening on a socket for both TCP and UDP data.  It's
capturing packets on all ports and forwarding to their appropriate handler.
In addition for unauthenticated users it's also 'redirecting' their DNS
queries to the built-in DNS server so as to properly handle the
authentication process.

This all works seamless (without NAT) on IPv4 but there are simply no signs
of life when using TPROXY; it's simply as if the packets disappear into thin
air.

In the setup of the TPROXY rules, I can see packets getting counted on the
rule and the appropriate TPROXY mark and ip rules are in place, but they
never appear on the service nor do any of the DNS queries arrive.

Thanks again for your comments.
Steve.


-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Amos Jeffries
Sent: Thursday, 28 June 2012 4:08 PM
To: netfilter@vger.kernel.org
Subject: Re: Valid requirement for REDIRECT target on IPv6 where TPROXY
won't do.

On 28/06/2012 1:32 p.m., Steve (Telsat Broadband) wrote:
> Hi All,
>
> I would like to see if there is some way we can get the 'REDIRECT' 
> target implemented into ip6tables; this isn't for NAT purposes; but 
> rather for the process of creating a captive portal for network users 
> access requests.  We currently use the REDIRECT target on our gateway 
> for IPv4 and need the same functionality for IPv6.
>
> It has been suggested that 'TPROXY' which is available in the mangle 
> table is a replacement; but it isn't.  I have tested TPROXY every 
> which way but still to no avail; the packets hit the TPROXY rule but 
> simply do not get send to the captive portal process which is running on
the gateway machine.

Strange. Quite a few people are happily using TPROXY to redirect IPv6
packets to a local Squid proxy portal.
The only instances I've found problems are where NAT is also being used on
the box and changing the packets after TPROXY has setup the routing rules.

AYJ

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


