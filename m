From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Child proofing...
Date: Mon, 11 Nov 2002 22:26:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111222625.K19115@funkyjesus.org>
References: <B0000532307@smtp.rapiddsl.net> <20021109143748.JCMK21275.mta07-svc.ntlworld.com@there>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021109143748.JCMK21275.mta07-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sat, Nov 09, 2002 at 02:37:45PM +0000
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

On Sat, Nov 09, 2002 at 02:37:45PM +0000, Antony Stone wrote:
> On Thursday 07 November 2002 7:53 pm, Guillaume Marcais wrote:
> 
> > We have remote routers that we access with ssh. Sometime, I am not
> > careful enough and I enter stupid routing information that not only
> > leaves our clients connectionless but also prevents me from accessing
> > the router. Then truck roll, long downtimes and angry customers... I am
> > really a child sometimes :)
> 
> I recommend you set up an auto-answer modem connected to the serial port of 
> the router.   If the router is a Linux box, installing an internal modem may 
> be cheaper or more convenient.

Sorry to act like an echo, but seconded - as long as you've got some kind of
Caller Line Identification restrictions on the modem.

Or a "console server" or similar, a seperate host you can access regardless
of the changes to the router's configuration that gives you a serial
connection to the host.

Or have a working minimal configuration that permits you to have remote
access.  Then before you make a change use an "at" job or similar to bring
that working configuration up in five minutes unless you can ssh in and stop
it... that way you know you'll be able to get back into the router to have
another crack at the problem.

-- 
FunkyJesus System Administration Team


