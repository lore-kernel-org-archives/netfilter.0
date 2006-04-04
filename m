From: Alexandre Rouillac <alexandre.rouillac@gmail.com>
Subject: Re: iptables -A INPUT -j LOG does not log anything
Date: Tue, 04 Apr 2006 16:02:06 +0200
Message-ID: <44327C5E.4050800@gmail.com>
References: <442E3D8B.9060804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442E3D8B.9060804@gmail.com>
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

dmesg command give the DROPed packet.

Someone can help ?

Thanks for help.

Alexandre Rouillac wrote:
> Hi all,
> 
> I set my iptables with policy "-P INPUT DROP" and my last line of INPUT 
> chains to "-A INPUT -j LOG".
> 
> So everything packets not matching my INPUT rules will be LOG and DROP.
> 
> My problem is that iptables does not log anything to my syslog file.
> 
> I checked the syslogd configuration (debian default):
> 
> *.*;auth,authpriv.none          -/var/log/syslog
> 
> kern.*                          -/var/log/kern.log
> 
> *.=info;*.=notice;*.=warn;\
>         auth,authpriv.none;\
>         cron,daemon.none;\
>         mail,news.none          -/var/log/messages
> 
> 
> I checked counters of INPUT chains :
> 20       3   144 LOG        all  --  *      *       0.0.0.0/0 
>  0.0.0.0/0           LOG flags 0 level 4
> 
> But nothing on my logfiles (syslog, messages, kern.log).
> 
> Does someone can help ?
> 
> Best Regards,
> Alexandre
> 
> 
> 


