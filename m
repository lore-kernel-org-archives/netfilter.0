From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Excluding IP ranges from masquerade rules
Date: Mon, 13 Oct 2003 12:03:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031013125520.A8BA91B9BC@smtp.ttp.nl>
References: <1066038290.5801.35.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066038290.5801.35.camel@tarkus>
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

> I presently exclude 1 ip block in POSTROUTING using "! 
> X.X.X.X/24" . Is their a way to specify multiple ranges that 
> are excluded?

If you mean to specify a range instead of a complete block, there is a
Netfilter "iprange" patch for that. You'll have to compile a new kernel
and iptables.
http://www.netfilter.org/documentation/pomlist/pom-base.html#iprange
Create multiple rules for each range you want to exclude.

> Is their a way to have POSTROUTING only have affect on a 
> certain interface?

iptables -t nat -A POSTROUTING -o <if_out> ...
You cannot use "-i <if_in>".
See "man itables".


Rob


