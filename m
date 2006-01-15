From: "Paul Lewis" <paul.lewis@st-annes.oxford.ac.uk>
Subject: RE: Network configuration
Date: Sun, 15 Jan 2006 19:08:32 -0000
Message-ID: <000401c61a07$14f79160$6402a8c0@sannpjl>
References: <001101c61a06$450e7860$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001101c61a06$450e7860$0101000a@sterenborg.info>
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
To: 'Rob Sterenborg' <rob@sterenborg.info>, netfilter@lists.netfilter.org

Hi,

Sorry, I forgot to mention that. Yes, the "echo 1 >
/proc/sys/net/ipv4/ip_forward" has been set to run in rc.local script on
every boot.

Cheers,

Paul

---
Paul Lewis (paul.lewis@st-annes.ox.ac.uk)
Part II Student
Department Of Materials
University Of Oxford



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob Sterenborg
Sent: 15 January 2006 19:03
To: netfilter@lists.netfilter.org
Subject: RE: Network configuration

> I have tried setting up routing using these commands:
> 
> echo "ISP_1" >> /etc/iproute2/rt_tables
> echo "ISP_2" >> /etc/iproute2/rt_tables
> 
> ip route add 192.168.4.0/22 dev eth2 src 192.168.7.253 table ISP_1
> ip route add default via 192.168.100.253 table ISP_1
> ip route add 192.168.0.0/22 dev eth1 src 192.168.3.253 table ISP_2
> ip route add default via 192.168.20.253 table ISP_2
> 
> ip rule add from 192.168.7.253 table ISP_1
> ip rule add from 192.168.3.253 table ISP_2
> 
> However, this yielded no success. I have also tried a simple iptables
> forwarding configuration (without the routing config above):
> 
> iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
> iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
> 
> # default policy
> iptables -P FORWARD DROP

Not looking at your routing rules ; did you also do :
echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob





