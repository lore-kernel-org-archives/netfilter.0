From: "plugthebox.net /dev/null" <devnull@plugthebox.net>
Subject: INPUT and PORTS
Date: Wed, 01 Nov 2006 14:49:09 +0200
Message-ID: <1162385349.17873.30.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hello,
I want to do the following, accept in comings from 10.2.2.115 only
restricting to port 80,22

is this correct? 

-P rules ...
-F rules ...
/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j ACCEPT
/sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT

Eventhough i saw this setup in many tutorials/howtos,  when ever i want
to block 10.2.2.115 (by not listing him in the INPUT -j ACCEPT), that ip
can still connect to port 80 and 22.



Thanks
Sincerely,


