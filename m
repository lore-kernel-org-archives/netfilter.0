From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 12:45:49 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57905@OST_EXCH_USR5>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>

Hi rob

As a total newbie :) at least to iptables, I think what you have there is
great.

Just my 0.02, if it's worth that much considering I cant even get DNS
lookups from my fw working.....

steve



-----Original Message-----
From: Robert P. J. Day [mailto:rpjday@mindspring.com] 
Sent: 30 October 2003 12.31
To: iptables mailing list
Subject: thoughts on a newbie tutorial i'll be giving shortly



  as a really low-level iptables intro i'm giving this monday,
i'm going to show and explain something like the following.
it's deliberately simplified as i have only about a half hour,
but i'm interested in whether anyone here has any kind of 
visceral reaction to this configuration -- whether i'm suggesting
anything violently insecure or anything like that.  (i've removed
a lot of preliminary variable setting, just wanting to show the
salient stuff.)

------------------------

ALLOWED_INCOMING_SERVICES="ssh http"
DISALLOWED_OUTGOING_SERVICES="telnet"

#######################################################
# Set the chain policies.
#######################################################

$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT ACCEPT	# Purists probably hate this.


#######################################################
# Start with some REALLY basic rules.
#######################################################

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#######################################################
# Kill really bad outgoing services.
#######################################################

for s in $DISALLOWED_OUTGOING_SERVICES ; do
	$IPT -A OUTPUT -p tcp --dport $s -j DROP
done

#######################################################
# Allow a very small set of incoming services.
#######################################################

for s in $ALLOWED_INCOMING_SERVICES ; do
	$IPT -A INPUT -p tcp -s 192.168.1.0/24 --dport $s -j ACCEPT
done

------------------------------

  yes, it could be fancier, but it's meant to be a starting
point for total newbies.  

  thoughts?

rday




.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


