From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Source NAT
Date: Sat, 3 Sep 2005 15:29:54 -0500
Message-ID: <200509031529.54803.rob0@gmx.co.uk>
References: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
	<200508310637.33322.rob0@gmx.co.uk>
	<WorldClient-F200509031428.AA28260029@acerlandslp.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200509031428.AA28260029@acerlandslp.com.mx>
Content-Disposition: inline
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

On Saturday 2005-September-03 14:28, ISC Jorge Ceron Galvan wrote:
> > > I currently have a situation that I am hoping iptables can
> > > resolve. The issue is that I need to NAT the source address based
> > > on the destination address. Is that possible with IPTables ?
> >
> > Trivial.
> >
> > > if dst = 1.1.1.1 src = 10.1.1.1
> >
> > iptables -vt nat -A POSTROUTING -d 1.1.1.1 -j SNAT -to 10.1.1.1
>
> why -vt?
>
> this rule confused me, I'm a begginer;

All the more reason to RTFM, as previously suggested. Hint: the -v 
option to iptables does the same thing as does the -v option to most 
other command line programs.

> what about
>
> iptables -t nat -A POSTROUTING -s 10.1.1.1/24 -j SNAT --to 1.1.1.1

This is not what the OP said was wanted. That is SNAT based on the 
source address, not the destination.

> iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.1/24 -j SNAT --to
> 1.1.1.1

Same thing, with the additional specification of output interface. You 
can, of course, specify more matching options to limit the packets 
selected by the rule. It *is* common to limit SNAT based upon source 
address too.

> > > Can anyone give me any advice on completing that?
> >
> > "man iptables"
> >
> > Order matters. If you have a catchall SNAT rule before the specific
> > destination ones, the catchall is the one used.
> >
> > NAT != routing. If your SNAT'ed IP addresses need to go out
> > different interfaces, this won't work. See the LARTC HOWTO.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

