From: Sudheer Divakaran <sudheer@svw.com>
Subject: Re: mark feature not working as expected
Date: Thu, 28 Oct 2004 17:10:59 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4180DACB.1030306@svw.com>
References: <4180D2E2.2000606@svw.com> <200410281305.32933.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410281305.32933.victor@nk.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Victor Julien <victor@nk.nl>
Cc: netfilter@lists.netfilter.org

Hi Victor,  Everybody,

After committing too many errors while composing messages, I ran the 
rules from the command line and the problem fixed.  The problem was that 
I shouldn't have used the output interface name in mangle's PREROUTING 
chain.  i.e., I should have used


iptables -t mangle -A PREROUTING -i eth0 -d 192.168.1.0/24 -j MARK 
--set-mark 1
iptables -t mangle -A PREROUTING -i eth1 -d 192.168.0.0/24 -j MARK 
--set-mark 1


I have been running these commands from a script and it didn't show the 
error messages.  That's why I have disturbed all of you.

Thanks & Regards
Sudheer










Victor Julien wrote:

> Hi Sudheer,
>
> As far as i know you can only use --set-mark in the mangle table. You are
> trying to use it in the nat table.
>
> Try:
> iptables -t mangle -A PREROUTING -i eth0 -o eth2 -j MARK --set-mark 1
> iptables -t mangle -A PREROUTING -i eth1 -o eth0 -j MARK --set-mark 1
>
> Regards,
> Victor
>
> On Thursday 28 October 2004 13:07, Sudheer Divakaran wrote:
>
>> Hi,
>> I'm facing a problem with MARK target.
>>
>> My Linux box has 3 network cards
>>
>> eth0 - LAN1
>> eth2 - LAN2
>> eth3 - ISP
>>
>> My problem is that my Lan machines are not able to communicate with each
>> other (i.e. LAN1 <-> LAN2). Firewall blocks them. But my lan clients
>> have no problem in accessing internet!!.
>>
>> Here is my configuration.
>>
>>
>> # eth0 - LAN1
>> # eth2 - LAN2
>> # eth3 - ISP
>>
>> iptables -F
>> iptables -X
>> iptables -P INPUT DROP
>> iptables -P OUTPUT DROP
>> iptables -P FORWARD DROP
>>
>> iptables -t nat -A PREROUTING -i eth0 -o eth2 -j MARK --set-mark 1
>> #THIS IS NOT WORKING
>> iptables -t nat -A PREROUTING -i eth1 -o eth0 -j MARK --set-mark 1
>> #THIS IS NOT WORKING
>>
>> #Other rules follows... Not listed here
>>
>> iptables -A FORWARD -m mark --mark 1 -j ACCEPT #THIS IS NOT WORKING
>>
>> #Other rules follows... Not listed here
>>
>>
>> I know that I can do it directly from the FORWARD chain of filter table,
>> but I'm using SQUID for transparent proxying for some machines (Those
>> rules are not listed here), so I want to mark some packets. Could
>> someone please help me on this?
>>
>>
>> Thanks
>> Sudheer
>
>


