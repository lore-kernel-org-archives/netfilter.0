From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Iptables on Redhat 7.3
Date: Thu, 20 Mar 2003 12:32:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303201232.54126.netfilter@newkirk.us>
References: <1048173669.1320.17.camel@bordercollie>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048173669.1320.17.camel@bordercollie>
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
To: Chris Garringer <chris.garringer@tic.toshiba.com>, Netfilter List <netfilter@lists.netfilter.org>

On Thursday 20 March 2003 10:21 am, Chris Garringer wrote:
> I am implementing iptables on 2 Redhat 7.3 boxes, one a WEB server and
> one a FTP server.  Both are running the latest Redhat kernel for
> 7.3,Linux version 2.4.18-27.7.xsmp.  Both are dual processor boxes.  I
> setup iptables by adding rules to the INPUT chain (single NIC, no
> routing) to accept the connections I wanted, and had a log rule at the
> end to see what made it past the accepts.  Once I was not getting any
> logs I assumed I had written the rules to accept all connections I
> wanted and put a DROP policy in effect for INPUT.  For the WEB server
> it worked, for a while.  For the FTP server as soon as I changed the
> policy iptables --list got REALLY slow.  There are only 10-12 rules,
> iptables --list took 10-15 seconds per line to list them.  Also some

Are you listing with the -n option?  That tells iptables to list with IPs=
=20
instead of resolving to actual host names.  This usually results in=20
near-instant rules listings.  The most useful form (IMHO) is

iptables -v -n -L

which lists IPs instead of names, and packet & byte counts that match=20
each rule.  By putting the -L last, it is also easier to hit up-arrow,=20
and add a chain name.  ("iptables -v -n -L INPUT" for example)

> connections were refused, but not logged (the log rule is still

What exactly IS the log rule?

> there).  Changing the policy to accept fixed the problem.  After a
> reboot the ftp server is working with policy DROP, but after a reboot
> to update the WEB server last night (with policy DROP) sendmail
> stopped working.   There is nothing in the logs from iptables about
> packets getting past the ACCEPT rules for sendmail, but the connection
> is not made (sendmail 8.11.6). Sendmail is in queue mode and should
> make only outgoing connections which have no rules and an ACCEPT
> policy.  When I change the INPUT policy back to ACCEPT sendmail starts
> sending mail to the relay host. What is going on here?  Is changing

Likely you don't have a rule in INPUT to allow return traffic, so full=20
2-way connections cannot be established once policy is DROP.  Do you=20
have at least something like the following rule in place?

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

This will allow replies back in, without explicitly opening any ports,=20
and without necessarily allowing any NEW incoming connections.

> the policy to DROP not a good way to do this?  This is frustrating as
> the logs seem to show everything OK, but the policy change causes
> problems.

The only way a policy can affect anything is if a packet is failing to=20
match any effective rules in the chain.  If it matches a LOG rule, it=20
will LOG, but still pass to policy at then end if there is not a rule to=20
specifically handle that traffic.

If you post your script it would be much more likely that someone here=20
could see the problem and offer a solution.  Most people are more=20
comfortable if they sanitize the script by removing their public IP. =20
(if a static IP is in the rules - of course you sent this message from=20
work, but if you send one from home chances are your IP will be trivial=20
to discover...)

j

