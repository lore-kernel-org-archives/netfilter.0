From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Any holes in this firewall script?
Date: 04 Jun 2003 10:30:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054702862.2273.6.camel@india>
References: <20030603180849.B2402@gateway.junsun.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zHdqc04kJKxeXEfl5XAw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030603180849.B2402@gateway.junsun.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jun Sun <jsun@junsun.net>
Cc: netfilter@lists.netfilter.org


--=-zHdqc04kJKxeXEfl5XAw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

 I just don't see any firewalling (blocking) in the script. You are
simply allowing everything. Define clear rule like block all and allow
only wanted ports.

Regards
Dharmu
On Wed, 2003-06-04 at 06:38, Jun Sun wrote:

    Hi,
    
    I have a pretty standard setup.  A linux gateway connects to Internet 
    through cable modem and a subnet behind it.  I run web server, sendmail 
    and sshd on the gateway machine.
    
    So far I have been using ipchains and it seems to be OK so far.
    I now want to move to redhat 9 and I probably have to use iptables. 
    After looking around the net, I come up with the following firewall 
    rules.  See the attachment.
    
    I wonder if some security experts here can take a look, just to make sure 
    there are no obvious mistakes or holes? 
    
    Thanks in advanced.
    
    Cheers.
    
    Jun

    
    ____________________________________________________________________
    

    #!/bin/sh
    #
    # rc.firewall - Initial SIMPLE IP Firewall script for Linux 2.4.x and iptables
    #
    # Copyright (C) 2001  Oskar Andreasson &lt;bluefluxATkoffeinDOTnet&gt;
    #
    
    # JSUN :
    # 	I like all allowed ports to be grouped together, easier to modify
    #	later
    #
    
    ###########################################################################
    #
    # 1. Configuration options.
    #
    
    # debugs
    set -x
    DEBUG_LEVEL=INFO
    # $DEBUG_LEVEL_LEVEL=DEBUG
    
    # interfaces
    EXTIF="eth0"
    EXTIP=`ifconfig $EXTIF | awk '/inet addr/ { gsub(".*:", "", $2) ; print $2 }'`
    EXTBROAD=`ifconfig $EXTIF | awk '/inet addr/ { gsub(".*:", "", $3) ; print $3
    }'`
    EXTGW=`/sbin/route -n | grep -A 4 UG | awk '{ print $2}'`
    
    echo External IP: $EXTIP
    echo External broadcast: $EXTBROAD
    echo Default GW: $EXTGW
    echo " --- "
    
    INTIP="192.168.0.2"
    INTLAN="192.168.0.0/16"
    #INTIF="eth1"
    INTIF="wlan0"
    
    echo Internal Interface: $INTIF
    echo Internal IP: $INTIP
    echo Internal LAN: $INTLAN
    echo " --- "
    
    LOIF="lo"
    LOIP="127.0.0.1"
    
    BROADCAST="255.255.255.255"
    
    #
    # 1.5 IPTables Configuration.
    #
    
    IPTABLES="/sbin/iptables"
    
    
    # JSUN: are these necessary?
    
    # /sbin/depmod -a
    
    # /sbin/modprobe ip_tables
    # /sbin/modprobe ip_conntrack
    # /sbin/modprobe iptable_filter
    # /sbin/modprobe iptable_mangle
    # /sbin/modprobe iptable_nat
    # /sbin/modprobe ipt_LOG
    # /sbin/modprobe ipt_limit
    # /sbin/modprobe ipt_state
    
    #/sbin/modprobe ipt_owner
    #/sbin/modprobe ipt_REJECT
    #/sbin/modprobe ipt_MASQUERADE
    #/sbin/modprobe ip_conntrack_ftp
    #/sbin/modprobe ip_conntrack_irc
    #/sbin/modprobe ip_nat_ftp
    #/sbin/modprobe ip_nat_irc
    
    ###########################################################################
    #
    # 3. /proc set up.
    #
    
    #
    # 3.1 Required proc configuration
    #
    
    echo "1" > /proc/sys/net/ipv4/ip_forward
    
    #
    # 3.2 Non-Required proc configuration
    #
    
    #echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
    #echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
    #echo "1" > /proc/sys/net/ipv4/ip_dynaddr
    
    ###########################################################################
    #
    # 4. rules set up.
    #
    
    #
    # Cleanup and set initial policies
    #
    
    # Set policies
    $IPTABLES -t filter -P INPUT DROP
    $IPTABLES -t filter -P OUTPUT DROP
    $IPTABLES -t filter -P FORWARD DROP
    
    $IPTABLES -t nat -P PREROUTING ACCEPT
    $IPTABLES -t nat -P POSTROUTING ACCEPT
    $IPTABLES -t nat -P OUTPUT ACCEPT
    
    $IPTABLES -t mangle -P PREROUTING ACCEPT
    $IPTABLES -t mangle -P OUTPUT ACCEPT
    
    # flush old chains
    $IPTABLES -t filter -F
    $IPTABLES -t nat -F
    $IPTABLES -t mangle -F
    
    # delete user defined chains
    $IPTABLES -t filter -X
    $IPTABLES -t nat -X
    $IPTABLES -t mangle -X
    
    
    #
    # 4.1.4 INPUT chain
    #
    
    # $IPTABLES -A INPUT -p tcp -j bad_tcp_packets
    
    # we trust INTIF and LOIF, to a large degree
    $IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT
    $IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT
    
    # we take broadcast packages from INTIF
    $IPTABLES -A INPUT -p ALL -i $INTIF -s 0.0.0.0 -d 255.255.255.255 -j ACCEPT
    
    # JSUN: can we just use a simplified version?
    #$IPTABLES -A INPUT -p ALL -i $INTIF -j ACCEPT
    #$IPTABLES -A INPUT -p ALL -i $LOIF -j ACCEPT
    
    
    # established connections can go through
    $IPTABLES -A INPUT -p ALL -d $EXTIP -m state --state ESTABLISHED,RELATED \
    	-j ACCEPT
    
    # initiation packets are allowed on selected TCP ports
    $IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport ssh -j ACCEPT
    $IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport smtp -j ACCEPT
    $IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport http -j ACCEPT
    #$IPTABLES -A INPUT -p TCP --sync -s 0/0 --dport https -j allowed
    
    # JSUN: do we need to worry about ntp port?  We will see
    
    # only take echo-request(8), echo-reply(0) and time-exceeded(11) for icmp
    $IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-reply -j ACCEPT
    $IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-request -j ACCEPT
    $IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type time-exceeded -j ACCEPT
    
    #
    # If you have a Microsoft Network on the outside of your firewall, you may 
    # also get flooded by Multicasts. We drop them so we do not get flooded by 
    # logs
    #
    #$IPTABLES -A INPUT -i $EXTIF -d 224.0.0.0/8 -j DROP
    
    #
    # Log weird packets that don't match the above.
    #
    
    # exclude some annoying packets from logging
    $IPTABLES -A INPUT -d $EXTBROAD -j DROP 
    $IPTABLES -A INPUT -d $BROADCAST -j DROP 
    
    $IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
    	--log-level $DEBUG_LEVEL --log-prefix "IPT INPUT packet died: "
    
    #
    # 4.1.5 FORWARD chain
    #
    
    # Accept the packets we actually want to forward
    $IPTABLES -A FORWARD -i $INTIF -j ACCEPT
    $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    
    # Log weird packets that don't match the above.
    $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
    	--log-level $DEBUG_LEVEL --log-prefix "IPT FORWARD packet died: "
    
    #
    # 4.1.6 OUTPUT chain
    #
    
    # Special OUTPUT rules to decide which IP's to allow.
    $IPTABLES -A OUTPUT -p ALL -s $LOIP -j ACCEPT
    $IPTABLES -A OUTPUT -p ALL -s $INTIP -j ACCEPT
    $IPTABLES -A OUTPUT -p ALL -s $EXTIP -j ACCEPT
    
    # Log weird packets that don't match the above.
    $IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
    	--log-level $DEBUG_LEVEL --log-prefix "IPT OUTPUT packet died: "
    
    ######
    # 4.2 nat table
    #
    
    $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP

-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-zHdqc04kJKxeXEfl5XAw
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
hi,
<BR>

<BR>
 I just don't see any firewalling (blocking) in the script. You are simply allowing everything. Define clear rule like block all and allow only wanted ports.
<BR>

<BR>
Regards
<BR>
Dharmu
<BR>
On Wed, 2003-06-04 at 06:38, Jun Sun wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I have a pretty standard setup.  A linux gateway connects to Internet </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>through cable modem and a subnet behind it.  I run web server, sendmail </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>and sshd on the gateway machine.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>So far I have been using ipchains and it seems to be OK so far.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I now want to move to redhat 9 and I probably have to use iptables. </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>After looking around the net, I come up with the following firewall </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>rules.  See the attachment.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I wonder if some security experts here can take a look, just to make sure </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>there are no obvious mistakes or holes? </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Thanks in advanced.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Cheers.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Jun</FONT></FONT></I></PRE>
    
<HR>

    <BR>
    <FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>#!/bin/sh</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># rc.firewall - Initial SIMPLE IP Firewall script for Linux 2.4.x and iptables</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Copyright (C) 2001  Oskar Andreasson &amp;lt;bluefluxATkoffeinDOTnet&amp;gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># JSUN :</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 	I like all allowed ports to be grouped together, easier to modify</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#	later</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>###########################################################################</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 1. Configuration options.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># debugs</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>set -x</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>DEBUG_LEVEL=INFO</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># $DEBUG_LEVEL_LEVEL=DEBUG</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># interfaces</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>EXTIF=&quot;eth0&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>EXTIP=`ifconfig $EXTIF | awk '/inet addr/ { gsub(&quot;.*:&quot;, &quot;&quot;, $2) ; print $2 }'`</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>EXTBROAD=`ifconfig $EXTIF | awk '/inet addr/ { gsub(&quot;.*:&quot;, &quot;&quot;, $3) ; print $3</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>}'`</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>EXTGW=`/sbin/route -n | grep -A 4 UG | awk '{ print $2}'`</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo External IP: $EXTIP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo External broadcast: $EXTBROAD</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo Default GW: $EXTGW</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo &quot; --- &quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>INTIP=&quot;192.168.0.2&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>INTLAN=&quot;192.168.0.0/16&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#INTIF=&quot;eth1&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>INTIF=&quot;wlan0&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo Internal Interface: $INTIF</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo Internal IP: $INTIP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo Internal LAN: $INTLAN</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo &quot; --- &quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>LOIF=&quot;lo&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>LOIP=&quot;127.0.0.1&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>BROADCAST=&quot;255.255.255.255&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 1.5 IPTables Configuration.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IPTABLES=&quot;/sbin/iptables&quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># JSUN: are these necessary?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/depmod -a</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe ip_tables</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe ip_conntrack</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe iptable_filter</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe iptable_mangle</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe iptable_nat</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe ipt_LOG</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe ipt_limit</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># /sbin/modprobe ipt_state</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ipt_owner</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ipt_REJECT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ipt_MASQUERADE</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ip_conntrack_ftp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ip_conntrack_irc</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ip_nat_ftp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#/sbin/modprobe ip_nat_irc</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>###########################################################################</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 3. /proc set up.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 3.1 Required proc configuration</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>echo &quot;1&quot; &gt; /proc/sys/net/ipv4/ip_forward</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 3.2 Non-Required proc configuration</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#echo &quot;1&quot; &gt; /proc/sys/net/ipv4/conf/all/rp_filter</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#echo &quot;1&quot; &gt; /proc/sys/net/ipv4/conf/all/proxy_arp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#echo &quot;1&quot; &gt; /proc/sys/net/ipv4/ip_dynaddr</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>###########################################################################</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 4. rules set up.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Cleanup and set initial policies</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Set policies</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t filter -P INPUT DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t filter -P OUTPUT DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t filter -P FORWARD DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -P PREROUTING ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -P POSTROUTING ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -P OUTPUT ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t mangle -P PREROUTING ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t mangle -P OUTPUT ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># flush old chains</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t filter -F</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -F</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t mangle -F</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># delete user defined chains</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t filter -X</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -X</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t mangle -X</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 4.1.4 INPUT chain</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># $IPTABLES -A INPUT -p tcp -j bad_tcp_packets</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># we trust INTIF and LOIF, to a large degree</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># we take broadcast packages from INTIF</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -i $INTIF -s 0.0.0.0 -d 255.255.255.255 -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># JSUN: can we just use a simplified version?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#$IPTABLES -A INPUT -p ALL -i $INTIF -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#$IPTABLES -A INPUT -p ALL -i $LOIF -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># established connections can go through</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ALL -d $EXTIP -m state --state ESTABLISHED,RELATED \</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>	-j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># initiation packets are allowed on selected TCP ports</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport ssh -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport smtp -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport http -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#$IPTABLES -A INPUT -p TCP --sync -s 0/0 --dport https -j allowed</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># JSUN: do we need to worry about ntp port?  We will see</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># only take echo-request(8), echo-reply(0) and time-exceeded(11) for icmp</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-reply -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-request -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type time-exceeded -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># If you have a Microsoft Network on the outside of your firewall, you may </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># also get flooded by Multicasts. We drop them so we do not get flooded by </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># logs</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#$IPTABLES -A INPUT -i $EXTIF -d 224.0.0.0/8 -j DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Log weird packets that don't match the above.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># exclude some annoying packets from logging</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -d $EXTBROAD -j DROP </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -d $BROADCAST -j DROP </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>	--log-level $DEBUG_LEVEL --log-prefix &quot;IPT INPUT packet died: &quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 4.1.5 FORWARD chain</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Accept the packets we actually want to forward</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A FORWARD -i $INTIF -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Log weird packets that don't match the above.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>	--log-level $DEBUG_LEVEL --log-prefix &quot;IPT FORWARD packet died: &quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 4.1.6 OUTPUT chain</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Special OUTPUT rules to decide which IP's to allow.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A OUTPUT -p ALL -s $LOIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A OUTPUT -p ALL -s $INTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A OUTPUT -p ALL -s $EXTIP -j ACCEPT</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># Log weird packets that don't match the above.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>	--log-level $DEBUG_LEVEL --log-prefix &quot;IPT OUTPUT packet died: &quot;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>######</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I># 4.2 nat table</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>#</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-zHdqc04kJKxeXEfl5XAw--


