From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat problem
Date: Thu, 15 Jul 2004 09:21:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407150921.27116.Antony@Soft-Solutions.co.uk>
References: <40F448B2.AF1E21@knoware.nl> <200407140953.50466.Antony@Soft-Solutions.co.uk> <40F5C218.E57FEC60@knoware.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F5C218.E57FEC60@knoware.nl>
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

On Thursday 15 July 2004 12:30 am, Frans Luteijn wrote:

> Antony Stone schreef:
> >
> > What happens if you try the same test as above, but with the port numbers
> > you are interested in?   Do the connection tracking table and the log
> > file suggest that packets are being forwarded?   If you can get it to
> > "work" on port 138, I don't see why it shouldn't "work" on port 2071.
>
> Nothing happens, no logging or anything else
>
> So what is wrong here? I think, it is a bug, because it doesn't work as
> expected.

Well, I don't think it can be called a bug in netfilter (I may be wrong), 
because there's nothing about netfilter which should make NAT for one port 
any different from NAT for another port.

I'm surprised you got the port 138 packets to be forwarded; I don't know why 
the two are behaving differently.

> > BTW: I put "work" in quotes there because although you see the packets
> > going through the firewall, does the actual NetBios service allow you to
> > browse Windows shares on machines on the other subnet?   My expectation
> > is not, because there have been many questions on this list previously
> > about share browsing across routers (Windows does network browsing using
> > broadcast packets), the solution to which has always been a PDC on the
> > source network, with knowledge of the second subnet.
>
> That was not my intention. This was only an example to show you, it is
> possible to forward broadcast packets to another network.

Oh, sure - I knew you didn't actually *want* to use port 138, but I was still 
interested to know whether, having got the packets to cross the router, they 
would work and provide your witha  working service.   If not, then it's a bit 
moot as to whether you can forward the broadcasts or not.

I hope someone else here can suggest whether (and if so, how) it's possible to 
do what you want - I didn't think it was, but you've obviously got more to 
work than I had expected possible.

Regards,

Antony.

-- 
"It is easy to be blinded to the essential uselessness of them by the sense of 
achievement you get from getting them to work at all. In other words - and 
this is the rock solid principle on which the whole of the Corporation's 
Galaxy-wide success is founded - their fundamental design flaws are 
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


