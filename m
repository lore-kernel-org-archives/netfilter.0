From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 17:09:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406241709.50795.Antony@Soft-Solutions.co.uk>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org> <200406241454.28088.Antony@Soft-Solutions.co.uk> <1088092124.2029.28.camel@grendel>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088092124.2029.28.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 24 June 2004 4:48 pm, Chris Brenton wrote:

> On Thu, 2004-06-24 at 09:54, Antony Stone wrote:
> > > > No harm done though, because the first one has done the job.
> > >
> > > Actually not quite true as both sides will enter a fin-wait state (RFC
> > > 793 page 20) till the second FIN/ACK-ACK exchange takes place.
> >
> > Depends what you mean by "done the job".   I meant the phrase in the
> > sense of "no more data is going to pass across the connection".
>
> I *think* this may be the point of confusion. A FIN/ACK only means that
> the _sender_ is done transmitting data.

Agreed.

> So just because one side of the connection issues a FIN/ACK, it does not
> mean the session is over. The other side of the session may have a lot
> more data to transmit so the session can stay active for some additional
> period of time. Here in lies out problem. Netfilter is reacting to the
> first FIN/ACK and killing off the session before the other end finishes
> communicating and issues it's own FIN/ACK.

In my experience (with things like SMTP, HTTP) it appears to be the server 
which generally issues the (first) FIN/ACK, telling the client that there's 
no more data (by which time the client has finished anyway, since it issued 
the request and was just waiting for the response to come back).   It seems 
not to be often that the client sends a FIN/ACK once it's finished sending 
the request, knowing that there's plenty of data to come in a reply (if there 
were, I think netfilter would have been changed quite some time ago).

I wonder how other stateful firewalls (eg: CP FW-1?) handle this sort of thing 
- do they listen for *both* FIN/ACKs (and thereby leave themselves prey to 
half-open connections littering their connection table for systems which 
don't bother to send the responding FIN/ACK)?

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


