From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: one to one NAT
Date: Tue, 10 Sep 2002 09:09:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020910080959.NOLE292.mta01-svc.ntlworld.com@there>
References: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com> <20020910002200.VICK295.mta06-svc.ntlworld.com@there> <3D7D9146.3080905@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7D9146.3080905@fugmann.dhs.org>
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

On Tuesday 10 September 2002 7:29 am, Anders Fugmann wrote:

> Antony Stone wrote:
> > On Tuesday 10 September 2002 2:10 am, Michael wrote:
> >>I want to map 1.2.3.5 to a single address behind the linux box
> >>1.2.3.5 is mapped to eth1:0
> >
> > iptables -A PREROUTING -a nat -d 1.2.3.5 -j DNAT --to 192.168.1.19
> > iptables -A FORWARD -d 192.168.1.19 -j ACCEPT
>
> This only takes care of the ingoring part. Outgoing would be solved
> by using SNAT:
> $ iptables -A POSTROUTING -t nat -s 1.2.3.5 -j SNAT \
> 	--to-source 192.168.1.19
> $ iptables -A FORWARD -s 192.168.1.19 -j ACCEPT
>
> (Antony made a small typo - it should have been '-t nat' and not '-a
> nat', unless Im mistaken)

Yes, I did make a typo - thanks for spotting that - it should indeed be '-t 
nat'.

However, the SNAT rule is not necessary if all you're doing is making 
services on the internal machine available to the Internet (which is what you 
said you wanted to do).   Incoming connections will be translated by the DNAT 
rule, and outgoing replies will be automatically reverse translated by the 
magic of netfilter.   You do not need a SNAT rule to get the replies back to 
the outside world.

You would want a SNAT rule only if the machine inside your network needs to 
initiate connections to the Internet, *and* they need to come from the same 
public address as that machine is being made accessible on.   If it doesn't 
initiate its own connections, you don't need SNAT, or if it does but it 
doesn't matter what the source address of those connections is, then it can 
just use the normal SNAT or MASQUERADE rule which you presumably have to 
allow the rest of your network to get to the outside world.

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

