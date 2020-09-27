From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: rate limit SIP INVITES
Date: Sun, 27 Sep 2020 22:59:18 +0200
Message-ID: <20200927205918.GA11212@salvia>
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

On Sun, Sep 27, 2020 at 11:42:08AM -0400, sean darcy wrote:
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
> 		udp dport 5060 @th,184,64 5928222864759342418 counter packets 0 bytes 0

This should be:
                               @th,64,48 0x494e56495445 counter

you specify offset to 184, that does not look fine.

If you want to match INVITE right after the UDP header, in the initial
6 bytes of the payload, then offset is 64 bits give that UDP header is
8 bytes (64 bits).

Note that @th specifies that the offset is relative to the transport
header offset. Similarly, @nh specifies the offset relative to the
network header.

I tried it here with nc -u and sending the string INVITE and it works
fine.
