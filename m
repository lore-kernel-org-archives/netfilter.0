From: "Eric B." <ebenze@hotmail.com>
Subject: Packets not traversing the POSTROUTING table?
Date: Mon, 7 Apr 2008 23:27:24 -0400
Message-ID: <fteoq6$ipr$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm running into a strange issue here.  I'm not sure if I have done
something wrong, or if am simply misunderstanding things.

I have added a very simple rule in my POSTROUTING nat table to log all
packets, but the packets I am looking to find don't show up in my log file.
If I initiate the packets from the machine itself, (eg: ping www.yahoo.com),
then I see those packets show up.  However, if the machine is simply
responding to packets from another machine (ex: ping 192.168.101.64 from
another computer), they don't show up in the POSTROUTING table.  I'll see
the packets show up in the log statement from the OUTPUT filter table, but
not in the POSTROUTING nat table.

I was under the impression/understanding that all packets travel through the
POSTROUTING nat table.  Is this incorrect?  Do they only traverse that table
under special circumstances?  Do response packets not traverse the
POSTROUTING table?

# iptables -F
# iptables -t nat -I POSTROUTING -j LOG --log-prefix "POSTROUTE"
# iptables -I OUTPUT -j LOG --log-prefix "OUTPUT"

I've taken a look at http://www.docum.org/docum.org/kptd/ and from what I
can tell, all packets are supposed to traverse the POSTROUTING table...   Am
I missing something obvious here?

From what someone on the comp.os.linux.networking group told me, only the 
nat tables only see the first new packet of every connection, but since ICMP 
is connectionless, does that not mean that every new ping would have to 
travel through the nat table chains?  I added a log rule in the PREROUTE nat 
table and see all the incoming ICMP ping requests; just absolutely nothing 
in the POSTROUTE nat table....

I'm running RHEL 4.2, kernel 2.6.9-67.0.4.ELsmp.

Any help would greatly be appreciated!

Thanks!

Eric



