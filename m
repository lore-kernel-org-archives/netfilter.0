From: harish.k@lntinfotech.com
Subject: RE: IPTables Query
Date: Wed, 23 Oct 2002 13:37:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4C23D8BB.4F323586-ON65256C5B.002C3B86-65256C5B.002CA6D5@lntinfotech.com>
References: <FLEKIPPLAEDMJMOOBBDPEEBDDEAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPEEBDDEAA.stewart.thompson@shaw.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stewart.thompson@shaw.ca
Cc: netfilter@lists.netfilter.org

Hi Stewart,

I have a Checkpoint firewall sitting in front of me. It's IP Add is 
172.25.8.1. This machine does the NAT and filter functions.
It is in turn connected to a router thru another interface and to the 
Internet.
The IP Add 172.25.8.125 *has* permission to pass thru, but the IP
172.25.8.130 does not. So locally generated packets destined for
DNS servers need to have the source IP of 172.25.8.125.

Rgds
-- 
---------------------------------------------------------------
Harish K                             <harish.k@lntinfotech.com>
Systems Engineer                            Tel - 91-22-6948065
Don't drink and drive. You might hit a bump and spill your beer
---------------------------------------------------------------




Stewart Thompson <stewart.thompson@shaw.ca>
10/23/2002 01:30 PM
Please respond to stewart.thompson
 
        To:     harish.k@lntinfotech.com, netfilter@lists.netfilter.org
        cc: 
        Subject:        RE: IPTables Query


Hi:

                 This isn't really practical. Most routers will drop 
packets
from private ranges. So your request won't make it to it's destination
Anyway. Netfilter will make sure the request gets back to the right
Machine. Why do you need this?


Stu..........


