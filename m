From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Tue, 23 Sep 2014 20:41:08 +0300
Message-ID: <5421B0B4.4040106@ngtech.co.il>
References: <1955116.aThXd60LEg@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <1955116.aThXd60LEg@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maarten <maarten@ba.be>, netfilter@vger.kernel.org

Hey Maarten,

As long as I remember conntrack and conntrack are working together.
Which means that udp traffic will be distinguished the same way as TCP 
as long the connection tracking categorized it under the same connection 
stream.
(I think for unestablished connection 30 secs and more for an 
"established" one)

Eliezer

On 09/23/2014 03:46 PM, Maarten wrote:
> Hi,
>
> until now, i've done multiple ISPs with nexthop default route, 2 extra tables,
> ip rule and TCP connmark.
>
> but, how does this involve UDP traffic...
>
> if for example i have in my NAT LAN an NTP server, how would i get the udp
> packet out the same interface where it was originally coming in from?
>
> please advise...
>
> Maarten

