From: flaq <flaq@konto.pl>
Subject: IMQ ingress & SNAT
Date: Sat, 02 Aug 2003 19:17:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2BF239.5000700@konto.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Transfer-Encoding: 7bit
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I try to share my connection for two boxes. So i did SNAT on my box for 
my friend.
Question is how to use IMQ ingress with SNATed connections?
When i try to use IMQ device in PREROUTING and mark connections for my 
friend, they aren't SNATed back yet, so i can't use
iptables -t mangle -A PREROUTING -d my_friend_ip -j MARK

Is there any other way to do this?


--
----
Serwery wirtualne, konta e-mail. Oferta nie do odrzucenia.
AlphaNet, http://www.cennik.alpha.pl
----


