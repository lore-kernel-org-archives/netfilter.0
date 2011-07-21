From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reject non-ipsec traffic
Date: Thu, 21 Jul 2011 21:29:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107212128360.6745@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>  <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>  <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>  <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
  <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>  <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>  <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>  <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz> 
 <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com> <1311274881.1484.49.camel@lt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1311274881.1484.49.camel@lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Kath <steven.kath@vyatta.com>
Cc: Ryan Whelan <rcwhelan@gmail.com>, Petr Pisar <petr.pisar@atlas.cz>, netfilter@vger.kernel.org

On Thursday 2011-07-21 21:01, Steven Kath wrote:

>On Thu, 2011-07-21 at 13:05 -0400, Ryan Whelan wrote:
>> The issue is that IPSec is protecting a GRE tunnel and if IPSec fails
>> for some reason, GRE will be happy to work without it; tunnelling
>> everything in the clear.  I was just hoping to put some kind of fail
>> safe in place so if IPSec stopped working or failed to start,
>> unencrypted traffic wouldn't be transmitted. 
>
>You could create a private loopback address on each endpoint, and use
>those loopback addresses in the encryption policy.  The only way the
>loopback addresses can reach each other is while the IPsec associations
>are up.  Then set up the GRE tunnel with the loopbacks as its endpoints.
>That way, when the IPsec tunnel is down, GRE will no longer be happy to
>work without it.  

What I thought of was the use of veth, such that you have a way to 
distinguish between a packet that remained unencrypted, or one that is 
yet to possibly get encrypted.
