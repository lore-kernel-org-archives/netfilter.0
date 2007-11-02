From: Martijn Lievaart <m@rtij.nl>
Subject: Re: iptables NAT logging
Date: Fri, 02 Nov 2007 10:36:11 +0100
Message-ID: <472AEF8B.1070703@rtij.nl>
References: <472AE429.1060906@bristol.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472AE429.1060906@bristol.ac.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>
Cc: netfilter@vger.kernel.org

Jonathan Gazeley wrote:
> Hello,
>
> I am stuck while trying to log a NAT box to a sufficiently high level.
>
> The NAT box caters for up to several hundred users in a large 
> organisation (University of Bristol) so thorough logging of all 
> connections is essential, for traceability and our legal requirements. 
> Basically I need to know which internal (private) address was talking 
> to which external IP address on which ports at which time.
>
> My NAT solution is implemented in iptables and works fine. The logging 
> partially works but the problem is this: I am logging pre NAT, and my 
> log shows the internal IP and port, and the destination IP and its 
> port. But it does not show the port used by the NAT box to talk to the 
> external IP. Logging post NAT would never detect any packets. If I was 
> able to long pre and post NAT I would be able to log all the 
> information I need.
>

Logging in filter/FORWARD should see all packets.

M4

