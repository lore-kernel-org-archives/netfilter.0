From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: MAC addres and iptables
Date: Sun, 29 Feb 2004 15:06:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4041F1E4.8020408@stupar.homelinux.net>
References: <4041ED0A.9070001@stupar.homelinux.net> <200402291355.16107.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402291355.16107.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-List <netfilter@lists.netfilter.org>

Antony Stone pravi:

>On Sunday 29 February 2004 1:45 pm, Sasa Stupar wrote:
>
>  
>
>>Hi!
>>
>>I have a working router for my network. Is it possible to allow access
>>to the router by defining a MAC address with iptables?
>>So basically I need to allow only some users to access internet and not
>>all. So I want to allow access only to users with certain MAC address
>>and deny all others.
>>
>>Is this possible with iptables and how?
>>    
>>
>
>Try something like:
>
>iptables -A INPUT -s a.b.c.d -m mac --mac aa:bb:cc:dd:ee:ff -j ACCEPT
>
>Where a.b.c.d is the IP address and aa:bb:cc:dd:ee:ff is the MAC address of 
>the machine you want to allow access to the firewall system.
>
>You need to have compiled mac address matching into your kernel, or loaded the 
>appropriate module.
>
>See "man iptables" for more info.
>
>Regards,
>
>Antony.
>
>  
>

Thanx for the answer. Since I am new to linux and iptables: how do I 
know if mac address matching is compiled or not in the kernel and what 
is the responsible module?
BTW, I am running on RH8 with iptables 1.2.9.

Regards,
Sasa

