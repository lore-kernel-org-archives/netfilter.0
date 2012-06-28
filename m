From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Valid requirement for REDIRECT target on IPv6 where TPROXY won't
 do.
Date: Thu, 28 Jun 2012 17:07:41 +1200
Message-ID: <4FEBE69D.4020400@treenet.co.nz>
References: <072301cd54cd$f434eaf0$dc9ec0d0$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <072301cd54cd$f434eaf0$dc9ec0d0$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 28/06/2012 1:32 p.m., Steve (Telsat Broadband) wrote:
> Hi All,
>
> I would like to see if there is some way we can get the 'REDIRECT' target
> implemented into ip6tables; this isn't for NAT purposes; but rather for the
> process of creating a captive portal for network users access requests.  We
> currently use the REDIRECT target on our gateway for IPv4 and need the same
> functionality for IPv6.
>
> It has been suggested that 'TPROXY' which is available in the mangle table
> is a replacement; but it isn't.  I have tested TPROXY every which way but
> still to no avail; the packets hit the TPROXY rule but simply do not get
> send to the captive portal process which is running on the gateway machine.

Strange. Quite a few people are happily using TPROXY to redirect IPv6 
packets to a local Squid proxy portal.
The only instances I've found problems are where NAT is also being used 
on the box and changing the packets after TPROXY has setup the routing 
rules.

AYJ

