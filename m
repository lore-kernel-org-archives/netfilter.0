From: srg <srgqwerty@telefonica.net>
Subject: Re: Linux Router
Date: Mon, 07 Feb 2005 21:43:59 +0100
Message-ID: <4207D30F.3090102@telefonica.net>
References: <1107711419.420655bbc259e@mail.gnvfc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1107711419.420655bbc259e@mail.gnvfc.net>
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
To: spdesai@gnvfc.net, netfilter@lists.netfilter.org

Hello:

You have two solutions (one exclude the other):

1. NO nat in the linux machine.
The solution is adding a static route at the router (.65) in the form:
ip route add 192.168.1.0/24 via xxx.xxx.xxx.68
With this solution traffic from your private network is seen by the 
router with the real source address (192.168.1.x).
Of course, if you want this traffic to go to Internet then, the router 
must do source nat (because the source addr will be a private one).

2. nat in the linux machine.
iptables -A POSTROUTING -t nat -o eth0 -s 192.168.1.0/24 -d 0/0 -j 
MASQUERADE
With this solution, traffic originating in your private net will have 
xxx.xxx.xxx.68 source address when the packets leave the linux machine, 
so when the packets arrive to the router (xxx.xxx.xxx.65) will have the 
xxx.xxx.xxx.68 addr (in other words, if you want, those packets can go 
directly to the Internet without the need of another nat in the router)

spdesai@gnvfc.net wrote:

>Hi
>
>I have one linux machine with two NIC cards. One is connected to internet and 
>one is private PC. Below is my IP configuration
>
>eth0: Valid IP: xxx.xxx.xxx.68
>      Mask: 255.255.255.192
>      Gateway: xxx.xxx.xxx.65  
>
>eth1: Invalid IP: 192.168.1.1
>       Mask : 255.255.255.0
>      Gateway: xxx.xxx.xxx.65 
>
>
>Now when i connect eth1 to window machine. i can ping up to eth0 valid ip i.e 
>xxx.xxx.xxx.68 but could not ping xxx.xxx.xxx.65 which is gateway ip of linux.
>
>I have enable ip_forward to 1 in linux machine.
>
>My window machine ip is: 
>IP: 192.168.1.2
>Mask:255.255.255.0
>GW: 192.168.1.1
>
>Pl. give me the solution so i can ping xxx.xxx.xxx.65 from my window machine.
>
>Thanks in advance
>
>suhag.
>
>
>
>-------------------------------------------------
>This mail sent through IMP: http://horde.org/imp/
>
>
>
>  
>


