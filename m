From: "Vladimir Potapov" <mailarchives@mail.ru>
Subject: RE: Gigabit
Date: Wed, 10 Mar 2004 00:44:48 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FOELKOFDAANJCBHBJNEBMEOGCCAA.mailarchives@mail.ru>
References: <7A3B4AA360FDEF448F3390421FC8D7311B9D61@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <7A3B4AA360FDEF448F3390421FC8D7311B9D61@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com
Cc: netfilter@lists.netfilter.org


Anthony makes a good point.  'Need' is probably going to be the biggest
factor here.  For example, what exactly does gigabit to the VPN net you?  If
it's intended that internet users be the ones who use the VPN to access the
subnets, how many concurrent users would saturate your internet pipe?  My
guess is that this would happen far sooner than would your over running the
bandwidth that 100mbps can get you.  It does depend on the size of your
internet pipe, but it would have to be pretty broad.

Now, one could make a case for gigabit from subnet1 to subnet2.  In this
situation, however, maybe a nice managed Cisco switch would suit your needs
a little better than a netfilter firewall?  No offense to anyone is
intended, and it may not even be applicable, but it's my two-cents anyway.


Gigabit need only for access to the intranet web-server with board, chat,
VPN-statictics and other.We haven't enough money to the cisco or AT.


