From: Rob Sterenborg <rsterenborg@xs4all.nl>
Subject: Re: Dynamic Deny rule
Date: Sun, 05 Jan 2003 00:10:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1769DC.2060008@xs4all.nl>
References: <000101c2b405$a39f7dd0$0501a8c0@underworld> <Pine.LNX.4.44.0301041051010.25229-100000@firefox.malibyte.net> <20030104214607.GD16581@miggy.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Athan wrote:
> On Sat, Jan 04, 2003 at 10:53:16AM -0800, Bob Sully wrote:
> 
>>Here's the excerpt from my script:
>>
>>  # Refuse any connections to/from problem sites.
> 
> [snip]
> 
>>  if [ -f /etc/firewall/firewall.banned ]; then
>>     while read BANNED; do
>>         iptables -A INPUT -i $EXTERNAL_INTERFACE -s $BANNED -j DROP
>>         iptables -A INPUT -i $EXTERNAL_INTERFACE -d $BANNED -j DROP
>>         iptables -A OUTPUT -o $EXTERNAL_INTERFACE -s $BANNED -j DROP
>>         iptables -A OUTPUT -o $EXTERNAL_INTERFACE -d $BANNED -j DROP
>>     done < /etc/firewall/firewall.banned
>>  fi

This way you'd have to reload the complete INPUT and OUTPUT rules over 
and over which is something I wouldn't do.

If you *are* going to use iptables for this, how about creating user 
BAN_IN and BAN_OUT chains.
Then let cron start a script every 5 minutes that clears the BAN chains 
and refills them with the values from the /etc/firewall/firewall.banned 
file.

Something like this (I didn't test this..) :

-----------

#!/bin/bash

EXT_IF="eth0"

# If a chain doesn't exist, "iptables -L" will output an error.
# Let's not display these errors..

IN=`iptables -L BAN_IN 2>&1|grep Chain|awk '{print $2}'`
OUT=`iptables -L BAN_OUT 2>&1|grep Chain|awk '{print $2}'`

if [ -f /etc/firewall/firewall.banned ]; then

   # Check to see if user chains exist ;
   # If they do : clear them.
   # If they don't : create and redirect the packets from the
   #   INPUT and OUTPUT chains to the BAN chains first.

   if [ -n "$IN" ] ; then
     iptables -F BAN_IN
   else
     iptables -N BAN_IN
     iptables -I INPUT 1 -j BAN_IN
   fi
   if [ -n "$OUT" ] ; then
     iptables -F BAN_OUT
   else
     iptables -N BAN_OUT
     iptables -I OUTPUT 1 -j BAN_OUT
   fi

   # Fill BAN chains.
   # Slightly modified from above...

   while read BAN_IP; do
     iptables -A BAN_IN -i $EXT_IF -s $BAN_IP -j DROP
     iptables -A BAN_OUT -o $EXT_IF -d $BAN_IP -j DROP
   done < /etc/firewall/firewall.banned

else

   # The ban file doesn't exist ; we don't need the chains.
   # Get rid of the BAN redirects in the INPUT and OUTPUT chains
   #   if we have them.

   L_IN=`iptables -L INPUT --line-numbers|grep BAN_IN|awk '{print $1}'`
   L_OUT=`iptables -L OUTPUT --line-numbers|grep BAN_OUT| \
            awk '{print $1}'`
   [ -n "$IN" ] && iptables -D INPUT $L_IN
   [ -n "$OUT" ] && iptables -D OUTPUT $L_OUT

   # Clear and get rid of the BAN chains if we have them.

   if [ -n "$IN" ] ; then
     iptables -F BAN_IN
     iptables -X BAN_IN
   fi
   if [ -n "$OUT" ] ; then
     iptables -F BAN_OUT
     iptables -X BAN_OUT
   fi

fi


