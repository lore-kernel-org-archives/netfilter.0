From: Yan Seiner <yan@seiner.com>
Subject: CONNTRACK and pppoe interfaces - marking does not work
Date: Mon, 1 Aug 2016 16:28:40 -0400
Message-ID: <036276d0-5efe-6c08-5a49-faf6520b195b@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

This is driving me nuts.  I've spent most of the day trying to figure 
out why marking packets does not work.  I've now isolated the problem to 
where I believe that neither MARK nor CONNMARK targets work on a pppoe 
interface.

Here's what I have:

eth0.9 - cable interface with DHCP: xxx.158.166.12
eth0.8 - DSL interface with pppoe: xxx.251.62.82

and here's how I mark them (I've also tried marking on PREROUTING):

iptables -t mangle -A INPUT -i ${dsl_if} -j CONNMARK --set-mark 0x02/0x02
iptables -t mangle -A INPUT -i ${cable_if} -j CONNMARK --set-mark 0x01/0x01

And here's what happens:

root@AP1:~# grep 'dport=23 ' /proc/net/nf_*
/proc/net/nf_conntrack:ipv4     2 tcp      6 58 SYN_RECV 
src=73.81.17.116 dst=xxx.251.62.82 sport=38649 dport=23 packets=1 
bytes=60 src=xxx.251.62.82 dst=73.81.17.116 sport=23 dport=38649 
packets=3 bytes=180 mark=0 use=2
/proc/net/nf_conntrack:ipv4     2 tcp      6 113 TIME_WAIT 
src=73.81.17.116 dst=xxx.158.166.12 sport=33901 dport=23 packets=27 
bytes=4722 src=xxx.158.166.12 dst=73.81.17.116 sport=23 dport=33901 
packets=20 bytes=4322 [ASSURED] mark=1 use=2

So the cable_if is marked as expected, but the DSL interface, with PPPOE 
is not marked.  I've tried the underlying hardware interface, both 
eth0.8 and eth0, and no joy.  Basically it looks like PPPOE is not 
compatible with CONNMARK or MARK.

Can anyone see anything that I am doing wrong?  Or, anything I can check 
or do differently?  Something I need to do when pppoe comes up?

