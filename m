From: Rudi Starcevic <tech@wildcash.com>
Subject: Port-forwarding + collisions
Date: Thu, 24 Feb 2005 19:48:58 -0800
Message-ID: <421EA02A.3030606@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

I'm still working on why I have poor performance and have found some 
data I need to check as I'm not that familiar.

Below I have the output from ifconfig.
eth0 is my Internet NIC with eth1 my internal 192.168.0.x network.

On my eth0 NIC we can see there is 0 collisions

On eth1 we can see collisions:6810362

This must mean a problem on the 192 end.

These are colo servers which are configured by techs over there so I 
don't have physical access to these machines ...

What could cause such a problem I wonder ?

It seems highly likely that this may be the cause of my bandwidth problems.

It is quite surprising that there is problems as there is only two machines.
--------------------------------------
Windnows 192.x.x.x = Gigabit card
|
Gigabit Switch
|
Linux 192.x.x.x = 10/100 MB card
Linux 64.x.x.x = 10/100 MB card
--------------------------------------

Is there anything special I need to do on the Linux end ?
I am told it is all supposed to auto detect ..

eth0      Link encap:Ethernet  HWaddr xx:xx:xx
          inet addr:66.xxx.xx.79  Bcast:64.255.255.255  Mask:255.255.255.192
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:93820046 errors:0 dropped:0 overruns:0 frame:0
          TX packets:112683401 errors:0 dropped:0 overruns:1 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:375314364 (357.9 MiB)  TX bytes:2449306437 (2.2 GiB)
          Interrupt:10 Base address:0x1000 Memory:40000000-40000038

eth0:0    Link encap:Ethernet  HWaddr xx:xx:xx
          inet addr:66.xxx.xx.100  Bcast:64.255.255.255  
Mask:255.255.255.192
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:10 Base address:0x1000 Memory:40000000-40000038

eth1      Link encap:Ethernet  HWaddr xx:xx:xx
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:110547112 errors:0 dropped:0 overruns:0 frame:0
          TX packets:85362007 errors:85 dropped:0 overruns:0 carrier:85
          collisions:6810362 txqueuelen:1000


Thanks


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


