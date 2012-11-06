From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [Ntop-dev] New/Updated L7 netfilter  option - nDPI
Date: Tue, 06 Nov 2012 16:13:06 +0200
Message-ID: <50991AF2.30107@ngtech.co.il>
References: <5088717B.6080300@wildgooses.com> <1351412418.2740.5.camel@andylaptop> <508D47E2.8020800@ngtech.co.il> <1351807382.2243.51.camel@andylaptop> <5092FE2D.40009@wildgooses.com> <5093BEAB.2040002@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5093BEAB.2040002@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lutfi ODUNCUOGLU <lutfio@metu.edu.tr>
Cc: ntop-dev@unipi.it, Ed W <lists@wildgooses.com>, netfilter@vger.kernel.org

On 11/2/2012 2:38 PM, Lutfi ODUNCUOGLU wrote:
> Hello,
>
> I compiled nDPI-nefilter patch and it works fine. What I want is to
> shape the p2p traffic in my network. For this purpose i just implemented
> the nDPI-netfilter patch as two different ways for testing
>
>   iptables -t mangle -A POSTROUTING -o XXX -m ndpi --bittorrent -j
> CONNMARK --set-mark 1
>
>
> iptables -t mangle -A POSTROUTING -m connmark --mark 1  -j CLASSIFY
> --set-class 0001:0010
>
> or
>
> iptables -t mangle -A POSTROUTING -m ndpi --bittorrent  -j CLASSIFY
> --set-class 0001:0010
>
>
> So which one is more suitable for use? I don't know if this patch
> inspects connections (marks connection) or every single packet (marks
> every single) for a match.
>
>
> Regards,
>
> Lutfi
Hey Lutfi,

it seems to me that the set-mark is used more then classify and from 
ndpi point of view it's better then restoring marks etc since ndpi 
stores the connection status.

Regards,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
