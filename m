From: Gary & Mic McFall <nutbrownhares@tds.net>
Subject: Blocking Netranges Based on IP-to-Country CSV
Date: Wed, 15 Sep 2004 18:41:41 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095291700.2828.3.camel@localhost.localdomain>
Reply-To: nutbrownhares@tds.net
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

Due to a number of issues, my organization is reviewing the ability to
block certain country domains at the firewall.  To be proactive, we want
to automate that process via iptables & the CSV available at
<http://ip-to-country.webhosting.info>.

We have created a C program (IPCheck) in the /bin directory which, when
given an IP long number, checks the ip-to-country CSV and returns a
value for permit or not.  We want to process the packet based on that
return.  

I'm a relative newbie with iptables & scripts.  Listed below is some
very crude code, some of which is a verbal description of intent.  Any
suggestions on how to shore this up so that it will work?  Or should
this concept be a new module in iptables?

#
#    ***** DROP BAD IPS *****
#
/bin/IPCheck `grep -w "SRC =" | cut -d = -f 2`
if return = "Bad IP"
$IPT -A INPUT -$ETH0 $RATELIMIT -j INBADIPS

      ***** RULES - DROP  BAD IPS *****
#    ***** REVIEW LOG AT /var/log/iptables.log *****
#
$IPT -A  INBADIPS -j LOG --log-level debug --log-prefix "BADIP:  " -j
DROP

Thanks in advance for your help.

Gary McFall
