From: Fabio Muzzi <liste@kurgan.org>
Subject: Re: SNAT seems to "miss" some packets
Date: Mon, 29 Jan 2007 15:16:55 +0100
Message-ID: <1853045878.20070129151655@kurgan.org>
References: <1003211157.20070129141238@kurgan.org>
	<Pine.LNX.4.61.0701291424170.5077@yvahk01.tjqt.qr>
Reply-To: Fabio Muzzi <liste@kurgan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701291424170.5077@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Hello Jan,

Monday, January 29, 2007, 2:24:47 PM, you wrote:

>>iptables -t nat -A POSTROUTING -o eth2  -j SNAT -s 10.0.0.0/16 --to-source 217.221.234.74

JE> Make sure there are no other terminating rules in POSTROUTING that could stop a
JE> packet from reaching this SNAT rule.

No,  the  snat  rule  is  the  FIRST in the postrouting chain. Also I have
noticed  that  maybe i was wrong... I mean, the issue is not with the SNAT
rule, but with a redirect in PREROUTING.

I  have  noticed  now that all of the packets that are not SNATed are FIN,
ACK or RST,ACK packets that go to port 80 on the remote host.

I  have  just  remembered  that I have a PREROUTING rule (the first in the
chain) that does a REDIRECT to a local proxy, like this:

iptables -t nat -A PREROUTING -i eth0 -m state --state new -p tcp --dport 80 -j REDIRECT --to-port 8080

Now,  this  means  that  (I  forgot it even if I have configured it) there
should  be  NO web traffic to be SNATed, because all of the connections to
port 80 go through the proxy.

So,  it  seems  that  somehow  is  the  PREROUTING that fails to catch the
packets,  does  not REDIRECT them to the local proxy, and these packets go
out  of  the  WAN  interface,  where  no  connection  tracking  status  is
registered  for these packets that do not belong to a SNATed connection...
and this is why they do not get SNATed.

So the new question is: why does the REDIRECT rule in prerouting miss some
packets? And why always FIN packets?

Thanks again.


-- 

  Fabio "Kurgan" Muzzi


