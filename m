From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: ftp access problem
Date: Sat, 24 Jul 2004 16:45:46 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040724044591804e0@mail.gmail.com>
References: <a0f69e504072403057b210342@mail.gmail.com> <200407241122.16298.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241122.16298.Antony@Soft-Solutions.co.uk>
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

Hi Anthony,
 
On Sat, 24 Jul 2004 11:22:16 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> On Saturday 24 July 2004 11:05 am, Askar Ali Khan wrote:
> 
> > Hi
> >
> > On my router/firewall which acting i am getting problem while anyone
> > tries to connect to ftp server he connected successfully however when
> > he types and command for example "ls" ftp server return error "500
> > Illegal PORT range rejected"
> > Everything else is working fine.
> 
> I see you are doing NAT on this firewall.   Do you have the nat_ftp support
> module loaded or compiled in to your kernel?
> 
> Without that module, netfilter will not see the PORT commands in the FTP
> packets, and will not know what to do with the data connection on port 20
> associated with the control connection onn port 21.
#modprobe nat_ftp
   modprobe: Can't locate module nat_ftp

I modprobe for nat_ftp on my route/firewall "slackware 2.4.26" and
also on another machine FC1 and both return the same thing.
what to do now?
May I have to go for kernel compilation? :(

Also pls check these echos and I will greatly appreciate if you
explain the usage of this echos becuase i copied it from somewhere
else :D

echo 1 > /proc/sys/net/ipv4/ip_dynaddr                 
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects


> 
> Regards,
> 
> Antony.
> 
> --
> "The joy of X!!??  I've always hated compiling graphical shite.  You have a 10
> line program, and it ends up depending on the entire known universe."
> 
> - Philip Hands
> 
>                                                     Please reply to the list;
>                                                           please don't CC me.
> 
>

