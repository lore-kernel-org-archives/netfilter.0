From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Performance Monitoring
Date: Sun, 11 Jan 2004 23:32:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401112332.40921.Antony@Soft-Solutions.co.uk>
References: <004401c3d17c$4baa7cc0$0a01000a@xcom1> <20040110000419.GA25191@cannon.eng.us.uu.net> <4001DB98.9090607@lintelsys.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4001DB98.9090607@lintelsys.com.au>
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

On Sunday 11 January 2004 11:26 pm, Alex Satrapa wrote:

> Ramin Dousti wrote:
> > One can come up with a btree which should reduce the worst case lookup to
> > a max of 8 lookups for a /24.
>
> It'd be better if netfilter supported some way of either binding rules
> to an interface, or allowing a hashtable-lookup for a "jump" based on IP
> address.

It normally isn't much of a problem, because for most people, using the state 
match means that only the first packet of a new connection has to go through 
the ruleset looking for a rule to fnd out whether it's ACCEPTed or not - all 
future packets for the connection (assuming it gets ESTABLISHED) match on the 
very first rule and the whole system is quite efficient.

Of course, if you're not using state matching then the above does not apply, 
but this is why statefulness is one of the good bits about netfilter.

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid user's mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


