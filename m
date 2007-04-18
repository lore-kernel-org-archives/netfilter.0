From: =?ISO-8859-1?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Setup of different types of NAT
Date: Wed, 18 Apr 2007 10:10:16 +0100
Message-ID: <4625E078.1020301@gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello everyone

I want to know *how to* setup this types of NAT:
/-Full Cone NAT/
/-Restricted Cone NAT/
/-Port Restricted Cone NAT/
/-Symmetric NAT/

Using iptables, I set all policies to "ACCEPT" and I was able to setup 
two kinds of NAT:
(192.168.2.170 is my "public" address and 10.0.0.1 is my "private" address

/-"Full Cone NAT", with the following rules:/
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.170
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1


/-"Port Restricted Cone NAT", with just a single rule:/
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.170/

/
Now does anyone know how to setup Restricted Cone NAT and Symmetric NAT?

Thanks in advance
Pedro
//

