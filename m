From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Ping flood
Date: Tue, 6 Dec 2005 21:11:48 +0000
Message-ID: <20051206211148.GJ21572@metastasis.org.uk>
References: <43677BFD.3080805@darkstar.nom.za> <4367A11D.8000205@nemesys.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4367A11D.8000205@nemesys.hu>
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

On Tue, Nov 01, 2005 at 06:08:45 +0100, Zoltan Nagy wrote:
> Paulo Andre wrote:

> > I have the following log:
> > Nov  1 09:10:40 guardian ---SA_IN--- IN=eth1 OUT=
> > MAC=ff:ff:ff:ff:ff:ff:00:e0:1e:83:d5:19:08:00  SRC=64.34.170.237
> > DST=255.255.255.255 LEN=1072 TOS=00 PREC=0x40 TTL=243 ID=12209 DF
> > PROTO=ICMP TYPE=8 CODE=0 ID=0 SEQ=0
> > 
> > I am receiving thousands of these a day, icmp traffic is blocked
> > with iptables. But still this traffic is coming up the line. Is my
> > only solution to contact the ISP or is there something I can do in
> > iptables/linux?
> > 
> > Paulo

> consider dropping all multicast packets
> $ipt    -d 224.0.0.0/4                  -j DROP

If the destination IP address is 255.255.255.255, and multicast traffic
defined by "224.0.0.0/24" is from 224.0.0.0 to 239.255.255.255, this
won't make any difference will it?

-- 
deviants are sacrificed to increase group solidarity
Jenny Solzer

