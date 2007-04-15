From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Unable to block ICMP
Date: Sun, 15 Apr 2007 20:14:35 +0200
Message-ID: <006901c77f89$ec747250$0101000a@tanjian>
References: <46225C81.6070503@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46225C81.6070503@gmail.com>
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

> Well, what I actually wanted (which I probably explained
> wrong) is that my ports that are not in use (closed) are
> being invisible (no ICMP echo). That better?

On the forum you are using this ruleset:

iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -p tcp --dport 631 -j DROP
iptables -A INPUT -p tcp --dport 445 -j DROP
iptables -A INPUT -p tcp --dport 139 -j DROP
iptables -A INPUT -p tcp --dport 6000 -j DROP
iptables -A INPUT -p icmp -j DROP
iptables -A OUTPUT -p icmp -j DROP

Personally, I wouldn't want to do this. Why don't you DROP everything by
default and open up what you need, instead of ACCEPTing everything but
trying to DROP some ports/icmp?

Such ruleset would look like this:

$ipt -P INPUT DROP
[..ACCEPT rules here..]

Or like this:

[$ipt -P INPUT ACCEPT]
[..ACCEPT rules here..]
$ipt -A INPUT -j <DROP|REJECT [reject-with ...]>

IMHO that would be easier: for my IP, the website you mentioned shows
"steathed" (except for ports that I know are open) for the ports that
were scanned.


Grts,
Rob


