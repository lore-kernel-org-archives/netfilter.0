From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: NAT rules for VPN only allowing one user?
Date: Wed, 30 May 2007 19:24:11 -0500
Message-ID: <465E15AB.2070305@aesgi.com>
References: <000c01c7a217$2e0ab670$dededede@neilhp> <465DE75D.5070006@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465DE75D.5070006@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

That is correct.

Please use the latest in stream kernel for your distro, or build the 
latest one from kernel.org.

-gc

Martijn Lievaart wrote:

> Neil Aggarwal wrote:
>
>> Hello:
>>
>> I have a Linux machine acting as a firewall for my
>> network.  I have a couple of remote users that need
>> access to the internal network, so I put a Linksys
>> RV042 VPN Router on my internal switch.
>>
>> On the Linux box, I set these iptables rules (Line breaks
>> added for readability):
>>
>> /sbin/iptables -t nat -A PREROUTING -p tcp     -i eth0 -d $ETH0_IP 
>>     --sport 1024: --dport 1723     -j DNAT --to $LINKSYS_VPN_IP:1723
>> /sbin/iptables -A FORWARD -i eth0 -o eth1     -d $LINKSYS_VPN_IP -p 
>> tcp     --sport 1024: --dport 1723     -m state --state 
>> NEW,ESTABLISHED -j ACCEPT
>> /sbin/iptables -t nat -A POSTROUTING -o eth1     -d $LINKSYS_VPN_IP 
>> -p tcp --dport 1723     -j SNAT --to-source $ETH1_IP
>> /sbin/iptables -t nat -A PREROUTING -p gre -i eth0     -j DNAT --to 
>> $LINKSYS_VPN_IP
>> /sbin/iptables -A FORWARD -i eth0 -o eth1     -d $LINKSYS_VPN_IP -p 
>> gre -j ACCEPT
>> /sbin/iptables -t nat -A POSTROUTING -o eth1     -d $LINKSYS_VPN_IP 
>> -p gre -j SNAT --to-source $ETH1_IP
>> /sbin/iptables -t nat -A PREROUTING -s $LINKSYS_VPN_IP     -d 
>> $ETH1_IP -p gre -j ACCEPT
>> /sbin/iptables -A FORWARD -i eth1 -o eth0     -s $LINKSYS_VPN_IP -p 
>> gre -j ACCEPT
>>
>> Either one of my remote users can connect to the VPN using
>> the Windows XP VPN client.  But, if one of them is connected
>> and the other tries to connect, the second person gets to
>> the verifying username and password screen and then
>> gets an Error 619 that they are not able to connect.
>>
>> I think somehow the existing connection is mis-routing
>> the login for the second connection.
>>   
>
>
> IIRC, for this to work a helper must be loaded to fixup the GRE 
> stream. And older implementations only allowed one connection. I might 
> be totally of on this one, but maybe a newer kernel will fix your 
> problem.
>
> You might ask in the netfilter-devel list where there is more 
> expertise on this.
>
> HTH,
> M4
>


