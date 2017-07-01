From: zrm <zrm@trustiosity.com>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sat, 1 Jul 2017 18:17:07 -0400
Message-ID: <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1498947427; bh=V6y5tyoqxXy0BB9pw0y2SnGVyoYefg3D2q1xiy7tfEM=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=0nfFiSx5rv8SxF9sgWq9COSPoRH067Xh82M26xwKa+NNqPYGPdqjPG2HFTEXvWjqA
         7oRw8AM4vuaZ+AC46tOsGKME6njyw0TfwKbchFB63ZRoX5mYSLwoKcpTmC2XSCCUwe
         UxEgdv3sjKU/cql1sAazf6z0ZteV+xf/Tqv53CHg=
In-Reply-To: <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert White <rwhite@pobox.com>, oyvind@dynator.no, netfilter@vger.kernel.org

On 07/01/2017 04:26 PM, Robert White wrote:
> So, for instance, once you DNAT the incoming packet you _don't_ want to
> SNAT it.

What about hairpin NAT?

Suppose you have a port mapping from the router's public IP (2.2.2.2) to 
some private IP on the LAN (10.2.2.2). Then 2.2.2.2 is published in a 
rendezvous server and some other device (10.2.2.3) on the same LAN 
segment learns that address and opens a connection.

Now you need the SNAT rule, otherwise the router would translate the 
packet for 2.2.2.2 to 10.2.2.2 and 10.2.2.2 would send its response to 
10.2.2.3. 10.2.2.3 is local so it doesn't pass through the router to be 
translated back and the connection fails because 10.2.2.3 is expecting a 
response from 2.2.2.2 rather than 10.2.2.2.

It would obviously be better for the applications to use the private 
addresses directly but you might not be in control of that.

So you need to know the in-interface or similar because you should only 
do the SNAT for hairpin if the client is internal.

The interesting question is whether that can be done without marking.
