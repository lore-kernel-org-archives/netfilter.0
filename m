From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: per-connection byte counts
Date: Mon, 19 Jan 2004 18:59:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074556757.20675.11.camel@tarkus>
References: <20040118140903.GA3351@glympton.airtime.co.uk>
 <16394.59800.443846.342711@fisica.ufpr.br>
 <000e01c3de21$28bf0440$0300a8c0@indoaksesbno>
 <200401190031.50360.Antony@Soft-Solutions.co.uk>
 <002001c3de26$4b970da0$0300a8c0@indoaksesbno>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <002001c3de26$4b970da0$0300a8c0@indoaksesbno>
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
To: bino-psn <bino@indoakses-online.com>
Cc: netfilter@lists.netfilter.org

Ntop does a wonderful job of this, and according to what I read, the
latest version will allow you to store to a file . I mostly use it to
collect sflow data, but have run it on our nms as a local agent as well.

Ted
On Sun, 2004-01-18 at 19:50, bino-psn wrote:
> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, January 19, 2004 7:31 AM
> Subject: Re: per-connection byte counts
> 
> 
> > If this package provides the information you need, why not just run it on
> the
> > netfilter machine?   What's the need for a separate box?
> 
> No problem Sir.
> I just want to split the Monitoring-function from the Packet-Forwarding
> function.
> I just don't want a fail of one function savere the other.
> I never mix complex function in a single box, unless they need tobe.
> my small corporate network is build from a bunch of used classic pentium
> class PC, with small RAM .. and WISP-Dist in it.
> Let's say that the network is in a peak state ... super high traffic. It
> will eat more CPU of the monitoring function. I don't want this to kick-down
> the packet-forward function. That why I put it in another box.
> 
> Sincerely
> -bino-
> 
> 


