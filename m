From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Traversal of chains for muticast packets .
Date: Fri, 05 Mar 2010 12:00:02 +0100
Message-ID: <4B90E432.8080802@chello.at>
References: <cfeab66d1003042146p62c3904cncfaedbeca4f41c12@mail.gmail.com> <cfeab66d1003050252n27fb7fa2s5ff92a30b0874566@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003050252n27fb7fa2s5ff92a30b0874566@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 05.03.2010 11:53, netfilter-owner@vger.kernel.org wrote:
> My gateway machine has two interfaces , eth0 is connected to wan and
> eth1 is connected to lan side .
> 
> 
> iptable -A    INPUT   -i eth0  -p igmp -d 224.0.0.1 -j ACCEPT
> iptables -A  INPUT   -i eth0  -p igmp -d 224.0.0.2  -j ACCEPT
> iptables  -A INPUT  -i eth0  -j   DROP
> iptables  -A INPUT -i eth1 -j ACCEPT
> 
> 
> iptables -A FORWARD -i eth0 -o eth1 -p udp -d  mutlicast-address -j ACCEPT
> 
> I have above rules , but  i cannot see mutlicast packets in my lan
> client . But if i have
> below rules , it is working . Why i need all rules to be called both
> in forward and input chain ?
> Am i missing something ?
> 
> 
> iptables -A  igmp-rule -i eth0 -p igmp -d 224.0.0.1 -j ACCEPT
> iptables -A igmp-rule -i eth0 -p igmp -d 224.0.0.2  -j ACCEPT
> iptables -A igmp-rule -i eth0 -o eth1 -p udp -d  mutlicast-address -j ACCEPT
> 
> iptables -A INPUT -j igmp-rule
> iptables -A FORWARD -j igmp-rule
> 
> 
> 
> 
> 
> 
> On Fri, Mar 5, 2010 at 11:16 AM, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>> Hi,
>>
>>     "packets those are forwarded traverse thru   "NAT prerouting ->
>> Filter Forward -> NAT post Routing chains ."
>>
>>      But in case of  multicast packets , i can see packets flowing
>> thru  "NAT prerouting -> Filter INPUT -> Filtert  Forward -> NAT post
>> routing chains . why it is so ?  .
>>
>>      Note - > I am running igmpproxy for for multicast proxy .
>>
>>
>> Thanks,
>> Ratheesh.
>>

Because you don't do any DNAT, it's your igmproxy which routes the
packets. Thus what was INPUT has become FORWARD.

Best regards

Mart
