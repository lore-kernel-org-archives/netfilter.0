From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding traffic to smtp server
Date: Tue, 2 Mar 2004 22:26:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403022225.36217.Antony@Soft-Solutions.co.uk>
References: <1078265760.2567.94.camel@linsaidin.visionsbeyond.mindtrip>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078265760.2567.94.camel@linsaidin.visionsbeyond.mindtrip>
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

On Tuesday 02 March 2004 10:16 pm, Travis Crook wrote:

> Hi All,
> 	I have a question for you.  These are my current rules for sending
> traffic on port 25 to my mail server.  I'm running kernel 2.4.
>
> They seem to work other than my mail server views all packets as coming
> from the firewall and not from external IP addresses.  Is there a way to
> get the originating IP address to my mail server?

I'll bet you have a SNAT or MASQUERADE rule which you didn't bother to tell 
us, which applies to all interfaces.   Change it so it applies only to your 
external interface and you should be a happier person.

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


