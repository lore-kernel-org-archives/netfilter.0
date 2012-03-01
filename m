From: jonetsu <jonetsu@teksavvy.com>
Subject: ip_conntrack_icmp_timeout now taking effect
Date: Thu, 1 Mar 2012 08:39:08 -0500
Message-ID: <20120301083908.7646c423@mistral.stie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

  I noticed that in both kernel versions 2.6.26 and 3.0 that the value
of ip_conntrack_icmp_timeout is by default 30.  However when setting up
the most simple firewall with a policy of DROPing everything, that a
continuous remote ping that was started right before setting up the
firewall will continue with kernel 3.0 whereas with kernel 2.6.26 it
will be stopped as soon as the firewall is established.  No flushing of
tables is done prior to setting up the simple test firewall in both
cases. The unit booted with no firewall, all in ACCEPT, before these
tests were made.

  This is quite a change of behaviour.  Flushing everything before
establishing the firewall solves the problem but is not the best
solution as it is possible to remotely be ssh-logged on the unit to make
firewall changes.  Flushing everything would mean that any error made
while setting the firewall could cut off the remote ssh session, and
could prevent establishing a new one.

  Having a value of 1 in ip_conntrack_icmp_timeout stops the continuous
pings when establishing the firewall but this can very likely have
negative effects when pinging under normal circumstances on a slow
connection.

  What is there to do to be able to stop pings as soon as the firewall
is set up while keeping the now-observed icmp conntrack timeout ?  Is
it possible to selectively flush only the ICMP connection tracking
table ?

  Any suggestions greatly appreciated, thanks.

