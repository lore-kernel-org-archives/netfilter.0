From: alex <alex@bennee.com>
Subject: Problem with masqurading "long" connections.
Date: 06 Nov 2002 22:22:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036621365.2727.44.camel@trent.nin>
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
To: netfilter@lists.netfilter.org

Hi,

I've been tearing my hair out with this problem so I'm turning to the
list for help. The problem in a nut shell is that with my latest
firewall script if an outside user requests a short web page (~1000
bytes) it gets sent through the firewall, a long one (page+graphics) and
the connection hangs. I can cause a similar hang if I ssh into the
webserver box and do a ps ax (hangs after about 10 lines of output).

Background

I'm running the firewall on a dedicated linux PC (2.4.19, Mandrake 9.0,
iptables 1.2.6a) which is doing normal masqurading for outgoin LAN
traffic as well as port forwarding several ports to various internal
machines. The webserver is apache running on Debian 3.0 (2.2.20 kernel)

The (abridged) working script (1.9) - (see
http://www.bennee.com/cgi-bin/cvsweb/src/scripts/iptables_firewall?rev=1.9&content-type=text/x-cvsweb-markup for the ful version)

   # Setup NAT (Masquerading, special case for dynamic IP's)
   /sbin/iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
    # Remap NAT'ed ports to be from gateway (so I can access from LAN)
    /sbin/iptables -t nat -A POSTROUTING -d $ZHEER -s $INTNET -p tcp
--dport 80 -j SNAT --to $INTIP
    /sbin/iptables -t nat -A POSTROUTING -d $ZHEER -s $INTNET -p tcp
--dport 443 -j SNAT --to $INTIP
    # Setup incomming port forwarding for our public services
    # Web (http and https)
    /sbin/iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 80 -j
DNAT --to $ZHEER:80
    /sbin/iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 443 -j
DNAT --to $ZHEER:443
    # Secure shell
    /sbin/iptables -t nat -A PREROUTING -i $EXTIF -p tcp --dport 24 -j
DNAT --to $ZHEER:22
    # FORWARD is used for NAT stuff - careful not to kill it
    /sbin/iptables -P FORWARD ACCEPT
    # Forwarding rules. Allow our external services access but not much
else
    # Allow access to web/secure web/smtp (remember the destination is
now translated)
    /sbin/iptables -A FORWARD -d $ZHEER -p tcp --dport 22 -j ACCEPT
    /sbin/iptables -A FORWARD -d $ZHEER -p tcp --dport 80 -j ACCEPT
    /sbin/iptables -A FORWARD -d $ZHEER -p tcp --dport 443 -j ACCEPT
    # tighten up some forwarding rules
    /sbin/iptables -A FORWARD -i $EXTIF -s $INTNET -m limit -j LOG
--log-prefix "[Spoofed packets from $EXTIF]"
    # and for the time being ACCEPT everything else (will tighten up
later)
    /sbin/iptables -A FORWARD -j ACCEPT

The (abridged) "failing" script (1.14) - ( see
http://www.bennee.com/cgi-bin/cvsweb/src/scripts/iptables_firewall?rev=1.14&content-type=text/x-cvsweb-markup for full version)

    # Setup incomming port forwarding for our public services - note
these rules are hit once
    # for any incomming connection. Once matched the connection is dealt
with by the FORWARD rules(?)
    # *NO* filtering should happen here, just DNAT stuff
    # Web (http and https)
    /sbin/iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 80 -j
DNAT --to $ZHEER:80
    /sbin/iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 443 -j
DNAT --to $ZHEER:443
    # allow internal boxes to get mapped to these ports too
    
    # Secure shell - port 24 is no real protection but it may put of the
odd script kidde
    /sbin/iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 24 -j
DNAT --to $ZHEER:22
    # FORWARD is used for NAT/MASQ stuff - anything thats not destined
for this machine
    /sbin/iptables -P FORWARD DROP
   
    # Now create some forwarding chains
    /sbin/iptables -N fw-to-lan
    /sbin/iptables -N fw-to-inet

    # Forwarding rules. Allow our external services access but not much
else
    # Allow access to web/secure web/smtp/ssh on zheer (remember the
destination is now translated)
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 22 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 80 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 443 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -m state --state
ESTABLISHED,RELATED -j ACCEPT

    # ESTABLISHED and RELATED connections allowed through as well
    /sbin/iptables -A fw-to-lan -d $INTNET -m state --state
ESTABLISHED,RELATED -j ACCEPT
    # Log any spoofed packets
    /sbin/iptables -A fw-to-lan -s $INTNET -m limit -j LOG --log-prefix
"[Spoofed packets from $EXTIF]"
    # and anything INVALID should get dropped
    /sbin/iptables -A fw-to-lan -d $INTNET -m state --state INVALID -j
DROP
    
    # Dump everything else
    /sbin/iptables -A fw-to-lan -j DROP
    # enable
    /sbin/iptables -A FORWARD -o $INTIF -j fw-to-lan
    
    # Forwarding rules for outgoing connections - split to make
debugging easier for now
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 22 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 25 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 80 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 443 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -j ACCEPT
    # and everyone else
    /sbin/iptables -A fw-to-inet -j ACCEPT
    # enable
    /sbin/iptables -A FORWARD -o $EXTIF -j fw-to-inet
    
    # Log anything else
    /sbin/iptables -A FORWARD -m limit -j LOG --log-prefix "[Packet lost
forwarding]"

    echo " setting up outgoing NAT (Masq)";
    # Setup NAT (Masquerading, special case for dynamic IP's) for all
outgoing connections
    /sbin/iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

    # Remap NAT'ed ports to be from gateway (so I can access bennee.com
from LAN)
    /sbin/iptables -t nat -A POSTROUTING -d $ZHEER -s $INTNET -p tcp
--dport 80 -j SNAT --to $INTIP
    /sbin/iptables -t nat -A POSTROUTING -d $ZHEER -s $INTNET -p tcp
--dport 443 -j SNAT --to $INTIP


Why I am so confused

I've reviewed the changes I've made carefully for the last few days and
I can't see whats going wrong. I wrote the dumpnat function in the
script to see what was happening to the NAT/FORWARD tables in the
failure case and I can see packets stop crossing the firewall but I'm
not seeing the FORWARD DROP count go up, infact I can't see any of the
DROP counters going up, even though a tcpdump on the webserver says that
retry packets are still being sent out - until the webserver eventually
gives up. As far as I understand the way NAT should work is the first
incomming packet goes through PREROUTING and once thats accepted as long
as the FORWARD rules don't filter anything out, and as you can see by
outgoing chain "fw-to-inet" actually acepts evrything.

HELP! I'm slowly going insane with this particular one.

-- 
Alex@Bennee.com
http://www.bennee.com/~alex/


