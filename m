From: Atsushi Nakagawa <atnak@chejz.com>
Subject: Re: Dropping RST of SYN
Date: Mon, 08 Sep 2003 20:58:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030908204206.C148.ATNAK@chejz.com>
References: <1063000297.827.26.camel@india.nsecure.net> <3F5C539E.8030704@chrisbrenton.org>
Reply-To: Atsushi Nakagawa <atnak@chejz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5C539E.8030704@chrisbrenton.org>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: "Dharmendra.T" <dharmu@nsecure.net>, Ralf Spenneberg <lists@spenneberg.org>, Netfilter <netfilter@lists.netfilter.org>

Chris Brenton <cbrenton@chrisbrenton.org> wrote:
> Dharmendra.T responded:
> > On Thu, 2003-09-04 at 14:43, Ralf Spenneberg wrote:
> > > Am Don, 2003-09-04 um 10.50 schrieb Atsushi Nakagawa:
> > > > What iptables table/rule can I use to drop RST (TCP) packets
> > > > that're in reply to SYN?
> > >
> > > There is no way to differentiate between this RST and a later valid
> > > and needed RST packet.  You can only drop all RST packets
> > > -m state --state ESTABLISHED -p tcp --tcp-flags RST,ACK RST,ACK -j DROP
> >
> > Blocking the RST packets on the firewall is not recommended. If the 
> > attacker comes to know that the server is dropping RST packets then he 
> > can flood the servers by initiating lacks of connections, which inturn 
> > result closewait state.
> 
> Ya know, I missed this the first time through but Dharmendra is 
> absolutely right. This will make you far more susceptible to SYN flood 
> attacks.
>
> ...

Both Dharmendra and Chris have pointed out perfectly legitimate reasons
why it is a bad idea to drop RSTs in general.  However, these warnings
have taken the original proposition slightly out of context. --AFAIS

Ralf's response was to a question regarding the removal of outgoing RST
packets that are generated in reply to incoming SYN packets.  (These
RSTs being the kind that causes the "Connection Refused" TCP message)

Hence, "dropping all RST packets", should implicitly have meant, "all
outgoing RST packets".  (The -m state ... -j DROP line is ambiguous.)

In this case, there should be no consequences with SYN flood-type
attacks.  The only ill-effect, AFAIK, is with abortive disconnects not
reaching remote host (and remote host will resend obselete packets
little more times).  --A problem enough to deter me from implmementing
this.

Regards,


-- 
Atsushi Nakagawa
<atnak@chejz.com>
Changes are made when there is inconvenience.


