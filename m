From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open port to specific ip address
Date: Mon, 10 Nov 2003 13:26:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101326.hAADQXj16843@agate.rockstone.co.uk>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za> <1068469729.1530.15.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068469729.1530.15.camel@valhalla>
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

On Monday 10 November 2003 1:08 pm, Chris Brenton wrote:

> On Mon, 2003-11-10 at 07:01, Lohan Spies wrote:
> > Antony,
> >
> > I tried this but it is not working!
>
> I'm not so sure you can actually get this to work.
>
> > It is TCP
> >
> > I want to map (internal) 10.10.10.41 port 15000 to (external)
> > 196.2.147.208 port 80.
> > And then if anything from ip 196.2.147.208 port 80 comes back it must be
> > forwarded to 10.10.10.41 port 15000.
>
> This second half of the equation is the problem.
>
> The traffic come in from the Internet to your internal IP.

Come in from the Internet?   No, that wouldn't work.   You can't route a 
packet to 10.10.10.41 across the Internet.

I assumed (maybe wrongly?) that because Lohan specified an internal IP 
address, the access was required from the internal network.

> You then
> rewrite the destination IP to go back to some other host on the
> Internet. The host on the Internet then replies with a SYN/ACK to the
> source IP address, which is the original host on the Internet.

Well, so long as the SYN packet arrived in the first place, yes.

I hope this is not an accurate model of what Lohan is trying to do :)

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them
                                                     Please reply to the list;
                                                           please don't CC me.

