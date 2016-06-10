From: alvin.ml@Mail.DDoS-Mitigator.net
Subject: iptables - packets - tarpits
Date: Fri, 10 Jun 2016 09:31:31 -0700
Message-ID: <20160610163131.GA28435@Mail.DDoS-Mitigator.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: alvin.ml@Mail.DDoS-Mitigator.net


hi iptables ML ...

- thought i'd do some double checking:

- lets say, for simplicity, a linux server only has apache on port 80
  and "nothing" else running

- let's assume a 2-line example iptables rules + tarpits installed and working

  iptables -I INPUT -p tcp -d www.example.com --dport 80 -j accept
  #
  # tarpit all other tcp connections
  iptables -I INPUT -p tcp -d www.example.com -j TARPIT

#
# let's send 111 packets, each 1,000 byte packets, at 10 packet/sec 
# directed at the unused SMTP port on the web server
#
attacker# nping -c 111 --data-length 1000 --rate 10 --tcp -p 25 www.example.com

?? =========
?? question:
?? =========
?? "attacker" sends 111 packets to the webserver, but does that also imply
?? there is 111 pending/open tcp connection that has been tarpit'd
??
?? Does each ( 111 ) pending tcp connection on the attacker require the 
?? 2KByte of kernel memory ( 222KB total ) for the 111 tarpit'd open tcp connection ?
??

btw... in the above experiment:

if the attacker is a FreeBSD box, i can still ^C the nping commands and it exits 
which seems contrary to netfilter.org's POM description about not being able
to close the tarpit'd connection

but more importantly, the CPU load on the FreeBSD keeps increasing and increasing
till the FreeBSD backs itself off w/o crashing itself even when FreeBSD is
sending 100,000 packet/sec ( gigabit/sec ) for 5 minutes ... 

btw, i send all kinds of garbage data ( different boxes ) on the local 192.186.x.x iP# 
and sustain the 100% bandwidth consumption for days at a time to see what breaks

---------

?? tarpit's seems to be an effective way to mitigate tcp-based attacks,
?? but i keep wondering which commercial DDoS mitigation products or services
?? uses iptables + tarpits buried under it's "proprietory" ddos mitigation hood

thanx
alvin
#
# DDoS-Mitigator.net == iptables + tarpit 
# DDoS-Simulator.net == nping, hping, etc, etc
#

a> http://www.netfilter.org/projects/patch-o-matic/pom-external.html#pom-external-TARPIT
a> Adds a TARPIT target to iptables, which captures and holds incoming TCP
a> connections using no local per-connection resources.  Connections are
a> accepted, but immediately switched to the persist state (0 byte window), in
a> which the remote side stops sending data and asks to continue every 60-240
a> seconds.  Attempts to close the connection are ignored, forcing the remote
a> side to time out the connection in 12-24 minutes.


