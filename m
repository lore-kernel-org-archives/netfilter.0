From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: forward is not forwarding
Date: Fri, 6 Sep 2002 08:14:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c2556c$b228c340$0401000a@win2k>
References: <Pine.LNX.4.44.0209060140001.413-100000@triton.neptune.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209060140001.413-100000@triton.neptune.on.ca>
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

> > iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
> > iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT> Did you enable IP
forwarding at the kernel level ?

> what does "cat /proc/sys/net/ipv4/ip_forward" show ?
>
> If 0, then you need to enable IP fowarding by doing this:
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
>

Do you need netfilter ?
How about your routing table (route -n). Do you have routings like :

Destination     Gateway         Genmask
...
10.1.1.0        10.1.1.1        255.255.255.0
192.168.1.0     192.168.1.1     255.255.255.0
...


Rob


