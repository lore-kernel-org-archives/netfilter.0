From: Jesse <marshall28@juno.com>
Subject: Problems Pinging the Internet w/this script
Date: Sat, 11 Sep 2004 17:32:18 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41439912.2090701@juno.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Here's a script I'm using to create some tables which will only allow in 
on ports I'm running services. One of the problems I'm havng is that I 
can't ping the Internet with a DNS address from this machine. I've 
allowed everything in the OUTPUT table and can ping the Internet when 
using a straight IP, but when I type in "ping google.com" the machine 
hangs for a few seconds and gives me a server request error. I know it's 
something with my rules because when I flush them all I can ping 
google.com just fine. Any ideas would be greatly appreciated. I'm 
guessing it's something trivial but can't put my finger on it yet.

thanks

#!/bin/bash
########## Beginning 
###########################################################

# Define Interfaces/Networks

    # Inside/Intranet Interface
      INSIDEIP="192.168.7.55"
      INSIDEINT="eth0"

    # External/Internet Interface   
    # OUTSIDEIP=
    # OUTSIDEINT=

    # LAN Network
      LAN="192.168.7.0/24"

    # Admin Host
      ADMIN="192.168.7.51"

# Define other Variables

    RULE="/usr/sbin/iptables"

# Flushing All rules/chains
  $RULE -A INPUT LOG
  $RULE -A OUTPUT LOG
  $RULE -A FORWARD LOG
  $RULE -P INPUT DROP
  $RULE -P OUTPUT DROP
  $RULE -P FORWARD DROP
  $RULE -F INPUT
  $RULE -F OUTPUT
  $RULE -F FORWARD

# Adding Permittable Network/Hosts/Ports to Input Table on Internal 
Interface

  # Allowing DNS,FTP,SSH,Webmin,HTTP,SWAT,and Samba to Server

  $RULE -A INPUT -i $INSIDEINT --proto icmp --icmp-type any -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 21 -d $INSIDEIP -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN --dport 22 -d 
$INSIDEIP -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 53 -d $INSIDEIP -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 80 -d $INSIDEIP -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 137 -d $INSIDEIP -j 
ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 138 -d $INSIDEIP -j 
ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 139 -d $INSIDEIP -j 
ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 445 -d $INSIDEIP -j 
ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN --dport 901 -d 
$INSIDEIP -j ACCEPT
  $RULE -A INPUT -i $INSIDEINT --proto tcp -s $ADMIN  --dport 10000 -d 
$INSIDEIP -j ACCEPT

# Denying Everything on Local Network

# Adding entry to allow everything originating from Internal Interface out
   
  $RULE -A OUTPUT -j ACCEPT

########## END 
################################################################


