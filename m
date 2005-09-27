From: "P theodorou" <props666999@hotmail.com>
Subject: interface vs ip
Date: Tue, 27 Sep 2005 11:32:56 +0000
Message-ID: <BAY102-F8E3F9B17E34FC090707EEAE8A0@phx.gbl>
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

Im new to this therefore i need to clarify the followings

1)can i send or recieve packets from interface to ip and vise versa

or  only to interfaces and only to ips

2)

I want to let icmp packets from 192.168.0.1(eth1) to 192.168.1.1(eth2)

is it safer to declare

iptables -A INPUT  -i eth1   -o eth2 -J ACCEPT

or
iptables -A INPUT -s 192.168.0.1 -d 192.168.1.1

Thank You



