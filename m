From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: curious about /etc/init.d/iptables script in RH 8.0
Date: Thu, 24 Oct 2002 15:15:24 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210241501210.2123-100000@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  ... and here's why i was asking about the meaning of the contents
of /proc/net/ip_tables_names.

  the RH 8.0 iptables admin script has the following excerpt for
completely clearing the rule set before reloading from the file
/etc/sysconfig/iptables:


start() {
	# don't do squat if we don't have the config file
	if [ -f $IPTABLES_CONFIG ]; then
	    # If we don't clear these first, we might be adding to
	    #  pre-existing rules.
--- curious stuff starts here ---
	    chains=`cat /proc/net/ip_tables_names 2>/dev/null`
	    echo -n $"Flushing all current rules and user defined chains:"
	    let ret=0
            for i in $chains; do iptables -t $i -F; let ret+=$?; done
	    iptables -F
            let ret+=$?
            if [ $ret -eq 0 ]; then
              success
            else
              failure
            fi
            echo
            echo -n $"Clearing all current rules and user defined chains:"
            let ret=0
            for i in $chains; do iptables -t $i -X; let ret+=$?; done
            iptables -X
--- and ends here ---


  the obvious purpose of this code is to clean the tables and chains
totally before reloading, but it does this in a curious way.

  first, the script grabs the list of currently-used tables from
the file /proc/net/ip_tables_names, which is why i asked about this
file earlier -- the implication is that, given the possible tables
filter, nat and mangle, only those that are listed in that file
can possibly be in use at the moment.  fair enough.  but it
would make more sense to assign this list to a variable like
"tables", not "chains", wouldn't you think? :-)  just being
pedantic.

  the next loop:
            
    for i in $chains; do iptables -t $i -F; let ret+=$?; done
            
clearly flushes all of the active/loaded tables, which will
just as clearly flush all chains, both built-in and user-defined.
again, fair enough, but what's the purpose of the immediately
subsequent

    iptables -F

by default, this will flush the filter table, but isn't that
already empty from the previous statement?  not a mistake, just
redundant, no?

  the same redundancy seems to exist in the next loop that deletes
the user-defined chains:  the loop really gets rid of all user-defined
chains in each table one at a time, and follows that up with

    iptables -X

apparently just to give the "filter" table one last good kick
while it's down or something.  is there something more to this
than meets the eye?


rday


