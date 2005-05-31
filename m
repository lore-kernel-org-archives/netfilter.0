From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: routing within same nic card
Date: Tue, 31 May 2005 09:10:35 +0300
Message-ID: <00ca01c565a7$759eeaa0$d40aa8c0@winxp>
References: <000a01c565a0$867deee0$d40aa8c0@winxp>
	<429BFAE6.90200@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

Hi,

The information you've given is very helpfull, however for your further 
analysis,I would like to give my exact config so that you can double check 
it

Presently I have 2 NIC cards;
eth1 = 212.119.xxx.98/30  directly connected to internet
eth0 = 212.119.xxx.105/29 connected to LAN, with this setup everything is 
working fine

now I need to add another network, since I cannot Add another NIC card, my 
solution is like this
eth1 = 212.119.xxx.98/30 directly connected to internet
eth0 = 212.119.xxx.105/29 connected to LAN1
eth0:1 = 192.168.3.0/26 connected to LAN2

I already done the 3 lines below
sysctl -w net.ipv4.ip_forward=1
iptables -A FORWARD  -s 192.168.3.0/26 -d 212.119.xxx.104/29 -j ACCEPT
iptables -A FORWARD  -s 212.119.xxx.104/29 -d 192.168.3.0/26 -j ACCEPT

Thanks,
Wennie

----- Original Message ----- 
From: "Taylor, Grant" <gtaylor@riverviewtech.net>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, May 31, 2005 8:49 AM
Subject: Re: routing within same nic card


>> I have 1 NIC card with 2 ip address:
>> IP1 = 192.168.3.1/255.255.255.192
>> Network 1 = 192.168.3.0/255.255.255.192
>>
>> IP2 = 192.168.4.1/255.255.255.248
>> Network 2 = 192.168.4.0/255.255.255.248
>>
>> My question, how can workstations from network 1 reaches the workstations 
>> in network 2 and vice versa  using IPtables?
>
> This really is not an IPTables issue as this is more a routing issue than 
> it is a packet filtering issue.  All you need to do to enable the 
> ""routing would be to enable IP forwarding via one of these two methods:
>
> sysctl -w net.ipv4.ip_forward=1
>
> or
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> The only thing that IPTables might be interfering with this on would be if 
> you have your default FORWARD policy to DROP.  In that case you would need 
> to do something like the following:
>
> iptables -t filter -A FORWARD -i eth0 -o eth0 -j ACCEPT
>
> Or if you want to be more specific and specify what subnets can forward 
> you would need the following rules:
>
> iptables -t filter -A FORWARD -i eth0 -o eth0 -s 192.168.3.0/24 -d 
> 192.168.4.0/24 -j ACCEPT
> iptables -t filter -A FORWARD -i eth0 -o eth0 -s 192.168.4.0/24 -d 
> 192.168.3.0/24 -j ACCEPT
>
>
>
> Grant. . . .
> 


