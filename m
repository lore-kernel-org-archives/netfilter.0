From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables doesn't stop connection
Date: Sat, 1 May 2004 09:17:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405010917.50334.Antony@Soft-Solutions.co.uk>
References: <200405010958.47237.philipp@offermann.tk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405010958.47237.philipp@offermann.tk>
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
To: netfilter@lists.netfilter.org

On Saturday 01 May 2004 8:58 am, Philipp Offermann wrote:

> Hi,
>
> I'm using iptables to firewall my system but it doesn't seem to work. For
> example I have a cvs-server running (port 2401) that shoud not be
> accessible from the outside. Still when I'm trying to connect with "telnet
> mymachine 2401" I get a connection, if not on the first try then on the
> second.

That final phrase should ring some bells - why is the behaviour not identical 
on different connection attempts?

> You find my iptables configuration at the end of the message. Does anyone
> know why I can connect to my cvs server?

Just for info, if you need to post your ruleset again, please send the output 
of "iptables -L -nvx" instead of just "iptables -L" - the extra options tell 
us which interfaces your rules apply to (and also show us the packet & byte 
counts), which can be quiet important in debugging problems.

> Chain INPUT (policy ACCEPT)

Tut tut tut - a default ACCEPT policy on INPUT :(

> target     prot opt source               destination

> log_drop   all  --  0.0.0.0/0            0.0.0.0/0          limit: avg
> 3/min burst 3

So, you are LOGging and DROPping with a rate limit?   What happens to packets 
which are more frequent than this, I wonder?

Oh yes, they get ACCEPTed by your default policy :)

> Chain FORWARD (policy ACCEPT)

Ugh.   Another default ACCEPT policy :((

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - Report in the New York Times, following a demonstration at the 1939 World's 
Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


