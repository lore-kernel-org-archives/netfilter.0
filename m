From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Blocking Netranges Based on IP-to-Country CSV
Date: Thu, 16 Sep 2004 09:33:03 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'McFall, Gary'" <Gary.McFall@dfi.state.wi.us>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


	why do this ?

	seems a bit nasty in nature.

	we dont even do this sort of thing? see email addy...

~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of McFall, Gary
Sent: Wednesday, September 15, 2004 5:58 AM
To: 'netfilter@lists.netfilter.org'
Subject: Blocking Netranges Based on IP-to-Country CSV


Due to a number of issues, my organization is looking at being able to block
certain country domains at the firewall.  To be proactive, we want to
automate that process via iptables & the CSV available at
<http://ip-to-country.webhosting.info <http://ip-to-country.webhosting.info>
>.

We have created a C program (IPCheck) in the /bin directory which, when
given an IP long number, checks the ip-to-country CSV and returns a value
for permit or not.  We want to process the packet based on that return.  

I'm a relative newbie with iptables & scripts.  Listed below is some very
crude code, some of which is a verbal description of intent.  Any
suggestions on how to shore this up so that it will work?  Or should this
concept be a new module in iptables?

#
#    ***** DROP BAD IPS *****
#
/bin/IPCheck `grep -w "SRC =" | cut -d = -f 2`
if return = "Bad IP"
$IPT -A INPUT -$ETH0 $RATELIMIT -j INBADIPS

      ***** RULES - DROP  BAD IPS *****
#    ***** REVIEW LOG AT /var/log/iptables.log *****
#
$IPT -A  INBADIPS -j LOG --log-level debug --log-prefix "BADIP:  " -j DROP

Thanks in advance for your help.

Gary McFall

