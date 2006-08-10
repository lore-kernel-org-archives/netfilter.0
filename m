From: Joe Giles <jgiles@windowsproof.com>
Subject: ipt_time time match invalid size
Date: Wed, 9 Aug 2006 18:02:48 -0600
Message-ID: <200608091802.48638.jgiles@windowsproof.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello again,

I finally figured out what I was doing wrong with the P-O-M and the time 
module.

Now, after installing the proper modules and running the following iptables 
command:
IPTABLES = path to iptables
$IPTABLES -A INPUT  -s 192.168.15.131 -m time  --timestart 17:05  --timestop 
17:20  --days Wed -j RULE_2
$IPTABLES -A FORWARD  -s 192.168.15.131 -m time  --timestart 17:05  --timestop 
17:20  --days Wed -j RULE_2

(This was just a test script to see how it worked)

It doesn't work and I get this error executing the command from within my 
script:

iptables: Unknown error 4294967295
iptables: Unknown error 4294967295

And, I get this output in dmesg:

ip_tables: time match: invalid size 0 != 16
ip_tables: time match: invalid size 0 != 16


I used the 20060706 of p-o-m-ng and am using the 2.6.17.8 kernel. The 20060706 
version of p-o-m is the latest with the time module in it and it compiles 
just fine with the kernel.

Does anyone know how I can resolve this issue?

Thanks!!!

Joe


