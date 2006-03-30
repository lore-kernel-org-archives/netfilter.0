From: "Pedro Drimel Neto" <pedrodrimel@uol.com.br>
Subject: NTH
Date: Thu, 30 Mar 2006 14:34:29 -0300
Message-ID: <000501c65420$333e10b0$2f00a8c0@TRINTASETE>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all,

I'm using the nth module for each connection it change of IP.
The scenario is:
--------------              -------------
| Server with | ------ > |    Server    |
|      NTH     |               |   Master    |
--------------              -------------
So, the users connect to "Server with NTH" and the .bashrc of the user has a 
ssh to "Server Master".
On "Server with NTH" has an interface, eth0, with 2 logics, eth0:0 and 
eth0:1
eth0: 10.0.0.2
eth0:0 10.0.0.3
eth0:1: 10.0.0.4
Above are the rules on "Server with NTH"
iptables -t nat -A POSTROUTING -o eth0 -d "Server Master" -m nth --counter 
7 --every 3 --packet 0 -j SNAT --to-source 10.0.0.2
iptables -t nat -A POSTROUTING -o eth0 -d "Server Master" -m nth --counter 
7 --every 3 --packet 1 -j SNAT --to-source 10.0.0.3
iptables -t nat -A POSTROUTING -o eth0 -d "Server Master" -m nth --counter 
7 --every 3 --packet 2 -j SNAT --to-source 10.0.0.4

So, at each connection to "Server Master" the IP is changed.
As NTH support only packet 0, 1 and 2 and I need to more IPs to be changed, 
if I add more a interface does it work ?
Thanks a lot.

Regards. 


