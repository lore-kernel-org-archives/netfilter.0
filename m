From: "Alejandro Flores" <alejandrorflores@gmail.com>
Subject: Poor forwarding performance
Date: Thu, 24 Aug 2006 14:28:12 -0300
Message-ID: <ca7df3760608241028n53544585rf25217b3053df384@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello there,

I'm facing an strange performance problem. I have a Firewall running
Fedora Core 5, kernel 2.6.15, iptables 1.3.5 between 2 networks. The
1st network is a network with about to 70 desktops. The 2nd network is
a network with about to 20 servers. I'm using 1 Intel 100Mbits and 1
Intel 1000 Mbits, plugged on a 10/100/1000 3Com Switch.
I'm having an horrible performance with the traffic flow from and net
to another. I made some transfer tests and I can't get more than 5
MB/s.
The hardware used is a Pentiu 4 2.26 GHz with 1 GB Ram, running only iptables.
I have read some papers about tunning tcp/ip stack on linux, but
nothing seems to speed it up.
I'm using statefull inspection, and for testing purposes I have
created a rule like:
iptables -A FORWARD -i eth0 -o eth1 -s aaa.bbb.ccc.ddd/32 -d
eee.fff.ggg.hhh/32 -j ACCEPT
iptables -A FORWARD -i eth1 -o etho -s eee.fff.ggg.hhh/32 -d
aaa.bbb.ccc.ddd/32 -j ACCEPT

But, I got the same results.
Any clues?

-- 
Regards,
Alejandro Flores
http://www.triforsec.com.br/

