From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: inconsistant behaviour
Date: 25 Sep 2003 03:07:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064473627.1919.474.camel@alpha.newkirk.us>
References: <3F72778D.2080207@didymodesigns.com.au>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F72778D.2080207@didymodesigns.com.au>
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
To: Ashley Maher <ashley.maher@didymodesigns.com.au>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-09-25 at 01:05, Ashley Maher wrote:
> $IPTABLES -N ACCT
> $IPTABLES -F ACCT
> $IPTABLES -N ALLOW
> $IPTABLES -P ALLOW DROP

You can't set a policy on a custom chain - it always returns to the
calling chain at the end.  Think of it as a hardwired "RETURN" policy...

> $IPTABLES -F ALLOW
> 
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -j ACCT
> $IPTABLES -I FORWARD -d 202.129.z.y -j ACCEPT
> $IPTABLES -A FORWARD -s 203.220.a.0/22 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
> $IPTABLES -A FORWARD -s 203.220.b.0/24 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
> $IPTABLES -A FORWARD -s 203.221.c.0/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
> $IPTABLES -A FORWARD -s 203.220.d.0/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
> $IPTABLES -A FORWARD -s 203.220.e.128/25 -d 0.0.0.0/0 -o $EXTIF -j ALLOW
> 
> When a student logs on this instruction is given:
> 
> /sbin/iptables -A ALLOW -s $IP/32 -d 0.0.0.0/0 -o $EXTIF -j ACCEPT
> /sbin/iptables -A ACCT -s 0.0.0.0/0 -d $IP/32 -i $EXTIF
> 
> This works well.
> 
> When a student logs off these instructions are given:
> 
> /sbin/iptables -D ALLOW -s $IP/32 -d 0.0.0.0/0 -o $EXTIF -j ACCEPT
> /sbin/iptables -D ACCT -s 0.0.0.0/0 -d $IP/32 -i $EXTIF
> 
> Now this works fairly well. Less than 1% of the time it fails to remove 
> the entry from the ALLOW chain and very rearly it fails to remove from 
> the ACCT chain.
>
> Where can I look to find this error. Though rare the 1% ends up being a 
> significant number given the load is high.

?? There's no reason it should 'fail' to remove the rule from either
chain.  However, what happens if a student logs on twice without logging
off?  Will it enter two pairs of rules, but only delete one?  (That's
what will happen if there are two matching rules to a single -D delete
command - the first one found goes, anything else remains)  If this is
the case, you;d be better off grepping the output of "$IPTABLES -L
ALLOW" and making sure you remove duplicates.  Something like:

for ((c=0;c<$($IPTABLES -L -n ALLOW | grep -c $IP);c++)) 
do
	$IPTABLES -D ALLOW -s $IP/32 -d 0.0.0.0/0 -o $EXTIF -j ACCEPT
done

Or alternately, run your 'remove' function when they login, before
creating new rules for them, to ensure that there's no 'legacy' of older
rules for that IP.

> Also msn messagenger packets do not seam to be counted by the iptables 
> chain?? This is an observation from the help desk as students are 
> complaining they are being logged off for inactivity and they are using 
> messanger. When I hand check packets using iptables there appears to be 
> no packet count. Whe they do a download there is.

What exactly is being monitored to determine 'activity'?  The ACCT chain
rule for the student's IP?  That will never see ESTABLISHED or RELATED
state packets.  You'd need to put the state rule AFTER the ACCT rule in
FORWARD chain to ensure that ACCT counts ALL packets.

> I'm not an iptables guru so hints and or suggestions appreciated.
>
> thanks
> 
> Ashley

Hope that helps.

j




