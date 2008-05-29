From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding packets received on bridged interfaces -regarding
Date: Wed, 28 May 2008 22:07:30 -0500
Message-ID: <483E1DF2.3080304@riverviewtech.net>
References: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/28/08 17:36, Knight Tiger wrote:
> I have a Linux box with two interfaces, eth0 and eth1. eth1 is a 
> wireless interface with connects to a network and receives a DHCP 
> address. eth0 connects to a AP (with a cross over cable) and provides 
> Internet connection to a bunch of clients. The setup looks like this 

> AP1 <--> eth0      eth1 <---> AP2<---> DHCP server.

Let's redraw this up a little bit.

                   +--------------+
                   |    Bridge    |
("Net 0")   AP0---+ eth0    eth1 +---AP1   ("Net 1")   DHCP server
                   +--------------+

Is a client on "Net 0" suppose to have an IP in the same subnet as 
clients on "Net 1"?  Or is the "Bridge" system going to be routing for 
all the clients on "Net 0" and hiding them as one IP to "Net 1"?

I ask this because you are starting to sound like the "Bridge" system is 
suppose to act like a SOHO router like you would use on your DSL / cable 
modem to connect your home LAN to your internet connection.  However 
your original question implied that you wanted "Net 0" and "Net 1" to be 
joined together as one big network where everything on both sides could 
see everything else.

<snip>

Please clarify the above before going further.



Grant. . . .
