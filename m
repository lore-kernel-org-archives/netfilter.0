From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Enabling RHN
Date: Fri, 5 Dec 2003 17:36:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312051736.48171.Antony@Soft-Solutions.co.uk>
References: <00da01c3bb55$84c58fa0$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00da01c3bb55$84c58fa0$0200a8c0@ale>
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Friday 05 December 2003 5:30 pm, Alejandro Cabrera Obed wrote:

> Hi everybody, I've configured my first iptables script and it runs not too
> bad ;)

Congratulations :)

> My question is: what protocol and ports does Red Hat Network use in order
> to update my software in my iptables firewall connected to Internet ???

I don't know the answer to this (I don't use Red Hat), however I shall post 
this reply anyway because it applies to so many questions we get on this list 
along the lines of "what rules to I need to (allow|block) service x?"

My answer is that if you don't know, then simply add a LOGging rule to your 
netfilter ruleset (in this case, if you can be specific about the destination 
address (does RHN always connect to a known address?) then that will make 
things easier), create some network traffic of whatever type it is you want 
to make a rule for, and the log entries will then tell you which port/s, 
protocol/s and IP address/es are involved.

I wouldn't be surprised if someone else on this list can answer your question 
directly (and I don't want to dissuade anyone from doing so), however this is 
an effective means by which anyone in your position can find out the 
information for themselves.

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


