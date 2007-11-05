From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables NAT logging
Date: Mon, 05 Nov 2007 10:43:26 +1000
Message-ID: <472E672E.7010508@snapgear.com>
References: <472AE429.1060906@bristol.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472AE429.1060906@bristol.ac.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>
Cc: netfilter@vger.kernel.org

Jonathan Gazeley wrote:
> My NAT solution is implemented in iptables and works fine. The logging 
> partially works but the problem is this: I am logging pre NAT, and my 
> log shows the internal IP and port, and the destination IP and its port. 
> But it does not show the port used by the NAT box to talk to the 
> external IP. Logging post NAT would never detect any packets. If I was 
> able to long pre and post NAT I would be able to log all the information 
> I need.

conntrack netlink events have the information you want.  Look at either
ulogd2 flow logging, or the conntrack tool with the -E option.

