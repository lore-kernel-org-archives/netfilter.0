From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Tue, 11 Aug 2015 12:19:25 +0530
Message-ID: <CAA5aLPgWeNWKJiXd9m2tQMs6OzZbVHW7Zzkg4V4C7QNpnyu2AQ@mail.gmail.com>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
	<CAA5aLPjJsA0Lc+wLjHTk3Bj4vtnLAOzfbVBvpsquMZTcA+hBpA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=mXinaMxa8U6E7K3+YPPZedyNIQ6hrHicvqHnb6FEX1s=;
        b=TMuk5+GFioHLKyEzQBvTbC3BflYD4EkPhi7fOTvAG38s7uncMe5ZJy2oK8RBrZAZxu
         dsZ2e+3jpsYe/ZOCF2qQxVJcNfkEUbr0rDzpJwrupBQhHHhc4Txw5rwrmiWwD9Yr9kg5
         XpAwMCEHoGWRF/MHQwX4y9uaWwliI+BTpMLEN2oDWJGe476/qmLBWN9oQdLYqXEofNuZ
         oxSZk6Z4HALAoNezCZjcsBMDQdW9Vm4VhsjJYZllEKX77jJXDzwvE5yOWxkr4Nk0o4Mf
         /GvLN/AIVeuvGN0QLrOrgsfgLtDLdD3ZPdtJYCZNjqtkk3jX5FIW05hgxMsKbFEQN+ch
         +TGA==
In-Reply-To: <CAA5aLPjJsA0Lc+wLjHTk3Bj4vtnLAOzfbVBvpsquMZTcA+hBpA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

o/p of make tests


cd tests; ./runtest.sh
You have got iptables rules: skipping inet match and target tests
ip6tables does not support set match, skipping inet6 match and target tests
init: Load in the ip_set kernel module: passed
init: List our test set: the testsuite fails if it exists: passed
init: Delete our test set: the testsuite fails if it exists: passed
init: Check mandatory create arguments: passed
ipmap: Range: Check syntax error: missing range/from-to: FAILED
Failed test: ../src/ipset 2>.foo.err -N test ipmap
ipset v6.25.1: Kernel error received: set type not supported
make: *** [tests] Error 1



On Tue, Aug 11, 2015 at 12:02 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> o/p of ipset help
>
> is
>
> ipset v6.25.1
>
> Usage: ipset [options] COMMAND
>
> Commands:
> create SETNAME TYPENAME [type-specific-options]
>         Create a new set
> add SETNAME ENTRY
>         Add entry to the named set
> del SETNAME ENTRY
>         Delete entry from the named set
> test SETNAME ENTRY
>         Test entry in the named set
> destroy [SETNAME]
>         Destroy a named set or all sets
> list [SETNAME]
>         List the entries of a named set or all sets
> save [SETNAME]
>         Save the named set or all sets to stdout
> restore
>         Restore a saved state
> flush [SETNAME]
>         Flush a named set or all sets
> rename FROM-SETNAME TO-SETNAME
>         Rename two sets
> swap FROM-SETNAME TO-SETNAME
>         Swap the contect of two existing sets
> help [TYPENAME]
>         Print help, and settype specific help
> version
>         Print version information
> quit
>         Quit interactive mode
>
> Options:
> -o plain|save|xml
>        Specify output mode for listing sets.
>        Default value for "list" command is mode "plain"
>        and for "save" command is mode "save".
> -s
>         Print elements sorted (if supported by the set type).
> -q
>         Suppress any notice or warning message.
> -r
>         Try to resolve IP addresses in the output (slow!)
> -!
>         Ignore errors when creating or adding sets or
>         elements that do exist or when deleting elements
>         that don't exist.
> -n
>         When listing, just list setnames from the kernel.
>
> -t
>         When listing, list setnames and set headers
>         from kernel only.
> -f
>         Read from the given file instead of standard
>         input (restore) or write to given file instead
>         of standard output (list/save).
>
> Supported set types:
>     list:set            3       skbinfo support
>     list:set            2       comment support
>     list:set            1       counters support
>     list:set            0       Initial revision
>     hash:mac            0       Initial revision
>     hash:net,iface      6       skbinfo support
>     hash:net,iface      5       forceadd support
>     hash:net,iface      4       comment support
>     hash:net,iface      3       counters support
>     hash:net,iface      2       /0 network support
>     hash:net,iface      1       nomatch flag support
>     hash:net,iface      0       Initial revision
>     hash:net,port       7       skbinfo support
>     hash:net,port       6       forceadd support
>     hash:net,port       5       comment support
>     hash:net,port       4       counters support
>     hash:net,port       3       nomatch flag support
>     hash:net,port       2       Add/del range support
>     hash:net,port       1       SCTP and UDPLITE support
>     hash:net,port,net   2       skbinfo support
>     hash:net,port,net   1       forceadd support
>     hash:net,port,net   0       initial revision
>     hash:net,net        2       skbinfo support
>     hash:net,net        1       forceadd support
>     hash:net,net        0       initial revision
>     hash:net            6       skbinfo support
>     hash:net            5       forceadd support
>     hash:net            4       comment support
>     hash:net            3       counters support
>     hash:net            2       nomatch flag support
>     hash:net            1       Add/del range support
>     hash:net            0       Initial revision
>     hash:ip,port,net    7       skbinfo support
>     hash:ip,port,net    6       forceadd support
>     hash:ip,port,net    5       comment support
>     hash:ip,port,net    4       counters support
>     hash:ip,port,net    3       nomatch flag support
>     hash:ip,port,net    2       Add/del range support
>     hash:ip,port,net    1       SCTP and UDPLITE support
>     hash:ip,port,ip     5       skbinfo support
>     hash:ip,port,ip     4       forceadd support
>     hash:ip,port,ip     3       comment support
>     hash:ip,port,ip     2       counters support
>     hash:ip,port,ip     1       SCTP and UDPLITE support
>     hash:ip,mark        2       sbkinfo support
>     hash:ip,mark        1       forceadd support
>     hash:ip,mark        0       initial revision
>     hash:ip,port        5       skbinfo support
>     hash:ip,port        4       forceadd support
>     hash:ip,port        3       comment support
>     hash:ip,port        2       counters support
>     hash:ip,port        1       SCTP and UDPLITE support
>     hash:ip             4       skbinfo support
>     hash:ip             3       forceadd support
>     hash:ip             2       comment support
>     hash:ip             1       counters support
>     hash:ip             0       Initial revision
>     bitmap:port         3       skbinfo support
>     bitmap:port         2       comment support
>     bitmap:port         1       counters support
>     bitmap:port         0       Initial revision
>     bitmap:ip,mac       3       skbinfo support
>     bitmap:ip,mac       2       comment support
>     bitmap:ip,mac       1       counters support
>     bitmap:ip,mac       0       Initial revision
>     bitmap:ip           3       skbinfo support
>     bitmap:ip           2       comment support
>     bitmap:ip           1       counters support
>     bitmap:ip           0       Initial revision
>
> On Tue, Aug 11, 2015 at 12:01 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>> Hi!
>> I am running sl6.3 (i.e. kernel 2.6.32-279). I upgraded the kernel
>> using elrepo to kernel 4.1.4.
>> Then I downloaded ipset 6.25.
>> I executed follwing commands
>> ./autogen.sh
>> ./configure
>> make
>> make modules
>> make install
>> make modules_install
>>
>> No error is generated at any step
>>
>> Now when I want to creat an uipset using command
>> ipset -N foo hash:ip
>>
>> I get error
>> ""
>> ipset v6.25.1: Kernel error received: set type not supported
>> ""
>>
>> output of uname -r
>>
>> 4.1.4-1.el6.elrepo.x86_64
>>
>>
>>
>>
>> o/p of " find /lib/modules/4.1.4-1.el6.elrepo.x86_64 -name ip_set.ko"
>>
>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko
>>
>>
>>
>> o/p of "find /lib/modules -name ip_set.ko"
>>
>> /lib/modules/2.6.32-279.el6.x86_64/extra/ip_set.ko
>> /lib/modules/2.6.32-279.el6.x86_64/kernel/net/netfilter/ipset/ip_set.ko
>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko
>>
>>
>> please help....
