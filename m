From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Kernel options and loadable modules
Date: Sun, 8 Dec 2002 12:43:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c29eae$fbfbb370$0401000a@robbysan.org>
References: <F150MozgYLowspDKicU0001ede9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F150MozgYLowspDKicU0001ede9@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Afshin Lamei' <linux_st@hotmail.com>, netfilter@lists.netfilter.org

> There are several kernel options needed for firewalling, wich must
be
> selected while compiling the kernel, such as :
> CONFIG_NETFILTER, CONFIG_PACKET, CONFIG_IP_NF_CONNTRACK, etc.
> I want to now that what is the differnce between the kernel
> options and
> loadable modules such as ip_nat_ftp, ip_tables, ... ? Are
> they the same in

The kernel options are meant to :
- if you want to include them, if yes :
- if you want to compile them into your kernel,
- if you want to compile them as modules so you can load them later.
If you compiled an option, it is either a module or in the kernel.
There is no importance difference between the two as they are mutual
exclusive. (AFAIK you can't compile an option into the kernel and as a
module.)

The modules you need to load at runtime depend on what options you
compiled as module and want to use.
If you don't want to use a module, you don't load it . If you compiled
an option into the kernel and want to use it, you don't have to load
the module as there is no module.
If you didn't compile an option at all, obviously you can't use it.

Hope this answers your question.


Rob


