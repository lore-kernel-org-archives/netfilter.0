From: "Ed _" <ed_b_71@hotmail.com>
Subject: RE: Removing netfilet 1.2.7a
Date: Wed, 11 Jun 2003 15:07:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law14-F25dZqBMh5Waz0004d860@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rob@sterenborg.info
Cc: netfilter@lists.netfilter.org

Before installing the latest iptables v 1.2.8 on RedHat 9.0, am trying to 
remove the older version.

there seem to be a series of dependencies on v1.2.7a like "lokkit" which in 
turn is a dependecy on "redhat-config-securitylevel-1.1.1-3" should I remove 
all of these too?

or should I remove iptables without a dependency check
# rpm -e --nodeps iptables


-e


>From: "Rob Sterenborg" <rob@sterenborg.info>
>To: "'Ed _'" <ed_b_71@hotmail.com>
>Subject: RE: Removing netfilet 1.2.7a
>Date: Wed, 11 Jun 2003 23:48:16 +0200
>
> > # rpm -e iptables
> > error: Failed dependencies:
> >         iptables is needed by (installed) lokkit-0.50-22
> > >>>there seems to be a dependency.
>
>You don't need lokkit. "rpm -e lokkit" ;^)..
>After that, "rpm -e iptables".
>
>"Trust me, I know what I'm doing.." Heheh..
>Well, yes : you don't need it !
>
From some website :
>"Lokkit is a tool that writes generic firewall configurations based on
>..."
>
>You'd better write your own rules so you know what's going on in your
>packetfilter.
>I never used Lokkit, don't know anyone who use[s/d] it, don't know how
>it works, but it's one of the things that I uninstall when I find it.
>

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online  
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


