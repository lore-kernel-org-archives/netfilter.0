From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: cbq.init and iptables NAT routing
Date: Thu, 3 Oct 2002 09:30:39 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210030928220.22286-100000@ts1.alberni.net>
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

I am running Linux 2.4.5 with two Ethernet cards as a NAT router (using
iptables).  I downloaded the cbq.init script so that I could try shaping the
traffic coming from and going to the internal network.  I am also using
iptables for IP accounting.  I can shape traffic on ETH1, which is the
inside NIC, but I cannot shape the traffic going out on ETH0.  None of the
traffic reaches my classes.  Is there any known incompatabilities between
cbq and iptables?

-- 
Aaron Clausen


