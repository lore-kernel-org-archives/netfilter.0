From: Patrick Schaaf <bof@bof.de>
Subject: Re: Most stable firewall distro
Date: Thu, 4 Jul 2002 07:37:56 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704073756.B10726@oknodo.bof.de>
References: <JDECKCAAFHMLKEPABBNFAEAKCMAA.miguel.laborde@canada.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <JDECKCAAFHMLKEPABBNFAEAKCMAA.miguel.laborde@canada.com>; from miguel.laborde@canada.com on Wed, Jul 03, 2002 at 06:22:38PM -0400
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
To: Miguel Laborde <miguel.laborde@canada.com>
Cc: netfilter@lists.samba.org

> 	I have a question here for those of you who use iptables heavily in a
> production environment. Right now I am about to replace a older Mandrake
> (release 7.2) with an updated linux firewall however before I go ahead and
> do that, I'm interested in knowing what you people consider the most stable
> distribution for a linux firewall.

Easy: all of them.

> 	I realize that the underlying OS and iptables software is common across all
> distributions however some distributions apply patches which others don't,
> and as result might be better suitable as a firewall.

No. Some distros package one or the other precanned firewall script.
You should be sceptical of all of them, and write your own, in my
opinion.

I don't know of any distribution that patched iptables itself with
stuff not available through CVS/patch-o-matic anyway.

If you are interested in security aspects besides the firewalling code,
please ask the appropriate fora.

best regards
  Patrick

