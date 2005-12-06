From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Ping flood
Date: Tue, 6 Dec 2005 21:34:11 +0000
Message-ID: <20051206213411.GK21572@metastasis.org.uk>
References: <43677BFD.3080805@darkstar.nom.za>
	<200511011119.31267.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200511011119.31267.rob0@gmx.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 01, 2005 at 11:19:31 -0600, /dev/rob0 wrote:
> On Tuesday 2005-November-01 08:30, Paulo Andre wrote:
> > I have the following log:
> > Nov  1 09:10:40 guardian ---SA_IN--- IN=eth1 OUT=
> > MAC=ff:ff:ff:ff:ff:ff:00:e0:1e:83:d5:19:08:00  SRC=64.34.170.237
> 
> Who is this?
> 
> $ host 64.34.170.237
> 237.170.34.64.in-addr.arpa domain name pointer server1.ircnapoli.com.
> $ whois $_
> Peer 1 Network Inc. PEER1-BLK-08 (NET-64-34-0-0-1)
>                                   64.34.0.0 - 64.34.255.255
> ServerBeach PEER1-SERVERBEACH-02 (NET-64-34-160-0-1)
>                                   64.34.160.0 - 64.34.191.255
> ...
> $ host server1.ircnapoli.com.
> server1.ircnapoli.com has address 64.34.170.237
> 
> > DST=255.255.255.255 LEN=1072 TOS=00 PREC=0x40 TTL=243 ID=12209 DF
> > PROTO=ICMP TYPE=8 CODE=0 ID=0 SEQ=0
> 
> That's a broadcast ping.

The thing is, seeing as it's to 255.255.255.255 rather than the local
broadcast address, I've a feeling packet is being generated locally in
some way, rather than being sent to the broadcast address on the
original poster's network from the remote host.

Although the TTL would appear to refute that hypothesis.

I can't actually force IPtables to log pings to the broadcast address on
the boxes I have to hand, that I've sent from a host outside of the
local network, but looking at tcpdump the destination address is
definitely the IP address of the local broadcast address rather than
255.255.255.255.

Paulo, what has a MAC address of 00:e0:1e:83:d5:19 on your LAN?

-- 
deviants are sacrificed to increase group solidarity
Jenny Solzer

