From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: netfilter and IIS5
Date: Mon, 7 Oct 2002 14:41:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPKEGPECAA.netfilter@darrelldieringer.com>
References: <AF435BB1224A4C4888B58C546728EE3229AA@s2.valiant.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AF435BB1224A4C4888B58C546728EE3229AA@s2.valiant.com>
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
To: "Keith R. Weiner" <keith@valiant.com>, netfilter@lists.netfilter.org

Awhile ago I was dealing with what amounted to be an IIS issue.

First, are you doing any NAT?  Specifically, are you NAT-ing any
ports?

In my network setup (cable ISP, single real IP address, LAN plus
separate DMZ - all NAT-ed to the Internet with some services being
forwared to the DMZ), where my ISP blocked incomming port 80 requests
somewhere upstream from me, I had the following problem:

If I forwarded w.x.y.z:3080 to dmz.a:80 (where IIS was listening), the
first thing IIS did was issue a redirect.  Check your IIS logs for
HTTP code 302 (IIRC) - redirect - that tells the requesting client
"Reach me on port 80 instead".  Since my port 80 was blocked upstream
by the ISP, the new request from the client never got to me.

But it worked fine inside my LAN since I didn't block port 80 to the
DMZ.

Since at the time I was a newbie to netfilter, I naturally assumed it
was a problem with my rules / setup.  Instead, it was a feature of IIS
(in my case IIS 4), combined with my ISP blocking port 80.

I changed IIS4 to listen on 3080 and changed my NAT to forward
w.x.y.z:3080 -> dmz.a:3080.  IIS no longer issued the redirect to the
blocked port, and everything worked fine.

This may not be your situation, but lacking most specifics about your
network, I'm taking a guess.  Hope it helps.

Darrell


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
> Keith R. Weiner
> Sent: Monday, October 07, 2002 11:21 AM
> To: netfilter@lists.netfilter.org
> Subject: netfilter and IIS5
>
>
> Excuse me if this is a newbie question.
>
> I am running IIS on Windows 2000 behind the DMZ.  The first
> linux box is using the old ipchains.  The second box is
> using netfilter.  From within the DMZ, I can access it.
> From the outside world, it is not accessible.  Other
> services are, but not IIS.
>
> Any help would be greatly appreciated.  Thanks.
>
>


