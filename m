From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: DNAT query
Date: Fri, 11 Nov 2005 05:30:20 -0500
Message-ID: <20051111103020.GB18203@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I am trying to redirect trafffic from outside to an internal machine.  
The setup is SuSE Linux 9.1 (i586) 2.6.4-52-default
# iptables --version
iptables v1.2.9

When I give,
# iptables -t nat -I OUTPUT -d dyn.example.com -p tcp --dport 8000 -j DNAT --to-destination 192.168.10.2:8000
iptables: Target problem

What exactly is wrong? If I try it on my Mandrake box it works. Any 
ideas?
Thanks in advance.
With warm regards,
-Payal



