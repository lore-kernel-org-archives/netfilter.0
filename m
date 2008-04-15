From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Tue, 15 Apr 2008 09:57:32 -0500
Message-ID: <4804C25C.7020608@riverviewtech.net>
References: <480479E8.3040904@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480479E8.3040904@naxe.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/15/08 04:48, Fabio De Paolis wrote:
> I have a service that runs on a server that has no public IP, another 
> server with the public IP should forward the port to it.

Let's break this down in to the simple network flow before trying to 
make things work (namely to make sure I understand what you are wanting 
to do).

Let's do a re-draw with some clarifications.

        +---+
        | Z |
        +-+-+
          |
          :       (INet)
          |
        +-+-+
=======| A |============
        +-+-+
          |
      +---+---+   (DMZ)
      |       |
    +-+-+   +-+-+
===| B |===| C |========
    +-+-+   +---+
      |           (LAN)
    +-+-+
    | D |
    +---+

A = Cisco 1
B = Cisco 2
C = HP ProLiant 1
D = Workstation 1
Z = INet client

Note:  References to "External" (e) interfaces will be facing up and 
"Internal" (i) interfaces will be facing down.

I'm presuming (for the sake of discussion) that you presently you have 
globally routable services that appear to be on one or more Ae addresses 
that are port forwarded to Ce (and possibly others).

Now it sounds like you are wanting to port forward (one or more of) said 
service(s) from Ce to De with out changing any thing on A.  So the 
traffic flow would be from client Z to Ae to Ce to De and back in the 
same direction.

I'm also guessing that you would like all systems to have the capability 
(whether or not you use it or firewall it is up to you) to connect to Ce 
and have the connection be port forwarded to De.  Correct?

Before I go in to how to do this, please let me know if I'm on track or not.

> Many thanks for you help

*nod*



Grant. . . .

