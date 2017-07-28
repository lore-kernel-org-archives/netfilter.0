From: Alexander Huemer <alexander.huemer@xx.vu>
Subject: Transport protocol agnostic way to multiplex ports and forward
 metainfo?
Date: Fri, 28 Jul 2017 22:49:30 +0200
Message-ID: <20170728204930.GA20016@yade.chaostreff.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I attempt to create a network service that should be available on a host 
on multiple ports on multiple transport protocols.
Since opening a lot of ports on the application layer is inefficient, I 
would prefer to multiplex on the network layer, like this:

                       +----- netfilter
                       V

--> TCP port 1001 -->--+
                       |
--> TCP port 1002 -->--+--> TCP port 1001
                       |
--> TCP port 1003 -->--+

                       +----- netfilter
                       V

--> UDP port 2001 -->--+
                       |
--> UDP port 2002 -->--+--> UDP port 2001
                       |
--> UDP port 2003 -->--+

[Same possibly for SCTP, DCCP, ...]

One additional requirement is that I would like to be able to know in 
the application on which port the connection reached the system 
originally.

I am aware of the following mechanisms that allow what I want to do:

For TCP: Using a REDIRECT rule with a port range and getsockopt with
         SO_ORIGINAL_DST.

For UDP: Using a TPROXY rule with a port range and recvmsg, then consume
         ancillary message that is provided

For SCTP, DCCP, others: I don't know.

So, my question is: Is there a transport protocol agnostic way to 
multiplex ports to an application, enabling the application to know on 
which port the connection came in?

I looked into libnetfilter_conntrack, though I am not sure if I can use 
it reliably for that purpose, since it is not operating on an actual 
socket AFAICS.

Any advise appreciated.

Kind regards,
-Alex
