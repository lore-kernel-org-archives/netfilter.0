From: Damijan Sencar <damijan.sencar@zrs-tk.si>
Subject: Re: Logging NEW ssh connections
Date: Fri, 31 May 2002 09:55:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF72C7E.8050006@zrs-tk.si>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E79B7@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.samba.org>

It works now!

Thanx,

Damijan

Omar Castaneda Acosta wrote:

>Make these changes to your firewall script:
>
>if [ -n "`$IPTABLES -L | $GREP log-and-forget`" ]; then
>   $IPTABLES -F log-and-forget
>fi  
>
>....
>
>$IPTABLES -N log-and-forget
>$IPTABLES -A log-and-forget -j LOG --log-level warning --log-prefix
>"[WARNING] "                
>$IPTABLES -A log-and-forget -j RETURN
>
># The next rules should be on the top of INPUT, FORWARD and OUTPUT
>chains
>
>$IPTABLES -A INPUT -p TCP -dport 22 -m state -state NEW -j
>log-and-forget
>$IPTABLES -A FORWARD -p TCP -dport 22 -m state -state NEW -j
>log-and-forget
>$IPTABLES -A OUTPUT -p TCP -dport 22 -m state -state NEW -j
>log-and-forget
>
>
>-----Original Message-----
>From: Damijan Sencar [mailto:damijan.sencar@zrs-tk.si]
>Sent: Thursday, May 30, 2002 7:13 AM
>To: netfilter@lists.samba.org
>Subject: Logging NEW ssh connections
>
>Hi!
>
>I want to log all new ssh connections from Internet to syslogd. I added
>chain as follows but it doesn't log anything.
>
>$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -m state --state NEW
>-j LOG --log-level DEBUG --log-prefix "NEW SSH IN
> logged"
>$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
>
>
>However it works (logs all packets to syslogd)  if I change state from
>NEW to ESTABLISHED. What could be wrong there?
>
>Thanx,
>
>Damijan
>
>



