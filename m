From: "Krishantha Dinesh" <krishantha@krishantha.com>
Subject: change reply message of icmp request
Date: Mon, 18 Jun 2007 12:15:47 +0530
Message-ID: <10928.154763724$1182148430@news.gmane.org>
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
To: netfilter@lists.netfilter.org

Hi guys
I am petty new for linux firewall. Now I want to change the reply massage of
REJECT icmp request.
Eg;- if my firewall got ping request I need  send massage as "Ping request
not ALLOWED by this IP" or something like this.
I am going to reject icmp like this

Iptables -A INPUT -p icmp -j REJECT

If any body know this please help me.
Krisha



