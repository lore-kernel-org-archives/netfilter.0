From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: Question
Date: Sat, 22 Jun 2002 02:26:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001201c21983$724d3d70$11c810ac@honor>
References: <004001c21949$b966bc20$0201a8c0@power>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Krish Ahya <Krish@houston.rr.com>, netfilter@lists.samba.org

From: Krish Ahya

> I was just wondering, is Netfilter as good as Cisco's PIX and Checkpoint's
Firewall-1, if not better?

its hard to compare apples with pears.. one is a firewalling system..
netfilter is more or less a packet filter....

> Also I'm wondering say if I have a dmz and allow people to come into a
server on port 80, will netfilter inspect the packet on all
> 7 layers of the OSI model and make sure that it is actually a http packet
and following the rules and protocol specifications of
> http? Sorta like checkpoints INSPECT module.

as netfilter is "only" a packet filter (with some additional modules to
provide more functions) you will stick with stuff like string match and all
modules you would like to provide the netfilter community (if you code them
yourself)




