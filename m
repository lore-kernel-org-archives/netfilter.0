From: Kirk Reiser <kirk@braille.uwo.ca>
Subject: netfiltering and ethernet bridging doesn't appear to work as
 advertised, help!
Date: Wed, 21 Jan 2004 07:19:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <x7zncha3z2.fsf@speech.braille.uwo.ca>
References: <747032.1074683300483.JavaMail.root@newdil25>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <747032.1074683300483.JavaMail.root@newdil25> (alok shukla's
 message of "Wed, 21 Jan 2004 16:38:20 +0530 (IST)")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Folks:  I am not exactly sure how to relate my problem because it
is partly out of my own confusion after reading the documentation
available to me.

I have set up a box as a firewall/server to the net with two nics in
it.  I have gathered the netfilter/bridging patches from
sourceforge.net and applied them with a fair chunk of hand patching to
linux 2.4.24.  Some documentation seemed to indicate that they weren't
necessary on newer kernels but I couldn't find any solid confirmation
on that.  The site doesn't appear to have been updated or modified
since sometime in late 2002.

After patching it compiled just fine and the actual bridging seems to
be working fine.  I have two nics bridged to one interface br0.  My
problem seems to be with the actual filtering rules.  Although I can
control net flow in and out of the actual box itself I cannot get any
consistant results on controlling traffic into or out of the network.
I amlooking to control traffic in both directions.  I want to stop
incoming traffic on ports I do not aprove of and outgoing traffic from
possibly forged addresses which do not match their mac address from
the internal network.

I have tried using the INPUT and FORWARD chains with no apparent
results on the entire network.  If I use the actual NIC interfaces I
can control traffic to the machine but using the bridged interface
don't have much luck in either case.  The FORWARD chain doesn't seem
to have any affect at all and all the examples I've found use that
chain which is what is making me think it may not be working
correctly.  I have made sure I turned ip_forward on when trying the
FORWARD chain.  I have tried using 0/0 and the actual ip address for rules
to or from and it doesn't seem to make a noticible difference.  Here
is a sample of the rules I am trying:

iptables -A INPUT -s www.xxx.yyy.zzz -m mac --mac-source
xx:xx:xx:xx:... -d 0/0 -j ACCEPT -v
iptables -A INPUT -i $netaddress -s ! my-net-and-mask -d 0/0 -j ACCEPT

I have general purpose drop rules below each of these type statements
to catch non-matches which fall through.  I have replaced INPUT with
FORWARD in the append lines.  I have substituded the gateway machines
address in for the 0/0 component above and I am hopelessly lost
because I see no reason the rules should not work.  I will include the
most recent version of my script below.  The VALIDIP variable
represents lines with an ip address followed by the flags -m mac
--mac-source mac-address.

Did I say that I think most of the documentation out there on this
subject sucks!  They all seem to be long on do as I say and very very
short on why.  Any suggestions would be appreciated 'cause I'm not
sure what else to try. 'grin'

  Kirk

#!/bin/bash
clear
#
#Firewall, Port Filtering, and Port Forwarding Script for Linux Netfilter (IPTABLES)

#Define variables for NICS, IP addresses, and internal hosts we forward to and from
net=eth0
netportsallowed=20,21,22,25,110,113,115,143,220,443,515,873,995,3389
bridge=machine-address
sdc=eth1
sdcaddress=lan-address/24

# Turn on source address verification and spoof protection
  if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]; then
    for F in /proc/sys/net/ipv4/conf/*/rp_filter; do
      echo 1 > $F
    done
  else
  echo "Problem setting up IP Spoofing protection!"
  fi
#Turn on SYN COOKIES PROTECTION Must be enabled in the kernel 
if [ -e /proc/sys/net/ipv4/tcp_syncookies ]
 then
  echo 1 > /proc/sys/net/ipv4/tcp_syncookies
fi

#Flush any previous rules
iptables -F -v
iptables -X  -v

#Default Policies
iptables -P INPUT DROP  # this'll change to DROP later
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# allow connections already established to continue
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT -v

#internal localhost access
iptables -A INPUT -i lo -j ACCEPT -v

#Let's handle SDC side checks.
#if your ip matches your mac you're cool!
while read line; do
   VALIDIP=$(echo $line | sed 's/\n//')
   if [ "$VALIDIP" != "" ] ; then
      iptables -A INPUT -i $sdc -s $VALIDIP -d 0/0 -j ACCEPT -v
   fi
done < /etc/firewall/validips

#You got here we don't know you log and drop
iptables -A INPUT -i $sdc -s $sdcaddress -d 0/0 -j LOG --log-prefix "unknown sdc packets: "
iptables -A INPUT -i $sdc -s $sdcaddress -d 0/0 -j DROP -v


#Okay, let's handle net side packets.
#Some denys, before we open any of the "allow everyone" ports like SMTP
#New, but SYN flag not set? DROP it
iptables -A INPUT -i $net -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "New not syn:"
iptables -A INPUT -i $net -p tcp ! --syn -m state --state NEW -j DROP -v

# Deny the addresses we don't like.
while read line; do
   BADDRESS=$(echo $line |awk ' {print $1 }' | sed 's/#//g')
   if [ "$BADDRESS" != "" ] ; then
      iptables -A INPUT -i $net -s "$BADDRESS" -d 0/0 -j DROP -v
   fi
done < /etc/firewall/baddresses

#individual service drops
#Drop icmp, but only after letting certain types through
iptables -A INPUT -i $net -p icmp --icmp-type 0 -j ACCEPT -v
iptables -A INPUT -i $net -p icmp --icmp-type 3 -j ACCEPT -v
iptables -A INPUT -i $net -p icmp --icmp-type 11 -j ACCEPT -v
iptables -A INPUT -i $net -p icmp --icmp-type 8 -m limit --limit 1/second -j ACCEPT -v
 
#Well, if we got here they've almost made it.
iptables -A INPUT -i $net -p tcp -d 0/0 -s ! $sdcaddress -m multiport --dports $netportsallowed -j ACCEPT -v
iptables -A INPUT -i $net -p udp -d 0/0 -s ! $sdcaddress -m multiport --dports $netportsallowed -j ACCEPT -v

#You got here not good, log and drop.
iptables -A INPUT -i $net -d 0/0 -j LOG --log-prefix "packets unknown: "
iptables -A INPUT -i $net -d 0/0 -s ! $sdcaddress -j DROP -v

-- 

Kirk Reiser				The Computer Braille Facility
e-mail: kirk@braille.uwo.ca		University of Western Ontario
phone: (519) 661-3061

