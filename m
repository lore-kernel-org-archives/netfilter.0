From: =?big5?B?R3JhY2UgQ2h1bmcgwemvwKz8?= <gracec@waveplus.com.tw>
Subject: Virtual services cannot been reached from the LAN side
Date: Fri, 11 Mar 2005 17:34:48 +0800
Message-ID: <000c01c5261d$92448bc0$3ca8a8c0@gracec>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone,

I have a FTP server on LAN side (192.168. 1.210), and a local host PC =
A(192.168.1.2).
My gateway has two interface,  eth0 (10.1.1.1) and eth1 (192.168.1.1).

I configure NAT as:
    iptables -t nat -A POSTROUTING -o  eth0 -j MASQUERADE
    iptables -t nat -A PREROUTING -p tcp -d 10.1.1.1 --dport 21 -j DNAT =
--to-destination 192.168.1.210
    iptabled -t nat -A POSTROUTING -p tcp --dport 21 -j SNAT --to_source =
192.168.1.1

PC A try to connect to FTP server using : ftp 10.1.1.1
I monitor the traffic on the LAN=20
    192.168.1.2     ->10.1.1.1             TCP SYN
    10.1.1.1            ->192.168.1.210     TCP SYN
    192.168.1.210    ->10.1.1.1         TCP SYN ACK
    192.168.1.1        ->192.168.1.2     TCP SYN ACK    <- should =
10.1.1.1 ->192.168.1.2
    192.168.1.2        ->192.168.1.1    TCP RST

What rules do I apply it? Does anyone can help me? Thanks!

Grace


