From: David Cary Hart <DCH@TQMcube.com>
Subject: Re: Still having problems...
Date: Wed, 30 Jun 2004 16:44:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088628262.4626.0.camel@localhost>
References: <9E8B5B9C-CAC3-11D8-A356-000A95AD0230@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9E8B5B9C-CAC3-11D8-A356-000A95AD0230@mac.com>
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
To: Sam Loy <sampaw@mac.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-30 at 14:30, Sam Loy wrote:
> I sorry to be such a newbie, but I still cannot get my firewall up and 
> running.
> 
> Actually, I had it working with the enclosed script, until I generated 
> /etc/sysconfig/iptables using /sbin/service iptables save.
> 

I'm  not sure what OS you are using but I have found that the easiest
way to configure netfilter is through the Webmin modules. Have you tried
it.
> After I tried to get things to spin up at boot time it quit 
> working...not sure what I did.
> 
> I erased my tracks, can still ping and set the net before loading 
> iptables. Afterwords, I can't even ping the 192.168.1.1 interface on 
> the same machine!
> 
> Anyway, jason, antony, dick, a lot of you have been very helpful. Thank 
> you so much for your continued help and patience.
> 
> It is starting to make sense, but I still don't get it. I'm also in 
> processing of up2dating my linux. maybe that will help.
> 
> fwscript is the script I'm using (from Jason with slight mods). I run 
> it after I connect ppp0 and get an ip from my isp, before running 
> dhcpd. stillnowork is the output of iptables-save.
> 
> Like I said, it worked until I tried to get it to start at boot time.
> 
> Thanks,
> 
> Sam
-- 
                            David Cary Hart
Hart's PGP key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x58A60BB1


