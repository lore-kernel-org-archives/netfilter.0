From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: OT: Logs on console
Date: Sat, 17 Jul 2004 05:24:18 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e5040716192464c9c89a@mail.gmail.com>
References: <40F7BB44.24155.3BC614@localhost> <200407161942.32228.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407161942.32228.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

This is done by printk, and it can be changed via sysct, look what i
have in sysctl to stop printk showing the logs to the monitor:
kernel.printk= 3 4 1 7
or:
echo "3 4 1 7" > /proc/sys/kernel/printk

On Fri, 16 Jul 2004 19:42:32 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> On Friday 16 July 2004 8:25 pm, Victor Wren wrote:
> 
> > This is off-topic, but IPTABLES is the only place I have this problem.
> >
> > I've got all my log entries set to --log-level
> > info, and they're getting properly logged to an iptables logfile, but they
> > are still showing up on the screen
> 
> Show us the contents of your /etc/syslog.conf
> 
> Regards,
> 
> Antony.
> 
> --
> "The problem with television is that the people must sit and keep their eyes
> glued on a screen; the average American family hasn't time for it."
> 
>  - New York Times, following a demonstration at the 1939 World's Fair.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

