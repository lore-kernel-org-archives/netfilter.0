From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat question
Date: Wed, 25 Feb 2004 15:48:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402251548.50442.Antony@Soft-Solutions.co.uk>
References: <403a6f6e.ec2.0@arbbs.net> <1077596302.394.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077596302.394.3.camel@localhost>
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

On Tuesday 24 February 2004 4:18 am, John A. Sullivan III wrote:

> On Mon, 2004-02-23 at 16:23, John Black wrote:
> > Since i'm  running separate servers for FTP, Mail, and Web, and using
> > dnat to port forward to these machines. Do i need these ports open on the
> > firewall?
>
> I am not an expert on the inward workings of iptables but I would assume
> that you do.  The NAT targets will change the source and destination
> addresses but the packets (at least the first packet in the case of
> connection tracking) must traverse the FORWARD chain of the filter
> table.  It will pass through that table with the real address so there
> must be a rule to allow access to the real address.

What you say is correct - you must have a rule in the FORWARD chain to allow 
the packets through the firewall.

However, I think this is a very different thing from "having the ports open on 
the firewall", since to me this means that the firewall itself is listening 
on those ports.

Hopefully the combination of your explanation about the FORWARD chain and my 
previous explanation about not running local services has clarified things :)

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


