From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 11:44:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406241144.10450.Antony@Soft-Solutions.co.uk>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org> <1087990356.2064.47.camel@grendel> <200406241037.01994.gdh@acentral.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406241037.01994.gdh@acentral.co.uk>
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

On Thursday 24 June 2004 10:37 am, Gavin Hamill wrote:

> On Wednesday 23 June 2004 12:32, Chris Brenton wrote:
> > Seen this a lot. When ever I record a trace it ends up being the
> > following:
> >
> > There is obviously data getting blocked (based on the packet size) but
> > I've never had a user complaint.
>
> Just wanted to add a 'me too' - I've asked on-list a couple of times about
> this but never really got an answer. Neither the server nor clients seem to
> be any the worse off for it, but it's obviously incorrect, and it'd be nice
> to be able to nail it =)
>
> Any takers? Antony? :)

Hi guys - did somebody call :) ?

Yes, I would agree with the above - blocking RST-ACK does no harm whatever, 
and is often an accidental consequence of using stateful firewalls - they see 
the RST packet (and pass it on), then drop the details from the connection 
tracking table, so by the time the RST-ACK comes along in response, the 
firewall thinks "this isn't part of any established connection, so I'm going 
to drop it" (and maybe log it too if you are logging dropped packets).

Either way, the connection gets dropped as required, and both ends are happy, 
because the end which sent the RST has said bye-bye anyway, and the end which 
recieved it has taken the hint and gone quiet too.

The other thing you see logged quite often for similar reasons is FIN-ACK 
packets - the reply FIN-ACK is regarded as optional by many systems, so 
netfilter often ends up logging (and dropping) the second one to come along.   
No harm done though, because the first one has done the job.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


