From: harish.k@lntinfotech.com
Subject: RE: IPTables Query
Date: Thu, 24 Oct 2002 09:41:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFA54EDF60.900EBEC3-ON65256C5C.0016C998-65256C5C.0017016A@lntinfotech.com>
References: <FLEKIPPLAEDMJMOOBBDPCECJDEAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPCECJDEAA.stewart.thompson@shaw.ca>
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
Cc: netfilter@lists.netfilter.org, netfilter-admin@lists.netfilter.org

Hi Stewart,

I'm sorry if I've not been clear. The Checkpoint Firewall NATs all 
requests from the
172.16-31 range to a valid 203.199.x.x IP Add and sends them out to the 
internet.

Rgds
Harish





Stewart Thompson <stewart.thompson@shaw.ca>
Sent by: netfilter-admin@lists.netfilter.org
10/23/2002 11:56 PM
Please respond to stewart.thompson
 
        To:     harish.k@lntinfotech.com
        cc:     netfilter@lists.netfilter.org
        Subject:        RE: IPTables Query


HI Harish:

                 Perhaps I should have asked for more facts. I assumed,
perhaps incorrectly, that you wanted to forward the DNS request
across the Internet It is my understanding that your IP fell within
the private Class B IP range of  172.16.0.0  -  172.31.255.255.
It is also my understanding that routers on the Internet drop IP's
that fall into established private IP ranges. If I am wrong on this
point, someone please correct me.

Stu..........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
harish.k@lntinfotech.com
Sent: October 23, 2002 1:08 AM
To: stewart.thompson@shaw.ca
Cc: netfilter@lists.netfilter.org
Subject: RE: IPTables Query

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






