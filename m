From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Multiple interfaces with the same IP address
Date: Wed, 07 Oct 2009 13:02:56 -0700
Message-ID: <4ACCF3F0.5040703@hp.com>
References: <4ACCEDDA.9020508@spacex.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACCEDDA.9020508@spacex.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Wilson-Lindberg <gregw@spacex.net>
Cc: netfilter@vger.kernel.org

Greg Wilson-Lindberg wrote:
> At this point I'm just asking for a direction to go to get the 
> information that I need.  While I've been writing low level networking 
> software for many years, I've never had to get into routing.
> 
> Here's my problem, we have an environment where we have a machine with 
> one ethernet connection to the wider network and a number of HDLC cards 
> that connect to other embedded systems that we NAT out to the ethernet WAN.
> 
>                    ------------------------------
>                    |       (172.16.4.9/12) hdlc2|---------\
>                    |                            |         |
> WAN 10.0.0.0/8 ----| eth0 (10.1.32.x/8)         |         |
>                    |                            |         |
>                    |       (172.16.4.9/12) hdlc1|------\  |
>                    |                            |      |  |
>                    |       (172.16.4.9/12) hdlc0|---\  |  |
>                    ------------------------------   |  |  |
>                                                     |  |  |
>                                                     |  |  |
>                         machine1a-------------------|  |  |
>                     (172.24.127.249)                |  |  |
>                     (172.16.129.9)                  |  |  |
>                                                     |  |  |
>                         machine2a-------------------|  |  |
>                     (172.24.0.37)                   |  |  |
>                     (172.16.129.17)                 |  |  |
>                                                     |  |  |
>                         machine3a-------------------|  |  |
>                     (172.24.0.41)                   |  |  |
>                     (172.16.129.25)               ...  |  |
>                                                        |  |
>                         machine1b----------------------|  |
>                     (172.24.127.250)                   |  |
>                     (172.16.129.9)                     |  |
>                                                        |  |
>                         machine2b----------------------|  |
>                     (172.24.0.38)                      |  |
>                     (172.16.129.18)                    |  |
>                                                        |  |
>                         machine3b----------------------|  |
>                     (172.24.0.42)                      |  |
>                     (172.16.129.26)                  ...  |
>                                                           |
>                         machine1c-------------------------|
>                     (172.24.127.251)                      |
>                     (172.16.129.11)                       |
>                                                           |
>                         machine2c-------------------------|
>                     (172.24.0.39)                         |
>                     (172.16.129.19)                       |
>                                                           |
>                         machine3c-------------------------|
>                     (172.24.0.43)                         |
>                     (172.16.129.27)                       |
>                                                         ...
> 
> As can be seen from the above diagram, the addresses on the HDLC 
> channels are not on separate subnets.  We also have some broadcast 
> addresses that the machines on the HDLC nets will need to receive.  We 
> do know all of the addresses for all of the machines on the HDLC nets, 
> but we could end up with as many as 30-50 on each net.  Most of the 
> packets coming from the ethernet WAN will go to just one of the HDLC 
> nets, but the broadcast packets will need to go to all of them.  Also, 
> the HDLC nets do not need to be able to communicate between themselves.
> 
> Can anybody at least point me in the proper direction on how I need to 
> attack this problem?

Is there a specific reason you cannot further subnet the 10.0.0.0/8 network for 
your HDLC channels and eschew the NAT?  Then at least ignoring the issue of 
"routing" broadcast datagrams (these are IP broadcasts and not simply ethernet 
broadcasts right?) reaching-out and touching the HDLC devices from the WAN would 
seem to be more straightforward.

rick jones
visions of many static routing table entries floating through his head
