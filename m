From: "Muhammad Talha" <talha@worldcall.net.pk>
Subject: Re: kernel 2.6.x and iptables
Date: Tue, 13 Jan 2004 16:53:19 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008401c3d9cb$d634aa30$23c051cb@ns3.worldcall.net.pk>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk> <200401130503.39528.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


>
>   for both users with the 'failed to initialize' error -- 1) did you build
iptables as modules or
>  into the kernel?

as module

-- 2) are you *certain* you disabled ipchains

Yes i disable ipchains
.
> 3) are you *certain* that you built iptables with the correct kernel?
>    -- if you change kernels you usually have to rebuilt the iptables
code -- 
> export KERNEL_DIR=xxxxx make
> where xxxxx is the full path to your appropriate kernel source code.
>

yes i select correct kernel

export KERNEL_DIR=/usr/src/linux-2.6.1
then
make & make install

>   this is usually caused after a kernel rebuild by building modules and
NOT loading them, especially
> if the iptables stuff was built into the kernel in the previous kernel.
> -- try
> insmod ip_tables
>  you might get yet another error ...
>

Yes u r right :(

insmod ip_tables

Can't open 'ip_tables' : No such file or directory

there is no module ip_module i have search the system

> Ummm ...anyone know off the top if RedHat puts iptables in as modules or
builds it in?
>
>
> Alistair
>


