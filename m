From: "Peter Marshall" <peter.marshall@caris.com>
Subject: broadcasts through firewall
Date: Thu, 6 Jan 2005 12:13:02 -0400
Message-ID: <JKENKBGIPCFNFMNFENJPAEHICJAA.peter.marshall@caris.com>
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

I know this is not advisable .... and I am not intending to do it on my
network ... (but I need to test it for a client).  Basically, we have a hasp
key on a server in the DMZ.  This key is a server license key for one of our
products.  They way it works is every 10 minutes a broadcast is sent from
the application to find the HASP key, if it does not then the app stops.
The problem is that broadcasts don't go through firewalls.  Is there a way
to let a udp broadcast destined for a particular port go through the
firewall and DNAT it to a particular address .... ?  I tried using a DNAT
rule, but it did not seem to do anything.

$IPT -A PREROUTING -s 192.168.201.8 -p udp --dport 3047 -j
DNAT --to-destination x.x.x.32
$IPT -A FORWARD -d x.x.x.32 -p udp --dport 3047 -j ACCEPT


Any ideas ?

Thanks


