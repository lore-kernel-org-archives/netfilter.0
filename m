From: "sisdis" <sisdis@tournet.com.ar>
Subject: Ipfilter for DHCP client
Date: Thu, 06 Jan 2005 17:50:05 -0300
Message-ID: <WorldClient-F200501061750.AA50051684@tournet.com.ar>
References: <BAY101-F121798A658C0B56334F8D7DF930@phx.gbl>
	<41DD7A15.6050405@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DD7A15.6050405@lopsch.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear people,

I have  two machines Sun Solaris 7 with ipfilter package in order to filter 
traffic from Internet. Last week I have the machines connected to a 
cablemodem with IP fixed by MAC address and they run OK.

But today I have to change of ISP and reconnect using a cablemodem again. In 
order to get the Sun machines assigned with an dynamic IP, I configured DHCP 
client in each Sun. But they can't get an public IP assigned by DHCP yet, 
they have been connected to the cablemodem since 2 hours, and they have the 
ipfilter running...but the IP is not assigned !!!

Now I don't know if my ipfilter rules are blocking the IP assignment in this 
DHCP client scenario, so I want you to get your opinion. The rules are:

pass in quick on hme0 proto udp from any to any port = 67 #Only permit DGCP 
incoming traffic
pass in quick on hme0 proto udp from any to any port = 68 #Only permit DHCP 
incoming traffic
block in quick on hme0 from 10.0.0.0/8 to any
block in quick on hme0 from 172.16.0.0/12 to any
block in quick on hme0 from 192.168.0.0/16 to any
block in quick on hme0 from 127.0.0.0/24 to any 
block in on hme0 all
pass out quick on hme0 proto tcp from any to any flags S keep state
pass out quick on hme0 proto udp from any to any keep state
pass out quick on hme0 proto icmp from any to any keep state

Special thanks !!!!!!!!!

Alejandro Cabrera
