From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables NAT logging
Date: Fri, 02 Nov 2007 09:59:47 -0500
Message-ID: <472B3B63.7000203@riverviewtech.net>
References: <472AE429.1060906@bristol.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472AE429.1060906@bristol.ac.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/02/07 03:47, Jonathan Gazeley wrote:
> My NAT solution is implemented in iptables and works fine. The logging 
> partially works but the problem is this: I am logging pre NAT, and my 
> log shows the internal IP and port, and the destination IP and its port. 
> But it does not show the port used by the NAT box to talk to the 
> external IP. Logging post NAT would never detect any packets. If I was 
> able to long pre and post NAT I would be able to log all the information 
> I need.

Ugh, this could be problematic.  If I understand you correctly, you 
essentially need to log the following information.  I also suspect that 
it needs to be per connection NOT per packet.  Correct?

Internal Source IP
Internal Source Port
External Source IP (post NAT)
External Source Port (post NAT)
External Destination IP
External Destination Port
Protocol

I'm not sure if you will want to log the IP level protocol or not, but 
it may be a good thing to do.

I would suggest that you do this logging in the NAT table so that you 
only log the initial packet and not each and every packet that passes 
through.

I'm presuming that you are already logging when the connection 
initiates.  Do you also want to log when the connection terminates?

I unfortunately don't have access to a Linux box doing NATing at the 
moment to know for sure.  However I suspect that some of the external 
information you are needing can be obtained from the connection tracking 
/ NATing sub system.  You may need to use some sort of user space 
process or write a match extension and / or a target that will grab the 
external post nat information that you need.

I would also suggest that you find an optimal way to store the logged 
information.  I don't think that a TCPDump file, or a libcap output file 
will suffice because normally they only refer to two sets of IP and 
Port, not three like you need.

Another option that may work is to mark each packet in some fashion and 
log it before and after NATing.  However seeing as how dynamic things 
are I think it would be very impractical to ""mark packets in the 
traditional sense.

Thinking about the last idea... If you could somehow augment the LOG 
target to also include the connection tracking information (ID if you 
will) you could probably log pre and post NAT and then just have 
multiple records that you would need to pull to correlate your 
information, say connection tracking ID, source IP, source port, 
destination IP, and destination port both before and after.  This way 
you would have everything that you need.

I still feel like your best solution is going to be the first idea, work 
with the connection tracking sub system.



Grant. . . .
