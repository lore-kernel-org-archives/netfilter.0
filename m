From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Alias with iptables
Date: Mon, 19 Apr 2004 22:31:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404192231.42723.Antony@Soft-Solutions.co.uk>
References: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx> <200404191625.45747.Antony@Soft-Solutions.co.uk> <200404191612.39869.Alistair@nerdnet.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191612.39869.Alistair@nerdnet.ca>
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

On Monday 19 April 2004 5:12 pm, Alistair Tonner wrote:

> On April 19, 2004 03:25 pm, Antony Stone wrote:
> >
> > I suggest another firewall then - trying to set up a firewall with only
> > one ethernet interface is a poor enough solution (from a security point
> > of view) in the first place, but if there is wireless access involved as
> > well then I would not even consider it.
>
> 	Thanks Antony  -- again you have expressed precisely what I would have
> said -- succinctly and clearly.
>
> 	Aliased (stacked) interfaces ARE NOT SECURE.  Period.

Indeed.   I would like to see this emphasised more in the netfilter howtos & 
tutorials.   Multiple addresses on one interface are all very well, so long 
as they exist within the same subnet; however anyone trying to use multiple 
*network* addresses on one physical interface is defeating their security by 
ignoring what the different OSI network layers mean.

Even someone who thinks "I have a switch; my packets cannot be sniffed" simply 
hasn't investigated Dug Song's (and similar) network tools sufficiently.

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


