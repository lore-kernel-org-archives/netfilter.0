From: leolistas@solucoesip.net
Subject: Re: Most stable firewall distro
Date: Wed,  3 Jul 2002 21:44:53 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025743493.3d239a8591444@www.solucoesip.net>
References: <JDECKCAAFHMLKEPABBNFAEAKCMAA.miguel.laborde@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <JDECKCAAFHMLKEPABBNFAEAKCMAA.miguel.laborde@canada.com>
Content-Disposition: inline
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
To: netfilter@lists.samba.org


   I have several firewalls ( some with heavy traffic ) running over 
redhat 7.2 and 7.3. In both cases, I used to recompile the whole kernel to 
the newest ( 2.4.18 - even in rh73, which already cames with 2.4.18 ). In 
my custom kernel compilation, i apply some patchs from iptables patch-o-
matic to enable some modules like psd, string, iplimit, and others. I also 
need to uninstall RPM iptables and recompile iptables from sources ( 
1.2.6a ), so those kernel compiled modules can be used.

   Of course, custom installation is done and all unnecessary packages ( 
KDE and stuff ) are not installed. I need to install some devel packages 
so I can compile things with no problems. My rh installations uses about 
650Mb.

   Well, hope this helps you ...... I really have no problems with redhat 
and I'd recommend it.

   Sincerily,
   Leonardo Rodrigues


Citando Miguel Laborde <miguel.laborde@canada.com>:

> Hello all,
> 	I have a question here for those of you who use iptables heavily 
in a
> production environment. Right now I am about to replace a older Mandrake
> (release 7.2) with an updated linux firewall however before I go ahead
> and
> do that, I'm interested in knowing what you people consider the most
> stable
> distribution for a linux firewall.
> 	I realize that the underlying OS and iptables software is common 
across
> all
> distributions however some distributions apply patches which others
> don't,
> and as result might be better suitable as a firewall.
>

