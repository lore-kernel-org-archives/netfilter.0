From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Tue, 31 Aug 2010 10:25:57 -0500
Message-ID: <4C7D1F05.4050704@riverviewtech.net>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com> <4C7D11F5.1010105@riverviewtech.net> <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/31/10 09:49, Giacomo Bernardi wrote:
> Doesn't seem to work, despite I created the arp entry with:
>  arp -s 10.2.0.1 00:11:22:33:44:55

The bogus IP will need to be in the same subnet to work.  I.e. 10.0.0.11.

> To be honest I'm not surprised: how is the receiver of those datagram
> supposed to know they are for itself, since the dstip doesn't match
> the IP of the local incoming interface?

Sometimes it does, sometimes it doesn't.  It really depends on how 
things are configured on the destination device.

It's one of those "It might fail, but if it works, it's worth the 90 
seconds it took to try it." things.

I often use this when I'm configuring devices (APs) that all share the 
same IP address at initial configuration.  I will set the MAC address in 
the ARP cache and then connect / configure as need.



Grant. . . .
