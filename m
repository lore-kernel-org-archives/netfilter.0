From: Ryan Anderson <ryan@michonline.com>
Subject: Re: Doing MASQ for Asheron's Call
Date: Fri, 10 Oct 2003 21:42:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031011014245.GS27657@michonline.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122E68@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E68@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Fri, Oct 10, 2003 at 05:19:40PM -0700, Daniel Chemko wrote:
> Warning Hack alert!!!
> 
> Ok, here is one way to bend the rules in the most inflexible hard coded
> hack that I could think of without recompiling.
> 
> Conntrack cannot fix this problem because the AC protocol is broken.
> There, I said it. Two machines behind cannot connect to the same server
> with the same source and destination ports. That is one reason why
> turbine made it worse and allowed you to change the port ranges used to
> connect. At that point it became nearly impossible to write a proper
> iptables module. 

Err, no, that's not really right.

Linux 2.2.x worked fine with multiple machines behind the same "public"
IP - because they were able to masq the UDP port (making it appear as if
it were changed on the client.) *AND* accepted the responses from "new"
servers, with the loose_udp option turned on.

Using port 9000 on all the internal machines will work, so long as the
*external* port is MASQed.  I note that this doesn't appear to happen,
currently, with Linux 2.4; if that would be in the realm of an ip_nat_*
helper, that would make the reverse forwarding that needs to happen,
easier, as well.

> If you want to write it properly, you need to statefully inspect every
> packet that uses UDP. One better would be to have command line arguments
> into the kernel module which filters the IP addresses searched for the
> one coming from the Microsoft servers. You cannot use port filtering
> since the originating port from the client can and must be a
> self-defined port number.

A command line option to specify the IP range of the servers would be
nice (similar, in theory, to how the ip_conntrack_irc module notices IRC
connections.)

> 1. In order to get multiple AC's to work behind a firewall, you must set
> the port ranges on each client machine differently. Machine 1 == 9000
> Machine2= 9100, etc.. This can be done in the AC configuration screen if
> you run the ac binary directly. The following script doesn't use the
> conntrack, so it must be hard coded for every user. It is probably
> simpler to do it this way unless you have a lot of dynamically people
> playing AC.

My real goal is to make DHCP + Ac work, so that I have a system that
"just works" instead of needing to tweak the configuration everytime I
change something minor in my network and forget the myriad of
implications.

> I am writing this from memory so there are probably simple errors
> within. This is also assuming a basic restrictive firewall is already
> configured.

[snipped]

Yes, a manually built port-forwarding solution will work, but it
requires manual configuration of both the firewall and each client -
this seems excessively clumsy to me.  I would like to avoid at least one
of those configurations, if possible.

Judging from a new capture (looking at the traffic on the outbound side
of my firewall), the port is not MASQed at all - so setting a source
port might still be necessary - however, avoiding the manual port
forwarding configuration would still be a great help.

In summary, there *was* a point in time where 8-10 machines would work
perfectly from behind a Linux firewall, without any custom configuration
for clients 2-10 that was not needed for client 1.  (i.e, "echo 1 >
/proc/net/ip_masq_loose_udp") - I'd like to get back to a situation
where "modprobe ip_nat_game_ms_ac ip_conntrack_game_ms_ac" worked
equally well.

-- 

Ryan Anderson
  sometimes Pug Majere

