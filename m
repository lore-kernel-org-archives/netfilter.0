From: Ed W <lists@wildgooses.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Fri, 27 Jan 2012 23:54:21 +0000
Message-ID: <4F23392D.5010608@wildgooses.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com> <4F01A53A.6040704@wildgooses.com> <CAKywjPqGyr+eX=BHhn65ehNn=KH9jw76SoqG6awb8AYh+htOeg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPqGyr+eX=BHhn65ehNn=KH9jw76SoqG6awb8AYh+htOeg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anton Melser <anton@linux.com>
Cc: netfilter@vger.kernel.org

On 02/01/2012 13:17, Anton Melser wrote:
>> you can probably also do this by adding
>> the public IPs to your mailserver?
> Definitely, makes load shifting very complicated though...

OK, so if you want an external "load balancer" then your problem reduces 
to *indicating* the desired mapped source address.

If the NAT is on an external box then you can't use fwmarks.  You can 
use either source port or dest port.  You could also add all IPs to all 
servers, but that seems rather tricky to make work in practice.  I think 
your best bet might be a hack, to use dest port as the indicator for 
"source IP".  Set your DNAT to map some range of dest ports to change 
the source to the IP and the dest port to 25. This will allow all 
machines to send and masquerade as any source ip...

I haven't quite thought this through, but I think it will work?


Good luck

Ed W
