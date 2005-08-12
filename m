From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Troubleshooting stability issue
Date: Fri, 12 Aug 2005 00:14:35 -0500
Message-ID: <42FC303B.30403@riverviewtech.net>
References: <1123689748.21756.TMDA@mercury.zynet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123689748.21756.TMDA@mercury.zynet.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Simon Waters wrote:
> One of our firewalls appears to be unstable.
> 
> The problems started with adding ip_conntrack and ip_conntrack_ftp, as we need 
> to support active mode FTP from inside to the outside.
> 
> Prior to this we were using it as a basic port filter (poor iptables), and so 
> many of the rules exist to allow return packets without connection tracking.
> 
> As such it makes sense for us to "clean-up" the ruleset, but this hasn't 
> happened yet.
> 
> Due to some interesting (and maybe related?) hardware issues, we've run the 
> same firewall configuration on three different servers (all x86, Redhat and 
> Debian, IDE and SCSI), including one with the latest (for Debian) 2.6.8 
> kernel, and are fairly confident we see the same software issue on all three 
> boxes.
> 
> Symptom is that by the time we get to it, the box is totally unresponsive to 
> local console, is not forwarding packets. In a word "hung".
> 
> Memory isn't obviously leaking.

I do not recall what 2.6 kernel it was in, but there was a memory leak that plagued a system that did (extensive?) firewalling / routing in the mid 2.6 kernels.  I ran in to this on a system and ended up croning a reboot daily.  I have not had time to go back and upgrade the system to a kernel that does not have the memory leak.  I am not sure but I think I have 2.6.8 on the box.

> The number of lines in "ip_conntrack" does appear to grow with time, but is 
> still way below (at around 3000) the maximum allowed of 32,000+, and isn't 
> growing monotonically. I think there may be clues here, if only to what is 
> wrong with the ruleset.
> 
> Apart from sshd, there is practically nothing running.
> atd
> crond
> inetd (this has nothing configured in /etc/inetd.conf, so I'll remove it).
> Postfix is listening on 127.0.0.1:25 in case anything local suddenly needs to 
> report anything to me.
> lpd (lpd was running and not listening on any ports, so I'll remove it).
> 
> Just looking for some helpful pointers on how to investigate this issue 
> further.
> 
> As even with a "suboptimal" rule set I wouldn't expect the box to hang.
> Logs have no useful entries (certainly no "table full" messages).
> 
> Don't want to post the full ruleset here, at least not till I've been over it 
> with a finetoothed comb. And it is about 230 lines. On the upside quite a lot 
> of it has just been obseleted by us relocating all our machines to one site, 
> so I can shortly remove large chunks of it.
> 
>  Simon


Grant. . . .

