From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: RE: mangle, filter & FORWARD
Date: Tue, 1 Jun 2004 10:28:35 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040601172835.92536.qmail@web41705.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

*sigh* Thanks for the answers Justin but I was only
asking those questions to start a discussion about
forwarding and maybe find someone that can help you
with your problem.  I have no need for forwarding, I
am merely curious as to what can be done on a network
with a *nix box.  So far I'm impressed with what has
been done, except for my question about the FORWARD
chain... let me explain what I am talking about.

In all the examples I've seen, the way to forward a
packet is to do something like this:

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT

As you can see, there is no reference to either the
mangle table or filter table... so where does the
system append the rule?  An obvious answer might be
that the system appends the rule in both FORWARD
chains, (if there is two chains).  But that would mean
that a single rule would take up twice the amount of
space it would need and it also brings up something
that occurs with this next, possible answer.
What if there is only one chain, used by two tables. 
Since it seems that the system moves through the
tables sequentially, then the exact same compares will
be made in both tables.  You would have a major
redundancy in a very important part of the networking
process, especially if the system is a gateway.
So there is my question again, restated as clearly as
I can possibly make it.

I have been asking questions as nicely as I can here
and no one wants to reply, so I think I need to say
something to the people who are reading my posts and
just sending them to the bit bucket.

*nix is not user friendly and it is because everyone
who works on it likes to complicate things first, then
simplify (a flaw most people have, myself included). 
*nix will NEVER be user friendly because that is the
way we like it, raw output, difficult challenges and
total control over everything.  The community must
make up for the unfriendly nature of the OS by being
friendly to people who are moving from Windows and
looking for help, like me.  Ignoring people is just
going to make everyone give-up on *nix and stick with
microsoft, which means your *nix knowledge will only
ever be a hobby and you will have to have M$
certification to get work; which would be sad because
this is a far more powerful and useful OS.

If what I said makes you angry, then flame away. 
Better then nothing! :)


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

