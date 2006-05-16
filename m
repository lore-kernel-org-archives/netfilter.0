From: Bowie Bailey <Bowie_Bailey@BUC.com>
Subject: iptables and pop3 lockup
Date: Tue, 16 May 2006 12:55:50 -0400
Message-ID: <4766EEE585A6D311ADF500E018C154E302684A19@bnifex.cis.buc.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

I am having a problem implementing iptables with Courier's pop3
server.  If I disable iptables, everything works fine.  As soon as I
enable it, pop3 will stop working for messages over 32K.  Small
messages will go through with no problems, but large ones will time
out.

I get this message from OE: "Your POP3 server has not responded in 60
seconds."  And an option to stop or continue waiting.  I can wait as
long as I want, but it will not download the message.

This problem only exists with connections coming from outside our
network.  Connections from within the network can download large
messages with no problems.

Has anyone seen this before?  I would like to implement iptables for
more security, but I can't do it if this problem persists.

My server is:
    P4 2.8, 1GB RAM
    CentOS 4.3 (fully patched)
    Courier 0.53.1

My iptables rules were initially created with
system-config-securitylevel and then modified from there.  The current
rules are:

Chain INPUT (policy ACCEPT)
 target               prot opt in  out  source     destination
 RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0

Chain FORWARD (policy ACCEPT)
 target               prot opt in  out  source     destination
 RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
 target  prot opt in  out  source         destination

Chain RH-Firewall-1-INPUT (2 references)
 target  prot opt in  out  source         destination
 ACCEPT  all  --  lo  *    0.0.0.0/0      0.0.0.0/0
 ACCEPT  icmp --  *   *    0.0.0.0/0      0.0.0.0/0  icmp type 255
 ACCEPT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  state
RELATED,ESTABLISHED
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:25
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:110
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:53
 ACCEPT  udp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW udp dpt:53
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:587
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:80
 ACCEPT  tcp  --  *   *    172.16.0.0/16  0.0.0.0/0  state NEW tcp dpt:22
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:443
 ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp dpt:995
 REJECT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  reject-with
icmp-host-prohibited

I have found information on Google indicating that this might be a
problem with the MTU or MSS setting, but the solutions given seemed to
be aimed at the end user rather than the server.  I tried them anyway,
but they didn't seem to help.

This is what was generally suggested:

    iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
             -j TCPMSS --clamp-mss-to-pmtu

It didn't get any hits on the FORWARD chain.  I put it on the OUTPUT
chain and it got some hits there, but didn't have any effect on the
problem.  I also tried the --set-mss option with the same lack of
results.

I appreciate any suggestions.

--
Bowie

