From: tonton19 <tonton19@voila.fr>
Subject: ROUTE + SNAT Problem
Date: Wed,  4 Feb 2004 17:13:39 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12462133.1075911219098.JavaMail.www@wwinf4001>
Reply-To: tonton19@voila.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've got a very strange problem using ROUTE and SNAT targets.
First, I type these two rules : 
# iptables -t nat -A PREROUTING -d 20.1.0.1 -p tcp --dport 80 -j DNAT --to-destination 173.20.0.210
# iptables -t nat -A POSTROUTING -d 173.20.0.210 -p tcp --dport 80 -j SNAT --to-source 20.1.0.2

everything works, all is ok, each packet which matches with the first rule, matches with the second too. But, when I declare the following rule :
# iptables -t mangle -A POSTROUTING -d 173.20.0.210 -p tcp --dport 80 -j ROUTE --oif eth0
the second rule (with SNAT target) no longer works !!! I can see with iptables -t nat --list --verbose that no packet match with the second rule. In the other hand the third rules (with ROUTE target) works well. So, please help me ! Wat's the problem ? Is there an incompatibility beetween ROUTE and SNAT targets ? or my rules are not good ?
Thank you for your help
Gwen

------------------------------------------

Faites un voeu et puis Voila ! www.voila.fr 



