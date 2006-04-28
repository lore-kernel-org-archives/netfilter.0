From: Juan Pablo Abuyeres <jpabuyer@tecnoera.com>
Subject: to SMP or not to SMP?
Date: Fri, 28 Apr 2006 10:12:12 -0400
Message-ID: <1146233532.7235.277.camel@blackbird.tecnoera.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi guys,

I've been using an old single processor / linux 2.4 iptables based 
firewall for a few years.

Now it's time to upgrade that machine, so, I am wondering, would it be 
of real benefit if I put a two-processor system for a firewall? This 
machine is going to have 4 NICs, it's going to make routing (lots of 
routes), and firewall (iptables). I don't know if these kind of tasks 
take advantage from a multiple-processor architecture. Please enlighten 
me :)

Thank you!



