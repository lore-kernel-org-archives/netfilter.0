From: "Ryan Belcher" <Ryanb@sealevel.com>
Subject: iptables REJECT NAT Internal -> External Portrange
Date: Wed, 27 Sep 2006 12:11:05 -0400
Message-ID: <4F7EDC4D48D076428187517D1D77B017239AA5@mercury.int.sealevel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi All,

I'm trying to set up a rule that will send an icmp-host-unreachable (or =
similar) back to the local machine (inside the NAT) if they try to =
connect to an external host on a specified port range.

I know I'm missing something obvious, but I can't seem to figure out =
what I'm missing.

iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 10000:11000 -j =
REJECT --reject-with icmp-host-unreachable

The above command returns with "Invalid Argument".

If I simply replace "-j REJECT --reject-with icmp-host-unreachabel" with =
"-j DROP" iptables accepts it.

What am I missing?

TIA!

Ryan



