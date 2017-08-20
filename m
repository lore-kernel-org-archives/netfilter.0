From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Unable to create set -- neftilter v0.5 on Ubuntu
Date: Sun, 20 Aug 2017 08:49:19 -0700
Message-ID: <b440d665-ccfa-2219-4a77-b14d58e44cdc@allycomm.com>
References: <78d387b7-25bf-3ae9-3b1e-7d6acc5c0d6a@wagsky.com>
 <19D662AE-1A9C-41F2-A2E3-B89668C62720@nativemethods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19D662AE-1A9C-41F2-A2E3-B89668C62720@nativemethods.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: J Doe <general@nativemethods.com>, netfilter@vger.kernel.org

Thanks J!

The "acceptable" syntax could certainly use some better documentation. 
After your suggestion about explicitly declaring the set's "type" I was 
able to get the "right" syntax for nft from the output of "nft list 
ruleset" (including the otherwise undocumented "elements=" syntax):

table inet global {
     set some_addrs {
         type ipv4_addr
         elements = { 192.168.0.1, 192.168.0.2 }
     }
}

At least within an nft file, the parser and compiler are smart enough to 
determine the proper "type" for the set as well as to which table it 
should be associated.


Jeff



Thanks also for the hints on compiling v0.7 under Ubuntu. For those that 
might find this through search, my notes had me needing to install the 
following past what I already had installed (/git/ and /automake/). I am 
not sure if /automake/ is required as it was installed prior to this effort.

libmnl-dev is available as a package. I chose to uninstall and build the 
latest from source. libnftnl in packge form appeared to be several 
versions old in the xenial repositories. I also uninstalled and build 
from source

libgmp-dev might be able to be skipped if you are doing a build that 
uses the "internal" gmp for nftables

--with-mini-gmp         Use builtin mini-gmp (for embedded builds)

libjansson-dev is only needed if you enable JSON parsing within libnftnl

   --with-json-parsing     JSON parsing support


autogen
libtool
bison
flex
pkg-config
libgmp-dev
libreadline-dev

libjansson-dev


Errors along the way to finding the set of required packages for search 
keys:

configure.ac:28: error: possibly undefined macro: AC_DISABLE_STATIC
       If this token and others are legitimate, please use m4_pattern_allow.
       See the Autoconf documentation.
autoreconf: /usr/bin/autoconf failed with exit status: 1

./configure: line 4155: syntax error near unexpected token `LIBMNL,'
./configure: line 4155: `PKG_CHECK_MODULES(LIBMNL, libmnl >= 1.0.0)'

./configure: line 4786: syntax error near unexpected token `LIBMNL,'
./configure: line 4786: `PKG_CHECK_MODULES(LIBMNL, libmnl >= 1.0.3)'


On 8/19/17 9:05 PM, J Doe wrote
> The error is being caused because a table that does not explicitly state it's protocol type is assumed to be of type ip.  In this case, we need to include "inet":
>
> nft add set inet global some_addrs { type ipv4_addr \; }
>
> [...]
>
> If you are building on Ubuntu Server, make sure to grab the build tools:
>
> sudo apt-get install bison flex binutils build-essential autoconf libtool pkg-config
>
> ...and then follow the build steps from the wiki.
>
> One little caveat - once you build libmnl and libnftnl, be sure to run:
>
> sudo ldconfig
>
> ...and then build the nftables code.

