From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: use of the limiting options
Date: Mon, 31 Jan 2005 00:52:32 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501310046540.18954-100000@darkstar.sysinfo.com>
References: <4f3930a7050130194460efd21a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4f3930a7050130194460efd21a@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Nerius <jnerius@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 30 Jan 2005, Josh Nerius wrote:

> Hello, 
> 
> A few thoughts/comments on your situation.  
> 
> 1. You are correct, limit does not keep track of source. You may find
> the 'recent' module useful if you wish to do this.
> 
> 2. You may want to simplify things by easing up on the limit. Doing
> something like 1/minute with a burst of 3 would still prevent
> bruteforcing (or your password ir *really* insecure ;-) ) but at the
> same time, give you a little more protection from DoS.

I'd set this in the shhd_conf file, allowiong only one wrong passwd to
close the connection attempt, this makes bruteforcing via sshd much more
costly and time consuming without relying upon another tool.


Course, I as well like to limit where ssh is allowed to connect directly
internally from.  If this is hard to accomplish with many roadwarrirors,
then I'd make ssh into the internalside a two factor login at least.  Once
to a box on the DMZ, with sshd tightened down considerably, and then once
a connection was made to that system, force the users to then ssh from
there to an internal sshd chokepoint that only accepts connections from
the tightened DMZ server.  I'd see this all as not really a
FW/netfilter issue, but a security issue with a different perspective
completely.


Thanks,

Ron DuFresne

> 
> 3. In the setup you mention, the limit would *not* reset itself every
> 10 minutes. limit basically says, "ok, he said 6 in an hour, so if I
> see 6 in the first 5 seconds,  that's it for the rest of this hour..."
> (and the burst is just the number of packets it has to see in the
> given time increment before it'll start counting off hits)
> 
> 4. As Mark mentioned, you definitely want to add a rule to accept
> packets that are related to an already established ssh connection.
> Otherwise, as he mentioned, once your connection is established, it'd
> use up all the packets alloted in limit and then your ssh session
> would die. A rule like `iptables -I INPUT -i eth0 -p tcp --dport 22 -m
> state --state ESTABLISHED -j ACCEPT` would do this quite nicely.
> Notice the -I INPUT...this can be changed to -A but the -I will put it
> at the top of your chain. This rule needs to be above the limit rule
> in order to function properly.
> 
> 5. Don't let Jason get to you :-P
> 
> Hope this information proves to be helpful :-)
> 
> Josh Nerius
> 
> 
> 
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


