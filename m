From: first last <doctor_konkord@yahoo.com>
Subject: Re: Re: ip routing after changing mac address to a virtual one
Date: Thu, 30 Nov 2006 08:45:05 -0800 (PST)
Message-ID: <20061130164505.99758.qmail@web50103.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mike <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi Mike,

Yes, eth1 gets its IP address from DHCP server. DHCP
server always gives me the same IP address because it
knows my MAC address. So I only can get a different IP
address by changing my MAC address.

B.R

Sina

>
>
>trying to understand your question better -- does
eth1 use dhcp to get
>a connection from the ISP?
>
>On 11/25/06, first last  wrote:
>> Hi all.
>>
>>  I have a SuSE Linux box with two network
interfaces.
>> An ethernet which I use to connect to the ISP, and
a
>> wireless interface to share Internet with my room
>> mate. The problem is when I change the MAC address
of
>> my ethernet card (eth1) in order to get a different
IP
>> address from ISP, iptables no longer does the
>> masquerading, thus my friend can't access to the
>> Internet anymore. I try to restart iptables but
>> nothing happens. Our guess is that iptables uses
real
>> mac addresses of network interfaces to forward and
NAT
>> ip packets, so it doesn't work with virtual MAC
>> address.
>>
>> can anyone please suggest a solution to this issue?
>>
>> Thank you very much



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com

