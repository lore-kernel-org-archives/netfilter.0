From: uniplex <uniplex@maximum-linux.net>
Subject: -m recent
Date: Thu, 23 Jan 2003 13:11:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E2FEA1C.9030305@maximum-linux.net>
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

Has anyone here had any luck with this?

It's logging the ip and ttl etc etc in the file it's supposed to, but 
the --update -j DROP rule I'm using doesn't seem to have any effect.

Here's a snip of rules from my script that I've been using to test with. 
I've put them in the same order as they appear in the script. It's not 
the entire script(of coarse) and I'm matching to icmp packets just to 
test with.

iptables -A INPUT -i eth0 -p all -m recent --name icmps --update -j DROP

iptables -N icmps
iptables -A INPUT -i eth0 -p icmp -j icmps
iptables -A icmps -m recent --name icmps --set -j DROP
iptables -A icmps -j DROP

Thanks in advance.


