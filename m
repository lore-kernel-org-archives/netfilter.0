From: AntiProxy <admin@antiproxy.com>
Subject: Re: Watched a DDoS attack for hours and couldn't do much :S
Date: Mon, 27 Nov 2006 21:16:46 +0400
Message-ID: <1164647806.21896.18.camel@srv1.iihs.net>
References: <200611270803.kAR81k2Y030892@mail3.jubileegroup.co.uk>
	<Pine.LNX.4.58.0611270829210.30530@mail3.jubileegroup.co.uk>
Reply-To: admin@antiproxy.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0611270829210.30530@mail3.jubileegroup.co.uk>
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
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@lists.netfilter.org

Actually, it's an external attack, apparently from a whole bunch of
compromised machines..

One thing i thought off, was to pipe tcpdump's output into a couple awks
and seds and generate IPTABLE rules on the fly..

let's see how this goes

On Mon, 2006-11-27 at 08:38 +0000, G.W. Haywood wrote:
> Hi there,
> 
> On Mon, 27 Nov 2006 AntiProxy wrote:
> 
> > One of my servers was hit by a DDoS attack earlier today,
> > and the pattern was different to these i've seen before.
> >
> > netstat doesn't show any TCP or UDP connections in any state.
> >
> > however, TCPDUMP shows the following (i'm posting a few lines of
> > millions):
> > [...]
> > what does it tell you?
> 
> Somebody is trying to spoof a machine on your network?
> 
> I'd have thought a reasonable box could drop 15k packets/second OK but
> you might need to put rules in the INPUT chain to drop everything from
> the offending IPs.  For this kind of thing I use a Perl script to scan
> the logs and insert rules into iptables in real time.  Its input is
> piped from syslog-ng.  It takes a bit of setting up but it's worth it.
> If there are large numbers (thousands) of attacking IPs you'll need to
> look at something like ipset as iptables will begin to creak a bit.
> 
> If this continues you might want to contact your upstream provider.
> They will want to help if they're at all reputable.
> 
> --
> 
> 73,
> Ged.
> 


