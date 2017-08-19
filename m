From: J Doe <general@nativemethods.com>
Subject: Re: Failure with autogen.sh when building libnftnl
Date: Sat, 19 Aug 2017 18:57:38 -0400
Message-ID: <6EDD0B3E-C7DC-4F8B-9D7F-90CD5DA885CC@nativemethods.com>
References: <B934F71F-B5FF-4B6A-8AA7-1C479F09E760@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B934F71F-B5FF-4B6A-8AA7-1C479F09E760@nativemethods.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> On Aug 19, 2017, at 3:16 PM, J Doe <general@nativemethods.com> wrote:
> 
> Hello,
> 
> I am currently attempting to build libnftnl as per the instructions on the wiki [1]
> 
> $ git clone git://git.netfilter.org/libnftnl
> $ cd libnftnl
> $ sh autogen.sh
> 
> autogen fails with the following error code:
> 
> configure.ac.28: error: possibly undefined macro: AC_DISABLE_STATIC
>   If this token and others are legitimate, please use m4_pattern_allow.
>   See the Autoconf documentation.
> autoreconf: /user/bin/autoconf failed with exit status: 1
> 
> What am I currently doing wrong ?
> 
> Thanks,
> - J
> 
> Sources:
> [1] wiki.nftables.org/wiki-nftables/index.php/Building_and_installing_nftables_from_sources

Hello,

As an update to this e-mail - it turns out I did not have a complete set of build tools.  Ubuntu Server 16.04.03 LTS does not install them by default.

$ sudo apt-get install bison flex binutils build-essential autoconf libtool pkg-config

Then I install from packages the two dependencies that nftables requires.

$ sudo apt-get install libgmp-dev libreadline-dev

Then I proceed with building the libmnl and libnftnl libraries as per the wiki instructions.

Lastly I had to update the path to the libraries

$ LD_LIBRARY_PATH=/usr/local/lib
$ export LD_LIBRARY_PATH

Running nft now shows the correct version.

$ nft -v
nftables v0.7 (Scrooge McDuck)

Regards,

- J


