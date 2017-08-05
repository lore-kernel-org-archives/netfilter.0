From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: LXC and netfilter log
Date: Sat, 5 Aug 2017 02:00:38 +0200
Message-ID: <20170805000038.76w6id6hb6bl43ep@unicorn.suse.cz>
References: <2002586.aotkqkl0s5@home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2002586.aotkqkl0s5@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aeris <aeris@imirhil.fr>
Cc: netfilter@vger.kernel.org, lxc-users@lists.linuxcontainers.org

On Fri, Aug 04, 2017 at 09:02:44PM +0200, aeris wrote:
> Hi here !
> 
> I have trouble with LXC and netfilter logging.
> 
> Configuring traffic log works like a charm on a baremetal machine and finish in /
> var/log/syslog as expected, but logs nothing when inside a LXC container, both 
> with iptables and nftables

Logging from network namespaces other than init has been disabled since
kernel 3.10 in order to prevent host kernel log flooding from inside
a container.

If you have kernel >= 4.11 or one with commit 2851940ffee3 ("netfilter:
allow logging from non-init namespaces") backported, you can enable
netfilter logging from other network namespaces by

  echo 1 >/proc/sys/net/netfilter/nf_log_all_netns

(the command must be issued from init_net).

> I try to install ulogd2 on my container too, no more luck.

Logging via NFLOG target and ulogd2 should work even without the sysctl
mentioned above, IIRC.

                                                         Michal Kubecek

