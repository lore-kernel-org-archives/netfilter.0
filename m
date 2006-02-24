From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Fri, 24 Feb 2006 09:48:55 -0500
Message-ID: <43FF1CD7.40007@certicom.com>
References: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>	<000301c6390b$3ff8eee0$0101000a@sterenborg.info>	<5f56302b0602240214g1ea15a6ah4634a5a78d5bc5dc@mail.gmail.com>
	<54682.193.173.147.3.1140783730.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <54682.193.173.147.3.1140783730.squirrel@webmail.sterenborg.info>
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

Rob Sterenborg wrote:

> On Fri, February 24, 2006 11:14, Daniel Nogradi wrote:
>>DEVICE=eth1
>>BOOTPROTO=none
>>BROADCAST=192.168.10.255
>>IPADDR=192.168.10.101
>>NETMASK=255.255.255.0
>>NETWORK=192.168.10.0
>>ONBOOT=yes
>>TYPE=Ethernet
>>GATEWAY=192.168.10.254
> 
> 
> This NIC seems to be connected to your hub/switch/machine B.
> I'd say, because machine A -> internet works, put this one on the
> 192.168.11.0/24 network and machine B also. (You don't want to change things
> that are already working.)
> 
> Change :
> BROADCAST=192.168.11.255
> IPADDR=192.168.11.1
> NETWORK=192.168.11.0
> GATEWAY=192.168.11.1
> 
> 
>>DEVICE=eth0
>>BROADCAST=192.168.10.255
>>IPADDR=192.168.10.105
>>NETMASK=255.255.255.0
>>NETWORK=192.168.10.0
>>TYPE=Ethernet
>>ONBOOT=yes
>>GATEWAY=192.168.10.254
> 
> 
> Because you can use the internet on machine A, I suppose the config for eth0
> is correct.

Daniel, you should try Rob's advice and see if you can get further. Here are
some my two cents. I've never done a PPPoE/DSL in Linux but I noticed a few odd
things about your configuration.

> 
>>USERCTL=yes
>>BOOTPROTO=dialup
>>NAME=DSLppp0
>>DEVICE=ppp0
>>TYPE=xDSL
>>ONBOOT=yes
>>PIDFILE=/var/run/pppoe-adsl.pid
>>FIREWALL=MASQUERADE
>>PING=.
>>PPPOE_TIMEOUT=80
>>LCP_FAILURE=3
>>LCP_INTERVAL=20
>>CLAMPMSS=1412
>>CONNECT_POLL=6
>>CONNECT_TIMEOUT=60
>>DEFROUTE=yes
>>SYNCHRONOUS=no
>>ETH=eth1
>>PROVIDER=DSLppp0
>>USER=02024784362
>>PEERDNS=yes
>>DEMAND=no
>>PERSIST=no

The line ETH=eth1 suggests to me that your PPP connection is bound to eth1.
However, in your previous messages you state that eth1 is on the private side
(attached to machine B) and eth0 is on the public side. This seems odd.

Additionally, resources on the net regarding PPP connections (usually bound to
eth0) has a similar ppp0 configuration as yours. But the associated interface
(usually eth0) for a ppp0 connection is usually down and not configured.

DEVICE=eth0
ONBOOT=no

For example, the section "IP Address Assignment for a Direct DSL Connection" of
URL http://www.siliconvalleyccie.com/linux-hn/network-linux.htm



