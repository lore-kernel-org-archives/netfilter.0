From: Unknown <unknown@unknown.invalid>
Subject: Re: kernel 2.6.x and iptables
Date: Tue, 13 Jan 2004 05:03:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <48311.5160991021$1073988370@news.gmane.org>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk>
Content-Disposition: inline
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
To: Muhammad Talha <talha@worldcall.net.pk>, netfilter@lists.netfilter.org

On January 13, 2004 04:22 am, Muhammad Talha wrote:
> Dear all
>
> i have upgraded kernel 2.4.20 to kernel 2.6.1 and i have same problem with
> 2.6.0 kernel as well
> OS Redhat
> module-init-tools 0.9.13
>
> but i am iptables stop working its was iptables-1.2.7
> then i upgraded to iptables to 1.2.9 ( lastest ) still same problem
>
> error message i get
>
> iptables v1.2.9:can't initialize iptables table 'filter' iptables who? (do
> you need to insmod)
> Perhaps iptables or kernel needs to be upgraded.
>
> i aslo get these kind of errors when compiling iptables-1.2.9
>
> /usr/src/linux-2.6.1/include/linux/compiler-gcc3.h:22:1 warning
> ""__attribute_pure__" redefined
> In file included from  /usr/include/feature.h:291
>                        from  /usr/include/stdio.h:28
>                        from extensions/libipt_conntrack.c:5
> /usr/include/sys/cdefs.h:183 warning this the location of the prevoius
> definiation
>
	The redefinition warnings are just that -- warnings -- they only indicate that the headers
in /usr/include/x don't agree with stuff in netfilter ... they won't likely inhibit the compile or the 
operation of iptables.

  for both users with the 'failed to initialize' error -- 1) did you build iptables as modules or 
 into the kernel? -- 2) are you *certain* you disabled ipchains.  
3) are you *certain* that you built iptables with the correct kernel?
   -- if you change kernels you usually have to rebuilt the iptables code -- 
export KERNEL_DIR=xxxxx make
where xxxxx is the full path to your appropriate kernel source code.

  this is usually caused after a kernel rebuild by building modules and NOT loading them, especially 
if the iptables stuff was built into the kernel in the previous kernel.  
-- try
insmod ip_tables
 you might get yet another error ...

	Ummm ...anyone know off the top if RedHat puts iptables in as modules or builds it in?


Alistair

