From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (No subject header)
Date: Wed, 28 Jul 2004 22:52:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407282252.25325.Antony@Soft-Solutions.co.uk>
References: <4107cdbf.195.321c.246791223@arbbs.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4107cdbf.195.321c.246791223@arbbs.net>
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

On Wednesday 28 July 2004 5:01 pm, John Black wrote:

> At work i have a single static IP address that all of the
> computers in the LAN uses for the outside world.  My
> firewall is also acting as a dns server.

Okay, so you have one public IP address, and all your internal machines are 
masqueraded behind that one address for outbound connections; also your 
firewall runs DNS (although it's not clear whether you mean it runs caching 
DNS for internal clients, or also authoritative DNS for external queries 
about your domain).

> Question 1: When i try to ssh in to a computer from the
> outside world it follows the first rule.

What is "the first rule"?

> But when i change ssh to listen to a certain address and port it still
> defaults to the first rule?

What is the question here?

> Question 2: if the DNS server was running on a server behind
> the firewall would this help sloves this problem?

Don't know.   Tell us what the problem is (and what sort of DNS server you're 
running), and we might be able to think of the answer.

Posting your netfilter rules might help us understand what you're asking 
about, as well.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


