From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Wed, 23 Oct 2002 00:26:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023002659.C8681@funkyjesus.org>
References: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain> <20021022200357.TCVO1554.mta07-svc.ntlworld.com@there>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021022200357.TCVO1554.mta07-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Tue, Oct 22, 2002 at 09:03:54PM +0100
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Tue, Oct 22, 2002 at 09:03:54PM +0100, Antony Stone wrote:
> On Tuesday 22 October 2002 7:57 pm, Robert P. J. Day wrote:
> 
> >   i've had a number of people tell me that, while they put a good deal
> > of thought into their INPUT filtering, they simply ACCEPT all outgoing
> > traffic since, if their input filtering is working properly, there's no
> > reason to stop outgoing packets.
> 
> There's no reason to filter outgoing packets unless you don't trust the 
> applications running on your machine.

You shouldn't trust the applications running on your machine.

> If you don't trust what's running on your machine, then you should
> probably fix more than just what netfilter allows.

Yes, but netfilter is a good start :)

-- 
FunkyJesus System Administration Team


