From: Jason Opperisano <opie@817west.com>
Subject: Re: Linux Router
Date: Sun, 06 Feb 2005 14:46:14 -0500
Message-ID: <1107719174.4679.35.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 2005-02-06 at 12:36, spdesai@gnvfc.net wrote:
> Hi
> 
> I have one linux machine with two NIC cards. One is connected to internet and 
> one is private PC. Below is my IP configuration
> 
> eth0: Valid IP: xxx.xxx.xxx.68
>       Mask: 255.255.255.192
>       Gateway: xxx.xxx.xxx.65  
> 
> eth1: Invalid IP: 192.168.1.1
>        Mask : 255.255.255.0
>       Gateway: xxx.xxx.xxx.65 

you shouldn't have a default gateway on your internal interface. 
default gateway == gateway of last resort; i.e., there's one (barring
some specific multipath routing situation).

> Now when i connect eth1 to window machine. i can ping up to eth0 valid ip i.e 
> xxx.xxx.xxx.68 but could not ping xxx.xxx.xxx.65 which is gateway ip of linux.
> 
> I have enable ip_forward to 1 in linux machine.
> 
> My window machine ip is: 
> IP: 192.168.1.2
> Mask:255.255.255.0
> GW: 192.168.1.1
> 
> Pl. give me the solution so i can ping xxx.xxx.xxx.65 from my window machine.

my guess is that you haven't created an outbound MASQ/SNAT rule (at
least you don't say you have):

  # IF YOUR ETH0 IP IS STATIC
  iptables -t nat -A POSTROUTING -o eth0 \
    -j SNAT --to-source xxx.xxx.xxx.68

-OR-

  # IF YOUR ETH0 IP IS DYNAMIC
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

-j

--
"I've always wondered if there was a god. And now I know there is --
 and it's me."
	--The Simpsons


