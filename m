From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: Netfilter and Poptop ( and stuff ... )
Date: Mon, 10 Oct 2005 08:28:37 +0200
Message-ID: <36427.1692502827$1128925841@news.gmane.org>
Reply-To: edvin.seferovic@kolp.at
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
To: netfilter@lists.netfilter.org, poptop-server@lists.sourceforge.net

Hi,

 

first of all - excuse me for mailing this to two mailing lists at once, but
I am hoping to get more answers from your experience with poptop and
netfilter. 

 

Here is my situation - I've configured a gateway with poptop ( which uses
RADIUS for auth/acct - which again uses LDAP as auth-backend and mySQL for
accounting ). This gateway has 2 internal and one external interface ( with
public routeable IP address ). One internal interface is used to build a
restricted network for unknown machines, and the second one is used as a
gateway for the known machines. Now - I would like allow my VPN users
internet access, but not to all machines on the internal network. So I have
to use NAT on the tunnel endpoints ( ppp+ interfaces ), right? 

 

I wanted to make this easy as possible, but as always - I took the wrong
turn... probably by choosing Firewall Builder to help me get my firewall set
up. I achived everything, but I cannot configure ppp+ interfaces in
FW-Builder? Does anyone has a hint for me? Is this possible anyway ( please
don't tell me I have to configure 150 ppp interfaces in FW-Builder ) ??? 

 

I suppose it would be more secure to enter a firewall rule every time a ppp
interface comes up ( by using scripts like ip-up from pppd )? Do I have to
enter a NAT rule for each interface then? Any performance thought when
having 150+ interfaces at the same time? 

 

Nevertheless I would also like to redirect http traffic going from a NATed
ppp+ interface to my squid process - how does this combined rule looks like?


 

Sorry for this huge eMail, and amateur questions.. I hope at least a few of
the gurus out there will be able and willing to help me out...

 

Thank You in advance !

 

Regards,

 

Edvin Seferovic

 

 

 

