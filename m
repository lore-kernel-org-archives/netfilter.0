From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: Forward port 80 (www) to other router..
Date: Sun, 20 Feb 2005 10:50:08 +0100
Message-ID: <42185D50.8030601@eulerhermes.pl>
References: <200502181838.40615.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <200502181838.40615.marcin.giedz@eulerhermes.pl>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Cc: netfilter@lists.netfilter.org

Użytkownik Marcin Giedz napisał:

>Hello..
>
>Here is the problem: I have two routers connected to two different providers. 
>Both routers have internal interfaces in my LAN.
>
>router1
>provider1<----------->eth0---------linux---------eth1<------------>LAN 
>(192.168.49.101)
>router2
>provider2<----------->eth0---------linux---------eth1<------------>LAN 
>(192.168.49.10)
>
>Nowadays all clients in LAN have set up router1 as the default gateway so all 
>traffic is forwarded to this router1 (www e.g.). Now I'd like to forward all 
>www traffic to router2 from all my clients. I know this should be done on 
>router1 with some iptables rules but I'm rather fresh in netfilter so if it 
>possible please help me ;)
>
>Thanks,
>Marcin
>
>
>  
>
Hello again ;)

I think my problem is solved with iptables and iproute2 (ip) - mainly 
taken from transparent proxy - THANKSSSS
And here is the solution:

on router1 put:
iptables -t mangle -A PREROUTING -j MARK --set-mark 3 -p tcp --dport 80 
-s 192.168.49.9 (192.168.49.9 is my internal router, behind him there 
are all my clients)
ip rule add fwmark 3 table 2
ip route add default via router2_eth1_address dev eth1 table 2

That is all.
Now I have main router (router1) for other than port 80 traffic and 
router2 for port 80 traffic.

Thanks,
Marcin

