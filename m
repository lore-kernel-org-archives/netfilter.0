From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: iptables and port 113/auth requests
Date: Tue, 4 Feb 2003 23:25:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c2cc9c$579ce620$0401000a@robbysan.org>
References: <000801c2cc97$6a1feb80$0201a8c0@robs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2cc97$6a1feb80$0201a8c0@robs>
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

> some of my users use mirc on irc servers that required 
> an ident reply (port 113)
> i would like the ident requests from the irc server to 
> be fowarded to the int lan so that mirc can reply to 
> the requests
> i domt know if this is even possible but was wondering 
> if anyone could help me

Did you try using (as one of the first rules) :

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


Rob.


