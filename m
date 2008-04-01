From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: FW: CONNMARK and ip rule fwmark
Date: Tue, 01 Apr 2008 01:27:28 -0500
Message-ID: <47F1D5D0.4060406@riverviewtech.net>
References: <6F83141C27C94F17A967258DC5CC1A1A@shs1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6F83141C27C94F17A967258DC5CC1A1A@shs1>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 3/31/2008 2:07 AM, Steffen Heil wrote:
> Can you think of any reason SYN ACK packets are not seen at ANY
> tables in my case?  I see the syn packet and I know the service is
> running at that port!

What are the following files set to on your system?

/proc/sys/net/ipv4/conf/*/rp_filter
/proc/sys/net/ipv4/ip_forward
/proc/sys/net/ipv4/conf/*/log_martians

The more I think about what you are seeing, packets come in to your 
system but not make it to IPTables, the more I think that reverse path 
filter is on (set to 1) and filtering out the packets that you are 
trying to work with.

Consider the configuration below:

            +---+
            | C |
            +-+-+
              :
              :
+---+                 +---+
|   +- -     x     - -+   |
+-+-+                 +-+-+
   a                     b
   D                     D
   |                     |
   e                     e
   A                     B
+-+-+                 +-+-+
| A +-oA-(OpenVPN)-oB-+ B |
+---+                 +---+

When client C connects to eB, which is port forwarded to oA, A will see 
the traffic as being from C to oA.  A would route traffic to C out via 
eA, not oA.  If Reverse Path Filtering (a.k.a. RPF) (rp_filter) is 
turned on (set to 1) then the kernel on A will drop the traffic as it is 
coming in to the system as a martian.  If RPF is not turned on (set to 
0) then the kernel will route the packets with out any regard to the 
source / destination IP address.

I'd suggest that you enable logging of martians (set log_martians to 1) 
and check the syslog for reports of martians / dropped packets.



Grant. . . .
