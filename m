From: Sander Sneekes <sander@dmdsecure.com>
Subject: Re: Port Forwarding only works outside?
Date: 10 Dec 2002 17:28:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039537731.7136.10.camel@sander>
References: <97AE76F7052DBB43A268427FCAAEF0371BF6CE@s-2k-corp1.bass-inc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <97AE76F7052DBB43A268427FCAAEF0371BF6CE@s-2k-corp1.bass-inc.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Todd Hartman <thartman@bass-inc.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

try 

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
iptables -A FORWARD -p tcp --dport 25 -d 192.168.1.29 -j ACCEPT
iptables -A PREROUTING -t nat -p tcp --dport 25 -d x.x.x.x -j DNAT --to
192.168.1.29

x.x.x.x = eth0 external ip

On Tue, 2002-12-10 at 16:31, Todd Hartman wrote:
> I've come across an issue I just don't know how to solve. I'm not even
> certain it's an issue with iptables itself, but I thought that someone
> here might have run across this before and have some advice.
>  
> I've got a RH7.3 box set up with two NICs. Eth0 is external and eth1
> is internal. Internal network is 192.168.1.* with netmask
> 255.255.255.128. I need to forward traffic on eth0, port 25 to
> 192.168.1.29. The firewall is 192.168.1.1 - both in the same subnet as
> I understand it.
>  
> When I forward SMTP traffic to 192.168.1.29 and try to telnet to port
> 25 to test SMTP, it just sits there, unresponsive. BUT, if I forward
> eth0 port 25 traffic to a machine out on the internet, it works just
> fine.
>  
> I suspect a networking problem, but I don't know well enough to pin it
> down myself.
>  
> -T
>  


