From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: IPTables Query
Date: Wed, 23 Oct 2002 01:00:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPEEBDDEAA.stewart.thompson@shaw.ca>
References: <OF61962908.A658CCF9-ON65256C5B.0023060F-65256C5B.00245CCC@lntinfotech.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <OF61962908.A658CCF9-ON65256C5B.0023060F-65256C5B.00245CCC@lntinfotech.com>
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
To: harish.k@lntinfotech.com, netfilter@lists.netfilter.org

Hi:

	This isn't really practical. Most routers will drop packets
from private ranges. So your request won't make it to it's destination
Anyway. Netfilter will make sure the request gets back to the right
Machine. Why do you need this?


Stu..........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
harish.k@lntinfotech.com
Sent: October 22, 2002 11:37 PM
To: netfilter@lists.netfilter.org
Subject: IPTables Query

Hello List,

This is my first mail to the Netfilter List. I am a newbie to
IPTables, so please be gentle :-)

I have a Red Hat Linux 7.3 box running iptables-1.2.5-3.
I am using iptables primarily for Source NAT.
The machine has two IP Addresses

eth0      : 172.25.8.130
eth0:0    : 172.25.8.125

I am terribly confused with the OUTPUT chain. I have read from
the documentation that the OUTPUT chain is used for locally
generated packets. The machine always uses the IP Add of eth0
for any locally generated packets. How do I configure the OUTPUT
chain such that the machine uses the IP Add 172.25.8.125 when it
requests for specific ports or protocols.
For eg, I want the machine to use the Source IP as 172.25.8.125
whenever it runs a DNS query. How do I go about this?

TIA
Rgds
--
---------------------------------------------------------------
Harish K                             <harish.k@lntinfotech.com>
Systems Engineer                            Tel - 91-22-6948065
Don't drink and drive. You might hit a bump and spill your beer
---------------------------------------------------------------


