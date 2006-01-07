From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
Subject: iptables: No chain/target/match by that name
Date: Sat, 07 Jan 2006 12:42:16 +0530
Message-ID: <BAY105-F281A346E9A68ED0764F10F9E200@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi ,

I am using  iptables rule for Load Balancing with random* or nth but i am 
getting the error

iptables: No chain/target/match by that name

iptables rule :  iptables  -A PREROUTING -i eth0 -p tcp --dport 80 -m state 
--state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT 
--to-destination 192.168.0.5:80

iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW -m 
random --average 25 -j DNAT --to-destination 192.168.0.5:80

My kernel version is  2.6.9-5.0.3.EL
Iptable version = iptables v1.3.4

can anyone  explain.

Thanks..

_________________________________________________________________
A Camera Sells every 2 Minutes on eBay. Get Your's at a Great Price Now! 
http://adfarm.mediaplex.com/ad/ck/4686-26272-10936-699?ck=Cameras


