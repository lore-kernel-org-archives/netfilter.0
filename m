From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Forwarding........Help
Date: Wed, 24 Dec 2003 10:15:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241015.34055.Antony@Soft-Solutions.co.uk>
References: <6.0.1.1.0.20031224153752.01e905d0@mail.oxynetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.1.1.0.20031224153752.01e905d0@mail.oxynetworks.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 24 December 2003 10:17 am, G.Laxman wrote:

> Hi,
>
> Here I have one more public IP . ..ie. 61.11.10.12.. I need to map this
> IP  61.11.10.12 to 192.168.1.10
> and I want to allow only 80 port of 192.168.1.10 machine....... (Only web
> request)
>
> I have tried the following command........but not working......
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 -s 0.0.0.0/0 -d
> 61.11.10.12 -j DNAT --to 192.168.1.10:80

1. Do you have a FORWARD rule allowing packets from external IPs to 
192.168.1.12, TCP port 80?

2. Have you bound the extra external address 61.11.10.12 to eth1 on the 
firewall so that it answers arp requests for it as well as its primary 
address of 61.11.10.11 ?

(ifconfig eth0:0 61.11.10.12 (deprecated) or ip addr add 61.11.10.12 dev eth0 
(preferred)).

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


