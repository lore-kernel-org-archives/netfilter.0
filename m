From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT of ICMP fragmentation-nee
Date: Mon, 10 Jun 2002 16:01:27 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101501.g5AF1aU08786@vulcan.rissington.net>
References: <Pine.LNX.4.44.0206101340570.30649-100000@albert.ha-vel.cz> <200206101218.g5ACIKU08127@vulcan.rissington.net> <20020610145244.GU29214@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020610145244.GU29214@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 10 June 2002 3:52 pm, Ramin Alidousti wrote:

> On Mon, Jun 10, 2002 at 01:18:12PM +0100, Antony Stone wrote:

> > Hmmm.   Okay - this is beyond my understanding of netfilter - can anyone
> > else suggest why icmp packets going through the machine would get logged
> > and processed by PREROUTING and FORWARD but not by POSTROUTING ?

> Is it not because of the fact that the very first packet of a conn
> would go through the whole nat rule set and as soon as a rule is
> matched and a conn has been set up, the subsequent packets of that
> conn would not go through the whole rule set but get natted and
> de-natted by that entry? I thought I read this somewhere...
>
> So, if you also had a DNAT for that conn in PREROUTING, after the
> first initial packet (which sets up the dnat entry), no other packet
> of that conn would scan through the PREROUTING rule set including
> the LOG rule...
>
> However, the filter table is always consulted for each and every
> packet, that's why you see the LOG in the FORWARD chain...

I see what you're saying here, Ramin - basically anything which is being 
'automatically' de-NATted because of an entry in the conntracking table 
doesn't go through the ruleset because (a) that's inefficient, and (b) it 
might do something which messes up the automatic de-NATting itself.

However, it seems like a bit of a 'gotcha' which should be better documented, 
if you can't LOG any packet you want to, at every stage as it makes its way 
through your machine...?

 

Antony.

