From: sathvanth <sathvanth.subramaniam@ctp.ilabsgroup.com>
Subject: Re: Turning on IP Forwarding
Date: 24 Mar 2003 20:24:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048517685.1042.4.camel@Sath>
References: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
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
To: James Marcinek <james_marcinek@yahoo.com>
Cc: netfilter@lists.netfilter.org

hi,
 u have to do it in two places.
 one /proc/sys/net/ipv4/ip_forward ..echo 1 to this file

the next is /etc/sysctl.conf..set net.ipv4.conf.default.ip_forward=1

hope this helps.

Regds,
sathvanth
On Mon, 2003-03-24 at 18:32, James Marcinek wrote:
> I always foget this.
> 
> Can anyone tell me which file I need to modify to turn
> on IP Forwarding? I know where to do it while the
> system is on; however, since it's a multi-homed system
> and my router, I would like to have it setup
> correctly...
> 
> Thanks,
> 
> James
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
> http://platinum.yahoo.com



