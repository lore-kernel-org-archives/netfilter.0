From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: streaming audio ports
Date: Wed, 18 Jun 2003 12:22:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPOEEFFKAA.netfilter@darrelldieringer.com>
References: <20030618165614.94092.qmail@web9604.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618165614.94092.qmail@web9604.mail.yahoo.com>
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
To: Taniform Asongwe <tasongwe@yahoo.co.uk>, netfilter@lists.netfilter.org

As with many things, it depends on the server.  "Shoutcast" streaming
audio servers, for instance, default to port 8000, but can be
configured to operate on any port.  I don't know about 'RealAudio' or
others, but I imagine it's a similar story.

You could block everything by default, and only permit the ports
corresponding to services you want to allow people to use.

Darrell Dieringer - Madison, WI

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Taniform
> Asongwe
> Sent: Wednesday, June 18, 2003 11:56 AM
> To: netfilter@lists.netfilter.org
> Subject: streaming audio ports
>
>
> Hi there,
>
> could someone tell me how I can block streaming audio
> from running into my network? My users are listening
> onto internet radio stations and consuming a lot of
> bandwidth, a practice I wish to stop. I have blocked
> port 554 with iptables but it is not enough.
>
> Thanks in advance
>
> Taniform
>
> ____________________________________________________________
> ____________
> Want to chat instantly with your online friends?  Get the
> FREE Yahoo!
> Messenger http://uk.messenger.yahoo.com/
>
>
>


