From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Adaptive stealthing/unstealthing of port 113
Date: Sun, 23 Apr 2006 11:19:44 -0400
Message-ID: <1145805584.7476.355.camel@siren.chrisbrenton.org>
References: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
Reply-To: cbrenton@chrisbrenton.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Asfand Yar Qazi <ayqazi@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2006-04-23 at 11:51 +0000, Asfand Yar Qazi wrote:
>
> "Adaptive Stealthing" means that when a TCP SYN packet arrives to
> request a connection to your machine's port 113, ZoneAlarm checks, on
> the fly, to see whether your machine currently has any sort of
> "relationship" with the remote machine

<snip>

> I wanna do it on my ADSL firewall!

IMHO IDENT is pretty much a dead protocol. Kind of dumb to trust the
connecting system to give you an honest answer about the owner of an
application.

I rarely see TCP/113 anymore but in the rare cases where I do, rejecting
with a TCP reset keeps the original connection from getting stalled.

I know this does not really answer your question, just trying to ssave
you some work in an effort that's not really needed.

HTH,
Chris



