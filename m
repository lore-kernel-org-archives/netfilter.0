From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: newbie problem
Date: 17 Feb 2003 11:27:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045477677.2231.88.camel@kermit.spenneberg.de>
References: <1045467799.20801.22.camel@billybob.back2front.homelinux.org> 
	<1045470029.2231.54.camel@kermit.spenneberg.de> 
	<1045477595.21053.2.camel@billybob.back2front.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045477595.21053.2.camel@billybob.back2front.homelinux.org>
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
To: Chris Barnes <runtimeerror@bigpond.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-02-17 um 11.26 schrieb Chris Barnes:
> On Mon, 2003-02-17 at 19:20, Ralf Spenneberg wrote:
> 
> > > 
> ahhh man that was so simple! i should have seen that! thanks heaps for
> pointing it out.
> 
> > By the way, i hope you have not set PREROUTING and POSTROUTING to DROP,
> > do you?
> > 
> 
> PREROUTING and POSTROUTING?? do you mean INPUT and OUTPUT??
> the INPUT,FORWARD,and OUTPUT chains are all set to DROP
> 
If you do not know about PREROUTING and POSTROUTING yet, don't worry and
read up on those. They are needed for NAT and Mangling.

Cheers,

Ralf
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

