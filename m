From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 00:32:59 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040609073259.90131.qmail@web14713.mail.yahoo.com>
References: <1086698326.2008.31.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086698326.2008.31.camel@grendel>
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

--- Chris Brenton <cbrenton@chrisbrenton.org> wrote:
> Others have commented on your rules specifically, so
> I'll skip that
> commentary. One thing I would like to point out
> however is that you are
> exposing 11 services to Internet connectivity.
> That's 11 opportunities
> for someone to find a way into the box.
> 
Here I have almost no choice, just have budget for one
server :(

> 17. /sbin/iptables -P OUTPUT ACCEPT
> 
> This rule reads "If you can find a way to exploit
> any one of the 11
> exposed services, you can use any outbound transport
> to pull over your
> rootkit". 
> 
Could you elaborate this a bit? What are the possible
outbound transports and what are the possible
solutions? 

> > 4. Is this firewall good enough to protect the
> server?
> > If no, could you kindly comment how could I
> improve
> > further?
> 
> IMHO you have two problems:
> 1) Too many exposed services
> 2) You have configured the box to act like a client
> and a server
> resulting in even more open conduits
> 
Our intension to host the server in a data center. Our
server is not required to act as a client other than
receiving mail from other STMP servers. We do not even
offer recursive DNS. Is the SMTP, the client service
that you refer? What are the other client services do
you see? What are the possible solutions?

> Also keep in mind that iptables is a packet filter,
> not a proxy. This
> means you are not seeing any protection to payload
> based attacks.
> 
Could you kindly elaborate payload based attacks? Is
it the packet rate per second? And what are the
possible solutions for payload based attacks?

> So in an ideal world you would want to break up
> these services across
> multiple boxes. You would also want to limit them to
> server activity
> only, and not permit them to generate random
> outbound sessions. 
> 
kindly elaborate this and possible solutions to not to
permit generate random outbound sessions.

> Now with all that said, it could be that you don't
> have the resources to
> setup multiple boxes and you are stuck with this
> setup. If that's the
> case, you are going to have to live with an elevated
> level of risk to
> getting whacked. 
> 
Yup, trying to live best with the limited resources
given :)

> Some other things you could do to mitigate this
> risk:
> Setup an automatic patching system
> Setup Tripwire or Aide to check system integrity
> Setup another system to collect the logs off of this
> system 
> 	Setup Swatch or a similar tool to check these logs
> Setup an IDS
> 
Could you point me to learn more into above setup
subjects?

Appreciate your and other's kind comments on this
issue. 

Sagara



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

