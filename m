From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: Iptables on Redhat 7.3
Date: 20 Mar 2003 09:21:09 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048173669.1320.17.camel@bordercollie>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

I am implementing iptables on 2 Redhat 7.3 boxes, one a WEB server and
one a FTP server.  Both are running the latest Redhat kernel for
7.3,Linux version 2.4.18-27.7.xsmp.  Both are dual processor boxes.  I
setup iptables by adding rules to the INPUT chain (single NIC, no
routing) to accept the connections I wanted, and had a log rule at the
end to see what made it past the accepts.  Once I was not getting any
logs I assumed I had written the rules to accept all connections I
wanted and put a DROP policy in effect for INPUT.  For the WEB server it
worked, for a while.  For the FTP server as soon as I changed the policy
iptables --list got REALLY slow.  There are only 10-12 rules, iptables
--list took 10-15 seconds per line to list them.  Also some connections
were refused, but not logged (the log rule is still there).  Changing
the policy to accept fixed the problem.  After a reboot the ftp server
is working with policy DROP, but after a reboot to update the WEB server
last night (with policy DROP) sendmail stopped working.   There is
nothing in the logs from iptables about packets getting past the ACCEPT
rules for sendmail, but the connection is not made (sendmail 8.11.6). 
Sendmail is in queue mode and should make only outgoing connections
which have no rules and an ACCEPT policy.  When I change the INPUT
policy back to ACCEPT sendmail starts sending mail to the relay host. 
What is going on here?  Is changing the policy to DROP not a good way to
do this?  This is frustrating as the logs seem to show everything OK,
but the policy change causes problems.
-- 
Chris D. Garringer
Toshiba International
LAN/WAN Supervisor
713-466-0277 x3756
Certified Solaris Administrator
Microsoft Certified Engineer (NT)
RedHat Certified Engineer


