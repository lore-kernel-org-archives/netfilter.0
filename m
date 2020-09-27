From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: rate limit SIP INVITES
Date: Sun, 27 Sep 2020 15:54:47 +0200
Message-ID: <20200927135447.GA8628@salvia>
References: <rko3n2$jjm$1@ciao.gmane.io>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <rko3n2$jjm$1@ciao.gmane.io>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean darcy <seandarcy2@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Sep 26, 2020 at 03:10:24PM -0400, sean darcy wrote:
> nftables-0.9.6
> 
> I'm running a VOIP server. There are lots of script kiddies who will bang
> away with 10/sec SIP INVITES or REGISTERS .
> 
> In iptables you can match on the string:
> 
> -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string "INVITE"
> --algo bm --from 23 --to 28 -m comment --comment "Catch SIP INVITEs" -j
> SIPINVITE
> 
> -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string "REGISTER"
> --algo bm --from 23 --to 30 -m comment --comment "Catch SIP REGISTERs" -j
> SIPREGISTER
> 
> I'm looking at RAW to do the same:

nft add rule x y udp dport 5060 @th,64,48 0x494e56495445 counter

@th => transport header
64  => from bit number 64 (8 bytes after the UDP header)
48  => extract 48 bits (6 bytes for INVITE)
