From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: ftp contrack
Date: Mon, 24 Jan 2005 00:57:14 +0100 (MET)
Message-ID: <22793.1106524634@www29.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org

Hello List!

I am trying to redirect (NAT) to a internal ftp box (but both have a public
ip).
I am using those rules:

modprobe ip_conntrack_ftp ports=21,2121
modprobe ip_nat_ftp
iptables -t nat -A PREROUTING -d $FW -p tcp --dport 2121 -j DNAT --to
$FTP:21
iptables -A POSTROUTING -t nat -d $FTP -p tcp --dport 21 -j SNAT --to
$FW:2121


They kind of worked for a while. The forwarding of port 21 to 2121 worked
one out of 10 times maybe.

Now the packets dont get forwarded at all anymore.
/proc/sys/net/ipv4/ip_forward is set to 1.

Default policy is set to ACCEPT when i am testing it.
With tcpdump i see the packets coming in, but they don`t get forwarded.


Any idea what i am doing wrong?


Cheers, Mario

-- 
Sparen beginnt mit GMX DSL: http://www.gmx.net/de/go/dsl

