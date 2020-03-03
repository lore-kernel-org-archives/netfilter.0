From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables offload doesn't seem to work
Date: Tue, 3 Mar 2020 14:36:35 +0100
Message-ID: <20200303133635.z3a5bxxfgksjx3zg@salvia>
References: <20200301151148.44bd0e5e@moya.linuxfreak.ca>
 <20200301151504.78592af2@moya.linuxfreak.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200301151504.78592af2@moya.linuxfreak.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McLean <chutzpah@gentoo.org>
Cc: netfilter@vger.kernel.org

On Sun, Mar 01, 2020 at 03:15:04PM -0800, Patrick McLean wrote:
> On Sun, 1 Mar 2020 15:11:48 -0800
> Patrick McLean <chutzpah@gentoo.org> wrote:
> 
> > Hi,
> > 
> > I am trying to test the nftables offload support, as describe in
> > https://lwn.net/Articles/810663/
> > 
> > When I try to load the rules, or check a rules file, nft errors out, it
> > appears that it does not understand "flags offload;":
> > 
> > # nft --check --file test.nft
> > test.nft:6:51-55: Error: syntax error, unexpected flags
> >                 type filter hook ingress device if0 priority 0; flags offload;
> > 
> > Here is the contents of the file I am trying to load:
> > 
> > table netdev filter_test {
> >     chain ingress {
> >         type filter hook ingress device eth0 priority 0; flags offload;
> > 
> >         192.168.0.10 tcp dport 22 drop
> Oops, copy/paste error, this line is:
> ip daddr 192.168.0.10 tcp dport 22 drop
> >     }
> > }
> > 
> > I am using the 5.4.22 kernel with nftables 0.9.3

You have to use a nftables snapshot from git.netfilter.org.

Please, remember to invoke ethtool first:

        ethtool -K eth0 hw-tc-offload on

I'm planning to explore a way to make this transparent to the user, so
the offload flag implicitly turns on this toggle, so users do not have
to invoke ethtool and the 'flags offload' becomes sufficient to turn
on hardware offload.

Please, note that basechain priorities are restricted to 1 to
USHRT_MAX.

        type filter hook ingress device eth0 priority 1; flags offload;
                                                      ^

Such basechain priority limitation might be removed in the future,
however, that will require cooperation from network driver
maintainers.
