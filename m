From: "Antonio Higuera" <ahiguerat11@mi.madritel.es>
Subject: cannot outgoing smtp with snat
Date: Thu, 23 Sep 2004 23:53:11 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <000001c4a1b7$b8c9b350$0202a8c0@DESPACHO>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
 
I have a linux iptables fw with two interfaces: internal and external
(nating the internal traffic) with a public ip. In the internal
interface I have a ms exchange server that forward all the external mail
to the firewall via smtp.
 
-          After setup the linux fw I had a cisco router nating the
traffic to internet and everything went fine. It seems therefore  that
the exchange server works properly.
-          With the linux machine everything works fine unless the
outgoing smtp.I can telnet the port 25 of the external server but
something happen once the smtp protocol has begun. In fact I can see
with a sniffer that the protocol stop when the external server send back
DATA. In this moment the local exchange stop of sending and the timeout
is reached.
-          I tested other smtp applications to send out messages and
work fine with iptables. But what happens with exchange?: works with
cisco but not with iptables!! It's crazy!!!
 
Any ideas?
Thank you for your help
 
Antonio Hi.
 
 
