From: Michel Bellemare <michel.bellemare@gmail.com>
Subject: Re: gnutella
Date: Thu, 21 Oct 2004 17:17:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <f9a42cb404102114172fd3498b@mail.gmail.com>
References: <f9a42cb404102107232273e04@mail.gmail.com>
	<1098369207.24579.5.camel@porky>
Reply-To: Michel Bellemare <michel.bellemare@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098369207.24579.5.camel@porky>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Group <netfilter@lists.netfilter.org>

And is there any way to log how many bytes the application is using
with each packet?


On Thu, 21 Oct 2004 16:33:27 +0200, Eric Leblond <eric@inl.fr> wrote:
> You can do this for local traffic by using the owner module and :
>         --cmd-owner
> For a whole network I see any solutions but slightly modify the NuFW
> system to be able to mark packet with an uid corresponding to the
> application (same way it can mark with userid).
> 
> 
> 
> On Thu, 2004-10-21 at 10:23 -0400, Michel Bellemare wrote:
> > is there any way to log all the traffic that uses the gnutella protocol?
> > i searched in the mailing list and google and found nothing.
> >
> > I looked to at a tcpdump capture and it never uses the same port...
> >
> > basically i want to control the number of bytes that goes out using
> > this protocol.
> >
> > thank you very much!
> > 
> --
> Eric Leblond <eric@regit.org>
> NuFW, Now User Filtering Works : http://www.nufw.org
> 
> 
>

