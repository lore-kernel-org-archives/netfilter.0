From: vic ismakaev <viclists@mail.esoo.ru>
Subject: SNAT & POSTROUTING chain
Date: Thu, 17 Apr 2003 15:09:38 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304171509.38467.viclists@mail.esoo.ru>
Reply-To: viclists@mail.esoo.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi!
I've setup an iptables-1.2.7a.
  When I try add new rule in POSTROUTING chain.

[root@vic 123]# iptables  -A POSTROUTING -p tcp -s 192.168.1.2 -j SNAT -o eth0 
--to-source $REAL_IP
iptables: No chain/target/match by that name

or
[root@vic 123]# iptables -t nat -A POSTROUTING -p tcp  -j SNAT -o eth0 
--to-source $REAL_IP
iptables: Invalid argument

What is it means?

Regards
Victor V Ismakaev

