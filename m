From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: question about -t nat
Date: Sat, 19 Jun 2004 17:40:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087684836.8013.3.camel@hawk.wittenberg.org>
References: <000701c45626$e27411a0$6900a8c0@W2K>
	 <1087670301.2051.0.camel@localhost>  <000b01c45637$42d805a0$6900a8c0@W2K>
	 <1087683517.2052.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087683517.2052.3.camel@localhost>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-06-19 at 17:18, John A. Sullivan III wrote:
> On Sat, 2004-06-19 at 15:54, Postmaster wrote:
> > > But what, exactly, is the question?
> > 
> > I'm not sure after your question. The following error "iptables: target
> > problem" comes, if i enter this rule in a user-chain:
> > iptables -t nat -A first_group -s a.b.c.d -d x/y -p tcp --dport 10001  \
> > -j DNAT --to-destination 1.2.3.4:25

DNAT target can only be used with PREROUTING and OUTPUT.

Dan


