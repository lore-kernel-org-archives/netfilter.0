From: Florian Westphal <fw@strlen.de>
Subject: Re: rate limit SIP INVITES
Date: Sun, 27 Sep 2020 21:12:31 +0200
Message-ID: <20200927191231.GD31471@breakpoint.cc>
References: <rko3n2$jjm$1@ciao.gmane.io>
 <20200927135447.GA8628@salvia>
 <20200927140356.GA8727@salvia>
 <rkqbsj$top$1@ciao.gmane.io>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <rkqbsj$top$1@ciao.gmane.io>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean darcy <seandarcy2@gmail.com>
Cc: netfilter@vger.kernel.org

sean darcy <seandarcy2@gmail.com> wrote:
> On 9/27/20 10:03 AM, Pablo Neira Ayuso wrote:
> > On Sun, Sep 27, 2020 at 03:54:47PM +0200, Pablo Neira Ayuso wrote:
> > > On Sat, Sep 26, 2020 at 03:10:24PM -0400, sean darcy wrote:
> > > > nftables-0.9.6
> > > > 
> > > > I'm running a VOIP server. There are lots of script kiddies who will bang
> > > > away with 10/sec SIP INVITES or REGISTERS .
> > > > 
> > > > In iptables you can match on the string:
> > > > 
> > > > -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string "INVITE"
> > > > --algo bm --from 23 --to 28 -m comment --comment "Catch SIP INVITEs" -j
> > > > SIPINVITE
> > > > 
> > > > -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string "REGISTER"
> > > > --algo bm --from 23 --to 30 -m comment --comment "Catch SIP REGISTERs" -j
> > > > SIPREGISTER
> > > > 
> > > > I'm looking at RAW to do the same:
> > > 
> > > nft add rule x y udp dport 5060 @th,64,48 0x494e56495445 counter
> > > 
> > > @th => transport header
> > > 64  => from bit number 64 (8 bytes after the UDP header)
> > > 48  => extract 48 bits (6 bytes for INVITE)
> > 
> > @th,offset,length
> > 
> > where offset and length are expressed in bits.
> > 
> Thanks for the response.
> 
> I corrected it , but it didn't work:
> 
> nft list chain filter raw
> table ip filter {
> 	chain raw {
> 		type filter hook prerouting priority raw; policy accept;
> 		udp dport 5060 @th,184,48 80600803923013 counter packets 0 bytes 0
                                   ^^^^
				   64,48

[..]
> Here's the tcpdump output
> 
> 0x0000:  001f 1249 0acc 5254 00e7 8e30 0800 45a0  ...I..RT...0..E.
> 0x0010:  03e1 0000 4000 4011 01dd 511d d3c4 d461  ....@.@...Q....a
> 0x0020:  3b4c 13c4 13c4 03cd 386e 494e 5649 5445  ;L......8nINVITE
> 
> INVITE starts at bit 337 (128 * 2 ) + ( 5 * 16 ) +1, but this is zero based,
> so use 336, correct?

No.  You are asking for @th, so address is relative to the transport (UDP) header,
which is 8 bytes.  So INIVITE starts at bit 64, just like Pablo said.

> As I read your response, it's not the offset from the beginning, but after
> the UDP header,
> so 336 - 120 , or 216. (BTW, I always thought the UDP header was 160 bits.)

No: @ll - start at link layer
    @nh - start at ip/ipv6 header
    @th - start at tcp/udp/whatever transport header protocol is used

The offset is relative to that, not the 'start of packet'.
