From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Wed, 27 Sep 2017 10:20:37 +0200
Message-ID: <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Will Sewell <me@willsewell.com>, netfilter@vger.kernel.org

Le 27/09/2017 à 09:52, Will Sewell a écrit :
> 
> The connection tracking system stores one hash tuple of layer 3/4
> information for each packet's original direction, and one for the
> reply direction. The are embedded in the conntrack struct which stores
> the actual connection state.
> 
> I'm curious why this is.

Because conntrack has to process packets in both directions, and the 
packet header fields in the reply direction may not be obtained just by 
swapping the fields in the original direction.

A few examples :
- DNAT : original destination address/port != reply source address/port
- SNAT : original source address/port != reply destination address/port
- ICMP echo/reply : original type/code 8/0 != reply type/code 8/0
