From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dropping connections
Date: Fri, 2 Jan 2004 12:57:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021257.22221.Antony@Soft-Solutions.co.uk>
References: <E1AZN5M-0004j4-0w@orcrist.cyberpixels.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AZN5M-0004j4-0w@orcrist.cyberpixels.com>
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

On Thursday 25 December 2003 4:27 am, Ben Prince wrote:

> Hello All,
>
> I am running Redhat 7.3 and installed iptables from the
> iptables-1.2.5-3.i386.rpm found on ftp.redhat.com .  The problem I am
> having is that I can't seem to DROP connections at all.
>
> I am using the following syntax
>
> $IPTABLES -A INPUT -s ip.address.he.re -j DROP

Tell us what the rest of your ruleset is, and what connection you are trying 
to block (ie how are you testiung it and deciding it doesn't work?).

Let's just clarify one thing to begin with - since this rule is in the INPUT 
chain, you *are* trying to block a connection to the machine running 
netfilter / iptables, and not a connection being routed through to somewhere 
else (for which you should use the FORWARD chain), yes?

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


