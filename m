From: "Paul J. Caritj" <pcaritj@riovia.net>
Subject: Redirecting Traffic Locally
Date: Tue, 28 Oct 2003 20:01:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9F1163.9070008@riovia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Gents,
Hopefully this is an easy question :)

I have a firewall with a built in webserver. I want all traffic going 
through this firewall, not to (or from) a proscribed list of IPs to be 
redirected to the Site hosted on the firewall itself (its a signup 
page). At present, I'm using redirection of this form:

iptables -t nat -A UNREGISTERED -s 0/0 -d 0/0 -j DNAT --to-destination 
XXXXXXX;

A rule in the PREROUTING chain bounces traffic to the UNREGISTERED 
chain. The system works fine when XXXXXXX is outside the network. 
However, I cannot DNAT to the firewall itself. Thoughts, anyone?

-Paul


