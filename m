From: Payal Rathod <payal-iptables@staticky.com>
Subject: can someone check this simple firewall?
Date: Thu, 14 Aug 2003 23:58:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814182810.GA2123@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I have designed a simple firewall ruleset. Can someone please check
them? 
It is kept at http://payal.staticky.com/firewall-1.txt

[Thanks Ralf, I will reply to your mail a bit later when someone
cross-checks this too.]

The objective is as follows,

		eth0=1.2.3.4	
  +----------+      +----------+        +--------------+
  | INTERNET +------+ LINUX    +--------+ WINDOWS      |
  |          |      | FIREWALL |        |   CLIENTS    |
  +----------+      +----------+        +--------------+
		 eth1=192.168.10.100	192.168.10.0/25

Linux box is connected to net thru a permanent ip (1.2.3.4)

LAN users can go anywhere on net as well as Linux box.
So can the Linux box.
But from outside people can connect only to port 21, 22, 80 and can ping
the Linux box (to check whether it is alive or not). Rest everything is
blocked.

Can someone please check my ruleset and tell me whether it will achieve
my obective. I can test that box for very less time so have to do all
the work from a different machine and then copy that file to that Linux
box. Hence any help in finding problems will be appreciated.

Thanks and bye.
With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

