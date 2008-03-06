From: Georgi Georgiev <chutz@gg3.net>
Subject: PPPoE on a bridge, nat sees bridge as incoming interface
Date: Fri, 7 Mar 2008 02:22:18 +0900
Message-ID: <20080306172218.GA14566@possum.gg3.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,


I am having trouble understaning how bridging and iptables fit together.
The situation that bugs me is: if I do a PPPoE connection over a bridge
with a single physical port, my nat table will see any incoming packet
as coming from the bridge interface, and not the ppp interface. Why?

The issue I have is similar to what this poster
http://marc.info/?l=netfilter&m=120451146916327 but there were no
responses.  If it's something basic, please at least give tell me what
keywords to use as I am having trouble finding anything.

The setup to reproduce this is simple:

modem <-> eth0 <-> pppd (ppp0)

All chains have a single -j LOG rule.
Kernel is 2.6.24.3 with no patches.

I ping myself from a remote host and I get this:

t=mangle c=PREROUTING  IN=ppp0 OUT= MAC= SRC=<remote_IP> DST=<local_IP>
t=nat    c=PREROUTING  IN=ppp0 OUT= MAC= SRC=<remote_IP> DST=<local_IP>
t=mangle c=INPUT       IN=ppp0 OUT= MAC= SRC=<remote_IP> DST=<local_IP>
t=filter c=INPUT       IN=ppp0 OUT= MAC= SRC=<remote_IP> DST=<local_IP>
t=mangle c=OUTPUT      IN=     OUT=ppp0  SRC=<local_IP> DST=<remote_IP>
t=filter c=OUTPUT      IN=     OUT=ppp0  SRC=<local_IP> DST=<remote_IP>
t=mangle c=POSTROUTING IN=     OUT=ppp0  SRC=<local_IP> DST=<remote_IP>

nat sees the ping as coming from ppp0. Good.

Now, I add a bridge and connect eth0 to it.
# brctl add br0
# brctl addif br0 eth0

I connect with pppd in the same way as before (through eth0), ping myself, and
I get what looks like identical output. (Skipping the output)

Now I connect again, but this time pppd uses br0 to get to the internet
and the output becomes:

t=mangle c=PREROUTING  IN=br0 OUT=  PHYSIN=eth0 MAC=<eth0_mac>:<router_mac>:88:64 SRC=<remote_IP> DST=<local_IP>
t=nat    c=PREROUTING  IN=br0 OUT=  PHYSIN=eth0 MAC=<eth0_mac>:<router_mac>:88:64 SRC=<remote_IP> DST=<local_IP>
t=mangle c=INPUT       IN=ppp0 OUT= PHYSIN=eth0 MAC= SRC=<remote_IP> DST=<local_IP>
t=filter c=INPUT       IN=ppp0 OUT= PHYSIN=eth0 MAC= SRC=<remote_IP> DST=<local_IP>
t=mangle c=OUTPUT      IN= OUT=ppp0 SRC=<local_IP> DST=<remote_IP>
t=filter c=OUTPUT      IN= OUT=ppp0 SRC=<local_IP> DST=<remote_IP>
t=mangle c=POSTROUTING IN= OUT=ppp0 SRC=<local_IP> DST=<remote_IP>

As you can see, the nat table sees the incoming packet as coming from
the bridge itself and from the ppp interface. Why is that?

The implication of this is that I cannot choose my DNAT rules based on
the incoming (ppp) interface (which  I can easily do if I don't connect
pppd to a bridge).

-- 
()   Georgi Georgiev   () I am having FUN... I wonder if it's NET    ()
()    chutz@gg3.net    () FUN or GROSS FUN?                          ()
() http://www.gg3.net/ ()                                            ()
