From: "riffraff" <riffraff@mail.ev1.net>
Subject: Re: Most stable firewall distro
Date: Wed,  3 Jul 2002 17:23:13 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207031723.AA92536958@mail.ev1.net>
Reply-To: <riffraff@mail.ev1.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

---------- Original Message ----------------------------------
From: "Miguel Laborde" <miguel.laborde@canada.com>
Date: Wed, 3 Jul 2002 18:22:38 -0400

>Hello all,
>	I have a question here for those of you who use iptables heavily in a
>production environment. Right now I am about to replace a older Mandrake
>(release 7.2) with an updated linux firewall however before I go ahead and
>do that, I'm interested in knowing what you people consider the most stable
>distribution for a linux firewall.
>	I realize that the underlying OS and iptables software is common across all
>distributions however some distributions apply patches which others don't,
>and as result might be better suitable as a firewall.
>
>
>	Thanks for your time,
>				Miguel
>
>
>
>
I just used redhat 7.0 (I think, it's been a while), and removed everything that was completely unnecessary, then compiled a whole new kernel (I had to; I'm using the bridge-netfilter patch).  So, it isn't much of a redhat anymore, just uses redhat paths and rpm.



