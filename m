From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT with log
Date: Fri, 6 Sep 2002 15:53:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209061453.g86Ersv02326@vulcan.rissington.net>
References: <5.1.0.14.2.20020905100458.00ad6de0@mail.pop-pa.rnp.br> <5.1.0.14.2.20020906113700.04fc8cd8@10.15.1.3>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20020906113700.04fc8cd8@10.15.1.3>
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

On Friday 06 September 2002 3:43 pm, Fabio Yu Nagahama wrote:

> Well ,I'm using SNAT and I need to make the NAT dinamically, and also, I
> need to have a log.
> My rule is something like this:
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to <range1> --to <range2>
> --to <range3> ... <range6>, where eth1 is the external interface.

Does that really work ?   I've never tried using the SNAT target with 
mutliple --to arguments; I didn't know it could take more than one.

> I can't make one-to-one map because I my network is very big, and I don't
> have enough valid address.

You could split up your internal network by address range and always SNAT 
internal range 1 to external address 1, internal range 2 to external address 
2, etc ?   Then you will know that if a machine in range 2 connects to the 
Internet, its packets will have source address 2.

Why do you want to know this correspondence between internal and external 
addresses anyway ?   The only reason I can think of is for logging which 
machines did what in case someone comes along later and complains about one 
of your users, so you can work out which user it was.   If that's what you 
want to do, I'd suggest you look at a network IDS such as Snort.

If you want to do something else, tell us what you need and we'll see if we 
can think of anything.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

