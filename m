From: Tib <tib@tigerknight.org>
Subject: Rules not taking effect
Date: Thu, 17 Oct 2002 16:27:27 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210171625040.6045-100000@altaica.tigerknight.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm using 1.2.6a-5 for debian, using init.d scripts. The problem is that 
when I write a rule, it does not take effect. I have also found that a 
rule I had in place from earlier and I flushed it, still worked even 
though iptables -t nat -L showed nothing. I've been told that the module 
ip_conntrack may have something to do with this, but I cannot rmmod it 
because it's busy and insmod says it's already there. 

Any ideas on what I can do?

<EOL>
Tib


