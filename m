From: Rudi Starcevic <tech@wildcash.com>
Subject: Iptables Media Server Performance
Date: Wed, 29 Dec 2004 15:23:14 -0800
Message-ID: <41D33C62.1010505@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I need to implement a firewall for a linux machine whose primary task is 
a media server.
That is a web site with loads of video: mpeg, avi and wmv formats.

I have everything working well and am very happy.
However I am wondering if there is anything I should consider with 
regard to higher performance.

I have an idea of how much I should try and squeeze out per machine and 
would appreciate any feedback.

I want to ensure the machine is not overloaded resulting in slow video 
streaming/downloading performance.

Currently for:

1) 4000 members this machine has about
2) 200 users at any one time
3) which make about 1500 simultaneous connections
4) using about 75 MBps
5) on a machine with MemTotal: 905336 kB

Right now there are 230 connected users and rising.

When it gets to an average of 250 I'm thinking that is about as much as 
I can get
from this machine and will add more with DNS round robin.

Tasks:
a) www server
- tcp port 80
b) port-forwarding/NAT for a Microsoft Media Server
- tcp port 1755
- udp port 1755
- tcp port 554
- udp port 554
- udp port 5004
- udp port 5005
c) port-forwarding/NAT for ftp
tcp port 21 DNAT --to 192.168.0.10:21

Your input would be much appreciated.
Does it everything look OK to you? Or am I tripping out?

Thanks
Regards Rudi.

