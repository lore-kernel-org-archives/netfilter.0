From: "Peter Marshall" <peter.marshall@caris.com>
Subject: vpn
Date: Tue, 14 Sep 2004 10:46:14 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
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

I need to set up a vpn.  I am trying to figure out which would be best.  I
need to connect my office with a sister office.  The employess are using
windows machines.  They want to be able to get and put files from a windos
file server. Windows networking would be a bonus.  Both offices have Linux
firewalls.    Would ssh over a PPP tunnel work for this ?  Would pptp or
cIPe be a better solution ?

I have my network setup below ... I was also wondering if it would be better
to put the vpn server either behind the internal firewall, or in the dmz, or
make it part of the internal firewall

my network in a nutshell.
I have an internal network with an internal firewall.  I have an external
network with an external firewall, and a dmz, between the internal and the
external firewall.  All numbers in the dmz are internet routable (They have
their own /26 network).  The external firewall has a 29 subnet on it's
external interface.

thanks for the help.

Peter



Peter Marshall, BCS
Network Administrator, CARIS
115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
Phone:  (506) 458-8533 (Reception)


