From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: Strange misunderstandings
Date: Fri, 31 May 2002 23:23:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001a01c208e9$74fac970$026410ac@winxp>
References: <001b01c208e8$2b289530$6301a8c0@JJONES1>
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
To: netfilter@lists.samba.org, jjones@merlintechnologies.com

From: "John Jones" <jjones@merlintechnologies.com>

as iptables -h states :

--check   -C chain

so its: iptables -C <chain name>

and then it works pretty fine.. results into:

iptables v1.2.6a: You need to supply the `-s' option for this command

once you add a -s with value you get:

iptables v1.2.6a: You need to supply the `-d' option for this command

if you add that you get

iptables v1.2.6a: You need to supply the `-p' option for this command

if you add that you get 

iptables v1.2.6a: Need -i with INPUT

and finally you get 

iptables: Will be implemented real soon.  I promise ;)



