From: Bob Tellefson <bob@zooid.com>
Subject: Re: use of the limiting options
Date: Mon, 31 Jan 2005 19:00:37 +0000
Message-ID: <200501311900.37411.bob@zooid.com>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
	<294d5daa05012610435e4160b@mail.gmail.com>
	<7096989.1107132520756.JavaMail.rct@kale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7096989.1107132520756.JavaMail.rct@kale>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 28 January 2005 21:32, Tib wrote:
> Ahh, I was wondering about this. I had put the limit rule in place and the
> drop after it, and found that it apparently shut everything out. So do I
> need to do all three then?
>
> Establish rule
> Limit rule
> Drop rule
>

Here's a setup that works and shows the logic.

As noted by others, this is not a replacement for properly tightening your 
sshd configuration.  It is useful when you have ssh access from inside your 
network and limited usage from outside.  If you set the limit too low, you 
will find your outside users complaining about erratic service.

#!/bin/sh
IPTABLES="iptables"
PER_MIN_LOG_LIMIT=30
NEW_SSH_PER_MIN_LIMIT=3
ISP_IFACE=eth0

#
###### routine ##### SSH LIMIT EXCEEDED - DO LOG/DROP
#
$IPTABLES -N do_drop_limited
$IPTABLES -A do_drop_limited -m limit --limit $PER_MIN_LOG_LIMIT/minute -j LOG 
--log-prefix "__DROP LIMITED: "
$IPTABLES -A do_drop_limited -j DROP

#
###### routine ##### SSH LIMIT NOT EXCEEDED - LOG FOR INFO
#
$IPTABLES -N log_limited_service
$IPTABLES -A log_limited_service -m limit --limit $PER_MIN_LOG_LIMIT/minute -j 
LOG --log-prefix "__LIMITED REQUEST: "

#
###### routine ##### SSH LIMIT
# limits number of incomming ssh connections per minute.
# NOTE: disable this one when your only access is from the outside
# to avoid being the victom of a mini DoS locking you out.
#
$IPTABLES -N ssh_limit
$IPTABLES -A ssh_limit -j log_limited_service
$IPTABLES -A ssh_limit -m limit --limit NEW_SSH_PER_MIN_LIMIT/minute  
--limit-burst NEW_SSH_PER_MIN_LIMIT -j RETURN
$IPTABLES -A ssh_limit -j do_drop_limited

#
##### FORWARD RULES
#
# if we reject with reset, maybe we can prevent some hanging connections
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j REJECT 
--reject-with tcp-reset
# assumes NEW without syn has already been taken care of
$IPTABLES -A FORWARD -p TCP -i $ISP_IFACE -m state --state NEW --dport 22 -j 
ssh_limit


-- 

Bob Tellefson
Java network application development & hosting

