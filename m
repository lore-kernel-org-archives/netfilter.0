From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: difference between --rcheck and --update in recent
Date: Wed, 31 Aug 2005 02:26:26 -0500
Message-ID: <43155BA2.80705@riverviewtech.net>
References: <20050831013333.GA9794@bluemaggottowel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050831013333.GA9794@bluemaggottowel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I've set up a few simple rules to kill off annoying ssh brute force
> attacks, however, I'm confued between the differences among "rcheck" and
> "update".
> 
>>From what I gather, they both do the same thing EXCEPT update also
> updates an existing record, not just checking for its existence.  The
> question is... what does it update?  Take the following two examples
> (simplified for example purposes only).

--update will increment the counter for the particular host that sent the traffic that this rule is checking for.  This is much like the behavior of using a variable such as $MyVar++ in Perl where the value will be incremented (by one) after you use it and each time you use it in that form.

--rcheck on the other hand will never change the value for the counter for the particular host that sent the traffic that this rule is checking for.  Hens you can --rcheck as many times as you want and never change the value.

I believe that both --rcheck and --update require the previous existence of the counter for them to check against.  In other words they will not create and set the counter for you.

> Example 1:
> -A INPUT -p tcp --dport 22 -m recent --rcheck \
> --hitcount 3 --seconds 600 -j LOG --log-prefix "SSH attack: "
> 
> -A INPUT -p tcp --dport 22 -m recent --rcheck \
> --hitcount 3 --seconds 600 -j DROP
> 
> -A INPUT -p tcp --dport 22 -m recent --set -j ACCEPT
> 
> 
> Example 2:
> -A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m \
> recent --set
> 
> -A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent \
>   --update --seconds 60 --hitcount 4 -j DROP
> 
> -A INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -j ACCEPT 
> 
> 
> The first one allows up to 3 SSH attempts within 600 seconds.  That's
> pretty straightforward.  
> 
> The second one checks for new connections to sshd, inserts it into the
> recents list (default) in the first line.  The second line drops the
> packet if it's been seen more than 4 times in the last 60.  But since
> it's an update, does it actually update the record in the list, ie
> incrementing the hitcount? IOW, everytime a new connection comes in does
> it actually climb TWO hitcounts instead of just one?

*nod*  Yes the second example will increment the counter for a given host two times for each NEW packet, once for each rule.

> It doesn't seem to increment the hitcount two times, but I could be
> readint /proc/net/ipt_recent wrong.

Hmm, you should see the existence of multiple strings of numbers.  As far as I know these are the identifiers for packets or they are time stamps for when the packets were seen for a given host (line in the file).  The very number of the strings of numbers is the number of hits that a given host has in the recent list.

> The crux of the matter is what exactly is the difference between update
> and rcheck?

(see above)

I think one of the functional differences between --update and --rcheck is where you would use it.  With --update requireing the prior existence of a counter in the recent list you can --update a rule when testing for things other than SSH brute forcing.  For example if you have multiple types of tests, one being your SSH brute force, one being your MS-SQL, one being HTTP, and others being a port scan detection each could do a particular --set in their respective rules in one recent list.  With this recent list that could be set by multiple tests you could vary easily implement a generic --update rule at the start of your firewall rule set to ensure that the sender IP has been silent for so long with out having to explicitly go through the rest of your checks.  It has more to do with what you are wanting to test and how you want to work with the variables.

Example
# General filter at the top of the firewall.
# If any given host has gotten a score higher than 3 in the last 10 minutes we don't want to talk to them.
# If they do come back in to minutes DROP them and reset the counter.
-A INPUT -m recent --update --hitcount 4 --seconds 600 -j DROP

# SSH Brute Force Test
# Allow one NEW SSH connection per minute from any given host.
-A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --hitcount 2 --seconds 60 -j DROP
-A INPUT -p tcp --dport 22 -j ACCEPT

# SMTP abuse test.
# Allow one NEW SMTP connection per minute from any given host.
-A INPUT -p tcp --dport 25 -m state --state NEW -m recent --set --hitcount 2 --seconds 60  -j DROP
-A INPUT -p tcp --dport 25 -j ACCEPT

# SMB/CIFS Networking
-A INPUT -p tcp -m mport --destination-ports 135,137,138,139,445 -m recent --set --hitcount 1 --seconds 60  -j DROP
-A INPUT -p udp -m mport --destination-ports 135,137,138,139,445 -m recent --set --hitcount 1 --seconds 60  -j DROP

# MS-SQL Server
-A INPUT -p tcp --dport 1433 -m recent --set --hitcount 1 --seconds 60  -j DROP
-A INPUT -p udp --dport 1433 -m recent --set --hitcount 1 --seconds 60  -j DROP



Grant. . . .

