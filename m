From: Brandon Seaver <brandon.seaver@gmail.com>
Subject: Re: iptables, DNAT, and SMTP
Date: Mon, 5 Mar 2007 15:49:34 -0500
Message-ID: <EDB9C20C-B2E4-458C-9505-135D66A5CC6C@gmail.com>
References: <1832A25C-5FC3-4F24-B55A-C6069A71CD5D@gmail.com>
	<Pine.LNX.4.61.0703030403120.23714@yvahk01.tjqt.qr>
	<99223CBD-A23B-43BE-A316-070BFA672696@gmail.com>
	<Pine.LNX.4.61.0703052137400.24366@yvahk01.tjqt.qr>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:mime-version:in-reply-to:references:content-type:message-id:content-transfer-encoding:from:subject:date:to:x-mailer;
	b=orlvGoxqRhF0bjUywFIOi1GKkwf8oZIfX7IUeiAjqSp+NVqI1pEYopa//zbLd63v7kOhIs5sopBSOw9Q9iFDYkhJmmE6zfpw5xpS8am1L0+hOVvR1R2nsK2UqprzxzshbKKLk5LhVgrHaYwHziHcLFrvszk4sjqaMj7AIi0GKFE=
In-Reply-To: <Pine.LNX.4.61.0703052137400.24366@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

65.15 is a spam filtering appliance, so I do not think that will  
work. I thank you for taking the time to look at this for me.


On Mar 5, 2007, at 3:39 PM, Jan Engelhardt wrote:

>
>>>> I'm hoping to get some help from the community, and I'm sure I'm  
>>>> just
>>>> overlooking something simple. My goal is to forward smtp traffic
>>>> destined for
>>>> one machine to another based on source.
>>>>
>>>> I have done this: echo 1 > /proc/sys/net/ipv4/ip_forward
>>>>
>>>> I've enabled the loading of iptable_nat in the iptables config  
>>>> file.
>>>>
>>>> This is the base of what I'm using in my /etc/sysconfig/iptables  
>>>> file.
>>>> Any
>>>> direction on what I'm missing would be greatly appreciated.
>>>>
>>>> :PREROUTING ACCEPT [1581:83538]
>>>> -A PREROUTING -s xxx.xxx.66.0/24 -i eth0 -p tcp -d xxx.xxx.64.3 --
>>>> dport 25 -j DNAT --to-destination xxx.xxx.65.15:25
>>>
>>> Please show us the output of `ip a` and `ip r`.
>
>> [root@deathstar sysconfig]# ip a
>> 1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
>> link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>> inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
>> inet6 ::1/128 scope host
>>       valid_lft forever preferred_lft forever
>> 2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
>> link/ether 00:18:8b:35:ea:7a brd ff:ff:ff:ff:ff:ff
>> inet XXX.184.64.3/24 brd XXX.184.64.255 scope global eth0
>> inet6 fe80::218:8bff:fe35:ea7a/64 scope link
>>       valid_lft forever preferred_lft forever
>> 3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
>>    link/ether 00:18:8b:35:ea:78 brd ff:ff:ff:ff:ff:ff
>> 4: sit0: <NOARP> mtu 1480 qdisc noop
>>    link/sit 0.0.0.0 brd 0.0.0.0
>> [root@deathstar sysconfig]# ip r
>> XXX.184.64.0/24 dev eth0  proto kernel  scope link  src XXX.184.64.3
>> 169.254.0.0/16 dev eth0  scope link
>> default via XXX.184.64.1 dev eth0
>
> DNAT can logically not work in this setup, unless 65.15 routes  
> received
> packets back to 64.3 for the un-DNATting.
>
>
> Jan
> -- 


