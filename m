From: Vikram <vikramd@kritikalsolutions.com>
Subject: SNAT Delay
Date: Fri, 13 Jul 2007 15:55:58 +0530
Message-ID: <46975336.2030303@kritikalsolutions.com>
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

I m using a simple NAT scenario. My Linux router has 2 interfaces 
connected to 2 machines, M1 and M2.

         M1                      Linux NAT Router                    M2
[192.168.1.2]<----->[192.168.1.1][10.0.0.1]<----->[10.0.0.2]

Forwarding is enabled on the router. All the tables in iptables are 
flushed. I have enabled continuous ping from M1 to M2. I get no response.

I execute the following iptables command:-

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.2 -j SNAT 
--to-source 10.0.0.1

I am still unable to receive any instant ping response. The NAT 
translations start happening after an unacceptable interval of time 
after which I am able to receive response.

Is this normal? Is there a workaround so that NAT translations begin 
instantly as and when a rule has been inserted?

Vikram


