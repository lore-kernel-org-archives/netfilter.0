From: Ajit K Jena <ajit@iitb.ac.in>
Subject: Strange problems on iptables (FC17) .... need your help
Date: Wed, 03 Oct 2012 23:58:05 +0530
Message-ID: <1349288885.6825.9.camel@indica.cc.iitb.ac.in>
Reply-To: ajit@iitb.ac.in
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Dear Listmembers,

I have a working firewall based on iptables v1.4.4 and iproute-2.6.26
on a FC10 system. I am trying to migrate to a FC17 system that has
iptables v1.4.12.2 and iproute-3.3.0 installed on it. The firewall
does not work on the new setup. I wish to explain with the following
simple set of rules:

# The following is to just produce a log of all outgoing packets from
# IPs that are members in the set src_nm_set.
# The set has only one member with IP 10.209.13.6.

-A FORWARD -p tcp -m set --match-set src_nm_set src \
        -m multiport --dports 80:64000 -j LOG --log-level 4 --log-prefix
"nm_http_outword: "

# The following is to just produce a log of all incoming packets
-A FORWARD -p tcp -m set --match-set src_nm_set dst \
        -m multiport --sports 80:64000 -j LOG --log-level 4 --log-prefix
"nm_http_inword: "


# Forward all packets to dst port 80:64000 from the set members.
-A FORWARD -p tcp -m set --match-set src_nm_set src \
        -m multiport --dports 80:64000 -j ACCEPT

# Forward all packets from src port 80:64000 to the appropriate set
# member. The packet should go to the proper set member using the
# conntrack table. In any case we have only one set member and so
# the one-to-many mapping issue should not arise.

-A FORWARD -p tcp -m set --match-set src_nm_set dst \
        -m multiport --sports 80:64000 -j ACCEPT

# Source NAT the connections to public IP 59.162.23.79

-t nat -A POSTROUTING -p tcp -m set --match-set src_nm_set src \
        -m multiport --dports 80:64000 -j SNAT --to 59.162.23.79

# Since we have multiple links, we "MARK" the packet so that it goes
# out on a particular WAN link. We use iproute2 rules and multiple 
# routing tables to achieve that.

--table mangle --append PREROUTING -p all -m set --match-set src_nm_set
src \
        ! -d 10.0.0.0/8 -j MARK --set-mark 204

Observed Scenario:

  a) Packets go out on the designated interface. The "outward" log entry
     is produced in the logfile.

  b) Reply packet (i.e. the TCP connection reply with SYN bit ON) is
also
     received. I can see that using tcpdump on the designated interface.

  c) The "inward" log entry is **NOT** produced in the logfile.

  d) It appears as if the packet is simply dropped.

Questions:

  Is there anything wrong in my ruleset ? This is perplexing as it
  is working perfectly on the FC10 system.

  Now I have also tried another FC11 setup and even that shows
  results identical to FC17. What has changed between FC10 and
  FC17 (or for that matter FC11) to cause this behavior ?

  How do I go about debugging this further ?

Thanks for your time. Pl do send me your ideas/suggestions. 

--ajit



