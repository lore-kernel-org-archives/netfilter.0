From: Bowie Bailey <Bowie_Bailey@BUC.com>
Subject: RE: iptables and pop3 lockup
Date: Tue, 16 May 2006 15:13:22 -0400
Message-ID: <4766EEE585A6D311ADF500E018C154E302684A1D@bnifex.cis.buc.com>
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

Gary W. Smith wrote:
> Bowie Bailey wrote:
> > I am having a problem implementing iptables with Courier's pop3
> > server.  If I disable iptables, everything works fine.  As soon as I
> > enable it, pop3 will stop working for messages over 32K.  Small
> > messages will go through with no problems, but large ones will time
> > out. 
> > 
> > This problem only exists with connections coming from outside our
> > network.  Connections from within the network can download large
> > messages with no problems. 
> > 
> > My server is:
> >     P4 2.8, 1GB RAM
> >     CentOS 4.3 (fully patched)
> >     Courier 0.53.1
> > 
> > The current rules are: 
> > 
> > Chain INPUT (policy ACCEPT)
> >  target               prot opt in  out  source     destination
> >  RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0
> > 
> > Chain FORWARD (policy ACCEPT)
> >  target               prot opt in  out  source     destination
> >  RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0
> > 
> > Chain OUTPUT (policy ACCEPT)
> >  target  prot opt in  out  source         destination
> > 
> > Chain RH-Firewall-1-INPUT (2 references)
> >  target  prot opt in  out  source         destination
> >  ACCEPT  all  --  lo  *    0.0.0.0/0      0.0.0.0/0
> >  ACCEPT  icmp --  *   *    0.0.0.0/0      0.0.0.0/0  icmp type 255
> >  ACCEPT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  state
RELATED,ESTABLISHED
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:25 
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:110
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:53 
> >  ACCEPT  udp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW udp
dpt:53
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:587
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:80 
> >  ACCEPT  tcp  --  *   *    172.16.0.0/16  0.0.0.0/0  state NEW tcp
dpt:22 
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:443 
> >  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:995 
> >  REJECT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  reject-with
icmp-host-prohibited  
> > 
> > I have found information on Google indicating that this might be a
> > problem with the MTU or MSS setting, but the solutions given seemed
> > to be aimed at the end user rather than the server.  I tried them
> > anyway, but they didn't seem to help. 
> > 
> > This is what was generally suggested:
> > 
> >     iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
> >              -j TCPMSS --clamp-mss-to-pmtu
> > 
> > It didn't get any hits on the FORWARD chain.  I put it on the OUTPUT
> > chain and it got some hits there, but didn't have any effect on the
> > problem.  I also tried the --set-mss option with the same lack of
> > results. 
> > 
> > I appreciate any suggestions.
> 
> Um, have you tried adding a log statement before the drop to see what
> is being caught?
> 
> Try adding the following right before the reject rule.
> 
> -A RH-Firewall-1-INPUT -j LOG --log-prefix "FIREWALL: " --log-level 1
> 
> Then tail the log while trying to make a pop3 connection to it.

I added the logging rule and tried again.  A small message went
through with nothing logged.  A larger messages produced this in the
logs before my mail client gave up:

May 16 14:49:28 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=18103 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:28 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=18359 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:28 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=18615 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:29 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=60 TOS=0x00 PREC=0x00 TTL=110 ID=18871 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:29 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=19127 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:30 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=19383 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:32 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=19639 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:36 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=19895 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:43 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=20151 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:49:58 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=20407 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0
May 16 14:50:29 bnofmail kernel: FIREWALL: IN=eth0 OUT=
MAC=00:50:8d:59:60:2e:00:90:27:c2:79:77:08:00 SRC=70.156.232.189
DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00 TTL=110 ID=23735 DF PROTO=TCP
SPT=1867 DPT=110 WINDOW=8280 RES=0x00 ACK URGP=0

It seems like iptables is losing the connection between the packets
and the open connection.

-- 
Bowie

