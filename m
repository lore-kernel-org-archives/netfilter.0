From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: Placement of Iptable Scripts
Date: Thu, 04 Jul 2002 23:09:45 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYR00H8HIGDCA@l-daemon>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from Mark_Vuong@Dell.com on Thu, 04 Jul 2002 21:57:16 -0500


> I'm relatively new to iptables and have the following question.
> 
> where is the best place to place my iptable bash script so that it loads my
> iptable chains and rules when my server reboots?

If I'm not mistaken, one of the distinguishing features of iptables viz. ipchains is that iptables is able to define rules for various interfaces (except for ppp?) before those interfaces are brought up on the network. So for maximum security, the best place to put your script is somewhere before the network interfaces are initialized. Some would say that since the time between bringing up the network and loading of the iptables rules (dead last would be if you put your script in rc.local) is small anyway, this issue about loading the iptables rules before the network interfaces comes up is a moot point. However, I bring my ruleset up first and it functions well. I guess I'm just paranoid.

jb

