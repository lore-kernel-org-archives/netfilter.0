From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp access problem
Date: Sat, 24 Jul 2004 14:13:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241413.48571.Antony@Soft-Solutions.co.uk>
References: <a0f69e504072403057b210342@mail.gmail.com> <200407241122.16298.Antony@Soft-Solutions.co.uk> <a0f69e5040724044591804e0@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040724044591804e0@mail.gmail.com>
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

On Saturday 24 July 2004 12:45 pm, Askar Ali Khan wrote:

> Hi Antony,
>
> On Sat, 24 Jul 2004 11:22:16 +0100, Antony Stone wrote:
> >
> > I see you are doing NAT on this firewall.   Do you have the nat_ftp
> > support module loaded or compiled in to your kernel?
>
> #modprobe nat_ftp
>    modprobe: Can't locate module nat_ftp

Okay, that may not be the exact name of it - I don't use modules, so perhaps 
someone else here can tell you the definitive name for the module?

Try lsmod to see what you already do have loaded - if youo find something 
which looks like NAT and FTP, then you've got it already.

> I modprobe for nat_ftp on my route/firewall "slackware 2.4.26" and
> also on another machine FC1 and both return the same thing.
> what to do now?
> May I have to go for kernel compilation? :(

I always build a monolithic (non-modular) kernel for firewalls; the option for 
the FTP tracking which you need are "CONFIG_IP_NF_FTP" and 
"CONFIG_IP_NF_NAT_FTP".

> Also pls check these echos and I will greatly appreciate if you
> explain the usage of this echos becuase i copied it from somewhere
> else :D
>
> echo 1 > /proc/sys/net/ipv4/ip_dynaddr
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
> echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

Try:

http://www.linuxsecurity.com/articles/network_security_article-4528.html
http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.kernel.obscure.html

and on your own machine:
/usr/src/linux/Documentation/networking/ip-sysctl.txt

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


