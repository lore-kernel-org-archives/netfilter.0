From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block port 137
Date: Tue, 3 Aug 2004 07:17:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408030717.59289.Antony@Soft-Solutions.co.uk>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <002401c4 7917$d0a6fd70$858310ac@suarapembaruan.com> <1091513004.4660.34.camel@dc.nucleussoftware.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091513004.4660.34.camel@dc.nucleussoftware.com>
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

On Tuesday 03 August 2004 7:04 am, Dhananjoy Chowdhury wrote:

> try dropping packets both with dport 137 and also with sport 137.

I disagree.

Try ACCEPTing the packets you *want* to go through the firewall, and DROP 
everything else.

Don't create individual rules to DROP the traffic you think you don't want 
(you will always forget something, or there will be a new problem next week 
which requires a new rule, etc).

Instead create individual rules to ACCEPT the traffic you need, and DROP 
anything which doesn't fit that description.

Regards,

Antony.

> On Tue, 2004-08-03 at 10:37, david wrote:
> > Dear all,
> > How to block outgoing traffic over network that using port 137 udp,
> > because my isp tell me that my network broadcast virus using port 137
> > udp, i want to make all traffic (port 137) do go outside my network,
> > so i plan to blocking that traffic from my gateway.
> >
> > I already try to do this rules, but not working :
> > #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP
> >
> >
> >
> >
> > Regards,
> > David Kandou

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


