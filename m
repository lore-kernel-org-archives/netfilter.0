From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: connect to different port
Date: Thu, 08 Dec 2005 14:56:46 +0200
Message-ID: <43982D8E.9020308@eccotours.dyndns.org>
Reply-To: bclark@eccotours.dyndns.org
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hi all

I would like to have it so that a connection (destined for port 8080) comes in on eth0 and jumps to port 3389

$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to 192.168.111.248:3389
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 8080 -d 192.168.111.248 -j ACCEPT

For some reason, I cant get this to work.

I cant use:
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 3389 -j DNAT --to 192.168.111.248:3389
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 3389 -d 192.168.111.248 -j ACCEPT

as this is already in use for another machine


If anyone has the answer i would be most grateful.

Kind Regards
Brent Clark

