From: "Michael K" <micke@klintan.se>
Subject: RE: How to log
Date: Wed, 26 Feb 2003 00:03:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2dd22$20e9e060$0200a8c0@klintan.local>
References: <200302251620.36405.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302251620.36405.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

> -----Original Message-----
> From: Joel Newkirk [mailto:netfilter@newkirk.us] 
> Sent: Tuesday, February 25, 2003 10:21 PM
> To: Michael K; netfilter@lists.netfilter.org
> Subject: Re: How to log
> 
> 
> On Tuesday 25 February 2003 04:01 pm, Michael K wrote:
> > When I uses the --jump LOG in iptables it logs to /dev/console. Read
> > the man page for syslog.conf(5) and added "kern.warn 
> /var/log/krnmsg".
> > Restarted syslog; and still it logs to /dev/console.
> 
> You need to use "kern.=warn" to designate a target for kernel warning 
> messages.  You also, IIRC, need to make sure you don't have a kern.* 
> entry before it, or a *.warn.
> 
> > Can I prevent this from happening?
> 
> Possibly.  Check if you have a "kern.*" or any other entry going to 
> "/dev/console", and if you do you can comment it out.
> 
> > Is there another (better) way to log?
> 
> You can use the ULOG target, but you'll need to install a few 
> userspace 
> programs to deal with that.  If all you want is to look through logs 
> occasionally for anything unexpected, or use the log to debug 
> firewall 
> rules as you work, follow the suggestion below.
> 
> > Can't I use something like "iptables.* /var/log/iptables" so that I
> > only get messages from iptables? (Did try it, byt didn't work)
> 
> You can get close to this on most systems.  With most stable-kernel 
> installations you have very few entries in the kernel debug 
> stream, so 
> you can add the parameter "--log-level 7" to you LOG rules, 
> and divert 
> "kern.=debug" in your syslog.conf file to an (almost) 
> iptables-only log.  
> If you also use the "--log-prefix" parameter you can prepend 
> a specified 
> string to each log entry from that rule, to help in reading 
> the log.  A 
> useful example of all this is:
> 
> iptables -A FORWARD -j LOG --log-level 7 --log-prefix "Unexpected 
> Forward:"
> 
> As the last rule in the FORWARD chain.  If you have "kern.=debug 
> /var/log/iptables" in syslog.conf then "cat /var/log/iptables | grep 
> Unexp" would list out all the matching log entries.
> 
> > BTW: the system is Redhat 7.3
> 
> j
> 
Thank you for your great answer. I'll check it later when I am @ work.

Regards Michael



