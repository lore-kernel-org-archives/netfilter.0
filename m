From: "Cool Man" <ouba974@hotmail.com>
Subject: Does my NETFILTER Bridge Work ?
Date: Wed, 09 Oct 2002 17:52:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F38LFfJNwPmxd22RQY30001949c@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I have a Linux 2.4.19 (Mandrake)with the Bridge and Netfilter Kernel 
configuration. I DO only bridge no NAT. I have no ip address for my firewall 
linux server.
The bridge works fine but i have some trouble with iptables.
I make a iptables -L and i see that i have no rules.
i put a rule : iptables -A FORWARD -s <my ip address> -j DROP
and it's doesn't work. I would like to drop all ip packet that come from my 
ip for test.
How can i see if my IPtables NETFILTER really works ?
Thanks for helping me..




_________________________________________________________________
Discutez en ligne avec vos amis ! http://messenger.msn.fr


