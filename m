From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT possible with the string module?
Date: Wed, 6 Nov 2002 20:21:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021106202328.FPYI9836.mta01-svc.ntlworld.com@there>
References: <aq64dg$4br$1@hermes.vibe.ac> <20021104195745.DUTJ27595.mta05-svc.ntlworld.com@there> <pan.2002.11.06.17.34.41.666315@vibe.ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <pan.2002.11.06.17.34.41.666315@vibe.ac>
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

On Wednesday 06 November 2002 5:34 pm, Udo Rader wrote:

> On Mon, 04 Nov 2002 21:36:10 +0000, Antony Stone wrote:
> > On Monday 04 November 2002 3:40 pm, Udo Rader wrote:
> >>
> >> I would like to do the following thing:
> >>
> >> The firewall then ideally takes all connects from clients to port 1234,
> >> looks for a "magic string" (using -m string) in the packages and based
> >> upon the (non)existance of the string finally decides, which daemon to
> >> forward the connect to.
> >
> > I think the answer is no, it cannot work (assuming you are talking about
> > TCP ports and not UDP ports).
> >
> > Before a client can send the magic string you are looking for, it needs
> > to have completed the TCP handshake of SYN - SYN/ACK - ACK, because it's
> > only after that's done that any data gets transferred between the
> > systems.
>
> I see your point.
>
> So am I right that the only way to achive this is by having some kind of
> proxy dealing with this "magic-string"??

Yes, a proxy is the correct solution for this problem (and is nearly always 
the correct solution whenever someone thinks of using the --string match).

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

