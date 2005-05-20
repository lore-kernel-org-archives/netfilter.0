From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Blocking ip addresses..
Date: Fri, 20 May 2005 19:26:41 +0200
Message-ID: <20050520172641.GF9921@gw.home.tux-labor.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I want to block specified IP Addresses "on the fly".

My Firewall is started, and then without a restart, I want to
block all established,new,related connection to a specified host or
port.

The Problem is, when I use the conntrack modul, and I block a IP with
this command : 

iptables -t nat -I POSTROUTING -p tcp  -s 192.168.0.23 --dport 25 -m
conntrack --ctstate ESTABLISHED,NEW,RELATED -j DROP,


then I can't create new Connections, but I can use further on the established
connections.

Is there a Solution to also stop working the established connections?

regards sebi


-- 
Sebastian Docktor <sebi@tux-labor.de>

