From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall and trusting state ESTABLISHED :)
Date: Tue, 9 Dec 2003 20:15:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312092015.49175.Antony@Soft-Solutions.co.uk>
References: <20031209125417.2b031b99.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209125417.2b031b99.mgale@utilitran.com>
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

On Tuesday 09 December 2003 7:54 pm, Michael Gale wrote:

> Seems like a dumb question -- I guess what I really should be asking is how
> secure is "-m state --state ESTABLISHED" ?

As far as I'm aware, the strength of this rule is exactly the same as whatever 
rules you have allowing NEW connections to become ESTABLISHED.

In other words, I think the simpler version of the rule is perfectly good 
enough.   Specifying things like the source port adds nothing, because the 
connection tracking system is already based on {source,destination}{IP,port}.

If packets which you don't want seem to be coming in as ESTABLISHED, then 
there's something wrong with what you accepted as NEW in the first place.


Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


