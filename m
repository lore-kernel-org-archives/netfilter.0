From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables can protect syn-flooding?
Date: Wed, 6 Nov 2002 17:17:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211061717.gA6HHse21337@vulcan.rissington.net>
References: <F124l1k7ZDGRLvoD6ax0001857d@hotmail.com> <001f01c285a6$1246f260$0300000a@hypnos>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001f01c285a6$1246f260$0300000a@hypnos>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wednesday 06 November 2002 3:06 pm, Jon Anderson wrote:

> Can't guarantee that I'm right about the following, or that it's even
> relevant, but based on my experience, the following might help...
>
> SB CH (chulmin2@hotmail.com) wrote:
> > I saw that we can protect syn-flooding using iptables like this.
> >
> > $IPTABLES -N syn-flood
> > $IPTABLES -A INPUT -p tcp --syn -j syn-flood
> > $IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> > $IPTABLES -A syn-flood -j DROP
>
> Of course one could achieve the same thing by using only two rules:
>
> iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j
> ACCEPT
> iptables -A INPUT -p tcp --syn -j DROP

Not really - the shorter version forces all SYN packets below the limit to be 
ACCEPTed, whereas the longer version allows for later rules in the INPUT 
chain to decide whether they ought to be accepted or not, based on the usual 
things like source/destination address/port etc.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

