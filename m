From: "Clint Todish" <ctodish@crayon.com>
Subject: RE: Does my NETFILTER Bridge Work ?
Date: Wed, 9 Oct 2002 13:52:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c26fc4$f8b17dd0$0800640a@motion>
References: <F38LFfJNwPmxd22RQY30001949c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F38LFfJNwPmxd22RQY30001949c@hotmail.com>
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
To: 'Cool Man' <ouba974@hotmail.com>, netfilter@lists.netfilter.org

Did you apply the bridge-nf patch (bridge.sourceforge.net / downloads)?

-C

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Cool Man
Sent: Wednesday, October 09, 2002 12:52 PM
To: netfilter@lists.netfilter.org
Subject: Does my NETFILTER Bridge Work ?


Hi,
I have a Linux 2.4.19 (Mandrake)with the Bridge and Netfilter Kernel 
configuration. I DO only bridge no NAT. I have no ip address for my
firewall 
linux server.
The bridge works fine but i have some trouble with iptables.
I make a iptables -L and i see that i have no rules.
i put a rule : iptables -A FORWARD -s <my ip address> -j DROP and it's
doesn't work. I would like to drop all ip packet that come from my 
ip for test.
How can i see if my IPtables NETFILTER really works ?
Thanks for helping me..




_________________________________________________________________
Discutez en ligne avec vos amis ! http://messenger.msn.fr


