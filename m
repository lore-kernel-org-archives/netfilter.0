From: luca <llcfhll@gmail.com>
Subject: particular DNAT
Date: Tue, 06 Sep 2005 22:55:26 +0200
Message-ID: <431E023E.8060100@tin.it>
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

I have a firewall netfilter + iptables and the configurations is:

        adsl---------------------      ----------------------dmz ----web
                            eth2|     |eth1                    
                                     FW
                            eth3|     |eth0
        hdsl---------------------      ----------------------- lan

and for the server web i have a DNAT from hdsl on dmz

    iptables -t nat -A PREROUTING -p tcp -d ip.public.hdsl --dport 80 -j 
DNAT --to $serverweb:80

but now I need a DNAT similar for the adsl

    iptables -t nat -A PREROUTING -p tcp -d ip.public.adsl --dport 80 -j 
DNAT --to $serverweb:80

for the same server web, but now the response from server web go out 
from the hdsl line (the defualt gw) and it dont work.

In other word I want to forward the connection to the server web with 2 
ip public: ip.public.adsl and ip.public.hdsl but the response pass only 
from the hdsl line. What can i do to distinguish the 2 different ip 
public to determine the correct gw ?

For me the ipt_ROUTE  is part of the solutions of my problem!

CFH




