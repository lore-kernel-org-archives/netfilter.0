From: "Muhammad Talha" <talha@worldcall.net.pk>
Subject: Re: kernel 2.6.x and iptables
Date: Tue, 13 Jan 2004 20:33:53 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012001c3d9ea$a64d8a20$23c051cb@ns3.worldcall.net.pk>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk> <008401c3d9cb$d634aa30$23c051cb@ns3.worldcall.net.pk> <00c201c3d9ce$62968d70$23c051cb@ns3.worldcall.net.pk> <200401130838.47327.Alistair Tonner <>>
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

Thanks Alistair for respones

there is no .o file there only .ko i think these are changed in 2.6.x kernel
i see them when kernel is compiling as well

there is /etc/rc.local which can load things @ startup in RedHat

thanks and Regards

Talha

----- Original Message ----- 
From: <Alistair Tonner>
To: "Muhammad Talha" <talha@worldcall.net.pk>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, January 13, 2004 6:38 PM
Subject: Re: kernel 2.6.x and iptables


> On January 13, 2004 07:11 am, Muhammad Talha wrote:
> > i insert modules located at /lib/modules/2.6.1/kernel/net/ipv4/netfilter
> >
> > like
> >
> > insmod ip_tables.ko
> > insmod iptables_filter.ko
> >
> AHhhhh ...
>    Your modutils is out of date.
>    -- insmod ip_tables should have worked.
>      if you had to append the .ko something is wrong ....
>
> to make it permanent, ........ I'm a slackware user ... I put things like
that in /etc/rc./modules ... which loads modules on startu p ..
> I don't know the equivalent file on redhat ...
>
>
> > and others now iptables works just fine
> >
> > but i after reboot i have to insert them again
> > how to make them permanent ???
> >
> > Thanks and Regards
> >
> > Talha
> >
> >
> >
> >
> > ----- Original Message -----
> > From: "Muhammad Talha" <talha@worldcall.net.pk>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Tuesday, January 13, 2004 4:53 PM
> > Subject: Re: kernel 2.6.x and iptables
> >
> > > >   for both users with the 'failed to initialize' error -- 1) did you
> >
> > build
> >
> > > iptables as modules or
> > >
> > > >  into the kernel?
> > >
> > > as module
> > >
> > > -- 2) are you *certain* you disabled ipchains
> > >
> > > Yes i disable ipchains
> > > .
> > >
> > > > 3) are you *certain* that you built iptables with the correct
kernel?
> > > >    -- if you change kernels you usually have to rebuilt the iptables
> > >
> > > code --
> > >
> > > > export KERNEL_DIR=xxxxx make
> > > > where xxxxx is the full path to your appropriate kernel source code.
> > >
> > > yes i select correct kernel
> > >
> > > export KERNEL_DIR=/usr/src/linux-2.6.1
> > > then
> > > make & make install
> > >
> > > >   this is usually caused after a kernel rebuild by building modules
and
> > >
> > > NOT loading them, especially
> > >
> > > > if the iptables stuff was built into the kernel in the previous
kernel.
> > > > -- try
> > > > insmod ip_tables
> > > >  you might get yet another error ...
> > >
> > > Yes u r right :(
> > >
> > > insmod ip_tables
> > >
> > > Can't open 'ip_tables' : No such file or directory
> > >
> > > there is no module ip_module i have search the system
> > >
> > > > Ummm ...anyone know off the top if RedHat puts iptables in as
modules
> > > > or
> > >
> > > builds it in?
> > >
> > > > Alistair
>
>


