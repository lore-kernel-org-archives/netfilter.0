From: Kevin de Kok <kevin@oom-killer.org>
Subject: netblock routed over tunnel
Date: Sun, 13 Feb 2005 04:33:55 +0100
Message-ID: <420ECAA3.9010700@oom-killer.org>
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

I have a situation like this:

1 external ip from my ISP
1 tunnel set up with http://www.virt-ix.net/ (check website about info 
about understanding this problem please)

Over tunnel this i have a netblock to my home network. What i want is 
this: the traffic comming from the tunnel to my netblock should be going 
back over the same tunnel(interface). How can i manage that? When ping 
tunnel from outside the internet. It gets answerd back over my normal 
external IP of my ISP(it doesnt answer because my ISP wont allow source 
routing) but it should go back over the tunnel. So i wont get any echo 
reply on ping. I checked with tcpdump. How can i get it routed back over 
tunnel? To connect to tunnel from the internet. I tried a lot of stuff. 
I've be able to only use traffic over the tunnel(with some tricky route 
and ip work) from outside but then i loose the default gw from my isp 
and also my normale internet connection. I just want to use my isp for 
normale internet(clients in my lan 192.168.1.0/25) usage and the tunnel 
for my netblock(external). My tunnel ip is 195.149.88.37 and my netblock 
is 193.17.225.208/29 and the netblocks of whole virt-ix are 
195.149.88.0/24 and 193.17.225.0/24. The whole system is basicly to play 
with BGP I have got that working. But now i just need the tunnel ip 
reachable and the netblock ;)

my external ISP ip:
eth0      Link encap:Ethernet  HWaddr 08:00:20:8F:0F:F9
          inet addr:84.25.67.53  Bcast:84.25.67.255  Mask:255.255.254.0

my external virt-ix TUNNEL ip:
tap0      Link encap:Ethernet  HWaddr 00:FF:A0:F6:67:7E
          inet addr:195.149.88.37  Bcast:195.149.88.255  
Mask:255.255.255.192

Thanks in advance,

Kevin de Kok.



