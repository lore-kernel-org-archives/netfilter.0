From: Jason Opperisano <opie@817west.com>
Subject: Re: ip aliasing considered harmful?
Date: Mon, 10 Jan 2005 08:38:55 -0500
Message-ID: <1105364334.12623.5.camel@hubcap.ljm.dom>
References: <BAY101-F28F59D9C013C228CBEAFC8DF970@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F28F59D9C013C228CBEAFC8DF970@phx.gbl>
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
To: netfilter@lists.netfilter.org

On Mon, 2005-01-10 at 01:46, Curby . wrote:
> I've currently got two Internet-facing IP addresses on my gateway using a 
> single interface.  I have them configured as eth0:0 and eth0:1, but I've 
> read several times on this list that doing it this way (I think it's called 
> aliasing?) is not recommended.  IIRC the recommended alternative was to use 
> the ip command to handle it.

that is correct.

> Why is that alternative preferable?  The only thing I can see now is that 
> I'd have to double the number of iptables rules in some cases to take care 
> of eth0:0 and eth0:1 instead of just eth0. 

that's why 'ip addr add w.x.y.z dev eth0' is preferable--it doesn't
delude you into thinking you have multiple interfaces, because you
don't.  try and add a rule for eth0:0 and let us know how it goes.

> If i use ip, can I simply point 
> all rules to eth0 instead of eth0 and eth0:1?

yes--as eth0 is the only actual interface in this example.  eth0:0 and
eth0:1 are a figment of your imagination perpetuated by the use of the
ifconfig command.

> Lastly, are there any downsides at all for doing it with ip? 

no.

> For example, 
> eventually I'll want to SNAT and DNAT packets based on whether they're 
> related to one Internet-facing IP or another, and I just want to make sure 
> that would still be possible.  Thanks!

yes.  the only distinguishing feature of the packet is the IP--the only
interface involved here is eth0.

-j

--
"If something is to hard to do, then it's not worth doing."
	--The Simpsons


