From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: captive web system using DNAT and SNAT
Date: Fri, 06 May 2005 08:21:35 -0500
Message-ID: <1115385695.21170.82.camel@localhost.localdomain>
References: <1115323918.21170.65.camel@localhost.localdomain>
	<427AD61D.2050709@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427AD61D.2050709@riverviewtech.net>
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

On Thu, 2005-05-05 at 21:27 -0500, Taylor, Grant wrote:
> > # catch all redirects to registration server
> > iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
> > --to-destination ${REGISTRATION_SERVER}
> > 
> > iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
> > --to-source ${EXTERNAL_ADDRESS}
> > 
> > iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
> > --to-destination ${REGISTRATION_SERVER}
> > 
> > iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
> > --to-source ${EXTERNAL_ADDRESS}
> 
> Did you mean to post the same rules twice?  Or am I really just missing something?
> 

sort of. for the second set of rules s/80/443.

> > what i want to do is if i type in ${REGISTRATION_SERVER} in my address
> > bar on the client system, then i dont want the firewall to do any DNAT
> > or SNAT. what is the best way to accomplish this?
> 
> Try changing your DNAT rule to be like the following:
> 
> iptables -t nat -A PREROUTING -i eth1 -p tcp -d ! ${REGISTRATION_SERVER} -dport 80 -j DNAT --to-destination ${REGISTRATION_SERVER}

but the problem is that the traffic leaving the firewall will be SNATed.
so all traffic will be essentially go to the ${REGISTRATION_SERVER} but
i dont want to SNAT traffic that isnt DNATed.

ive tried the following yesterday:

iptables -t mangle -A PREROUTING -i eth1 -d ${REGISTRATION_SERVER} -j
MARK --set-mark 123

iptables -t nat -A PREROUTING -i eth1 -m mark --mark 123 -j ACCEPT

iptables -t nat -A POSTROUTING -o eth0 -m mark --mark 123 -j ACCEPT

iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j DNAT
--to-destination ${REGISTRATION_SERVER}

iptables -t nat -A POSTROUTING -o eth0 -p tcp -dport 80 -j SNAT
--to-source ${EXTERNAL_ADDRESS}

and everything was still being DNATed and SNATed (including the traffic
destined for ${REGISTRATION_SERVER}). after a reboot this morning, the
above rules work. (yes, i was flushing my tables (nat, mangle, filter)).

any thoughts?

so my problem is solved, but i am curious why a reboot changes the way
the packet filtering/natting is done.

thanks,

matt zagrabelny


