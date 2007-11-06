From: Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>
Subject: Re: iptables NAT logging
Date: Tue, 06 Nov 2007 16:38:52 +0000
Message-ID: <4730989C.4020301@bristol.ac.uk>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472B3B63.7000203@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
> On 11/02/07 03:47, Jonathan Gazeley wrote:
>> My NAT solution is implemented in iptables and works fine. The 
>> logging partially works but the problem is this: I am logging pre 
>> NAT, and my log shows the internal IP and port, and the destination 
>> IP and its port. But it does not show the port used by the NAT box to 
>> talk to the external IP. Logging post NAT would never detect any 
>> packets. If I was able to long pre and post NAT I would be able to 
>> log all the information I need.
>
> Ugh, this could be problematic.  If I understand you correctly, you 
> essentially need to log the following information.  I also suspect 
> that it needs to be per connection NOT per packet.  Correct?
>
> Internal Source IP
> Internal Source Port
> External Source IP (post NAT)
> External Source Port (post NAT)
> External Destination IP
> External Destination Port
> Protocol
Yes that's correct. Per connection is fine; we just need to know which 
users were talking to what, when. Logging every packet simply isn't 
feasible (or useful) on a network that shifts 38TB every single day!
> I'm presuming that you are already logging when the connection 
> initiates.  Do you also want to log when the connection terminates?
Yes, knowing when the connection terminates is also useful, otherwise we 
won't know how long a user is connected to a server for.

I'll let you know how this goes, although this isn't my highest priority 
project at the moment so I may not get a chance to play for a few days.

Thanks a lot for your help,
Jonathan

----------------------
Jonathan Gazeley
ResNet | Wireless Team
Information Services
University of Bristol
----------------------

