From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 11:21:50 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310281119400.23830-100000@localhost.localdomain>
References: <FDB52A0429DFD31196FB0008C7D972D50EA578CF@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA578CF@OST_EXCH_USR5>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

On Tue, 28 Oct 2003, Knight, Steve wrote:

> I get the picture - so you can have "external-SSHD-access" chain, and
> "external-SMTP-access" chain, rather than a huge pile of rules which you
> could risk blamming, in a rushed moment.
> 
> I have mr Ziegler's esteemed tome [it seemed to be v highly regarded after a
> snoop around googly groups] and it's damn fine, it's what I'm working from
> to configure my fw.  Its so rigorous though that I can get easily lost in
> there!
> 
> Sorry for the ultra-lamer question now...
> 
> is it the case that for each rule on the INPUT chain you must have the
> corresponding OUTPUT rule also?  i.e. if I say
> 
> <pseudocode>
> Accept from ANYWHERE spt:1024...65535 LOCALHOST dpt:22
> </pseudocode>
> 
> Do I also have to put a corresponding response rule in --- 
> 
> Accept from LOCALHOST spt:22 ANYWHERE dpt:1024...65535
> 
> In order to allow the response through?
> OR does the fact I've put an "accept from anywhere to SSHD" rule, imply that
> I want to allow the service to respond.
> 
> Again, sorry for what seems like an ultra stupid question, but it's not 100%
> clearly stated in ziegler, at least after two reads of the relevant chapter.

what you want in ziegler is in the middle of p. 120 -- the rules to
allow all incoming and outgoing traffic that's RELATED,ESTABLISHED.
what those rules do is allow all traffic in either direction that's
*related* to an existing connection.  so you just need to set up
your rules to allow/deny the *initial* request, and those two rules
will automatically use connection tracking to allow subsequent traffic
that's related to that original request.

rday


