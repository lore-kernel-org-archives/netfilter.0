From: "Nishit Shah" <nishit@elitecore.com>
Subject: RE: iphash vs iptreemap
Date: Thu, 19 Jun 2008 17:05:46 +0530
Message-ID: <001501c8d200$9da55430$d8effc90$@com>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com> <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu> <000a01c8d1f0$a48d2990$eda77cb0$@com> <Pine.LNX.4.64.0806191144130.11904@blackhole.kfki.hu> <000f01c8d1f6$c98a1950$5c9e4bf0$@com> <Pine.LNX.4.64.0806191246100.11904@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806191246100.11904@blackhole.kfki.hu>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> 	Also, what is significant of --gc parameter in iptreemap ?
> 	Does it make difference in testing ? 

It governs how often garbage collector is run to release empty leaves 
and branches. Of course it has an effect on the current memory usage.

Just a clarification here. 

What I understand is, If I don't have entries with --timeout values in
iptreemap (as currently --timeout is not supported in iptreemap), do we
really need --gc ? Can't we do it on ADD/UPDATE/DELETE/FLUSH events on set ?

Rgds,
Nishit Shah. 

