From: "Ed _" <ed_b_71@hotmail.com>
Subject: Re:Installing Netfilter 1.2.8
Date: Tue, 10 Jun 2003 07:29:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law14-F43mxhU5fT5ah00017714@hotmail.com>
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
To: madjack@madjackal.org
Cc: netfilter@lists.netfilter.org

Hi Brian,

Thanks for your response, A few clarifcation

1) Next, make the package.
        % make KERNEL_DIR=<<where-you-built-your-kernel>>

ed>>> I never build my kernel using RdHat 9.0 so what should the KERNEL_DIR 
point to ?
           Should it be to the lib dir ? /lib/modules/2.4.20-13.9/kernel/
<< ed

2) Finally, you need to to install the shared libraries, and the binary:
        # make install KERNEL_DIR=<<where-you-built-your-kernel>>

If you are a developer, you can install the headers, development libraries
and associated development man pages, with:
        # make install-devel

ed>> is there no need to specify the dir here?
<<ed


Lastly, I presume one has to be root while doing all this?





>From: Brian Wong <madjack@madjackal.org>
>To: ed_b_71@hotmail.com
>Subject: Re:Installing Netfilter 1.2.8
>Date: Tue, 10 Jun 2003 18:36:14 +0800
>
>Hello there. Regarding your question, just download the .tar.gz file and 
>read
>the INSTALL file. you dont have to recompile the kernel unless ya plan to 
>add
>new patches through patch-o-matic
>
>When you finished install 1.2.8, login as root and type iptables -V to 
>check
>the version. See ya.

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


