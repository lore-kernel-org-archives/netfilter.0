From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: Log output going to screen
Date: Wed, 16 Oct 2002 17:20:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003601c27559$d0160b80$8c01a8c0@sundaram>
References: <B9D38D9C.45F%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: George Agnelli <george@mattandgeorge.com>, netfilter@lists.netfilter.org

check your /etc/syslog.conf to make sure it doesn't contain a line like
'kern.* /dev/console'. If that doesn't work, try starting your klogd with
the switch '-c 3'

redhat  /etc/init.d/syslog, start function

start() {
        echo -n $"Starting system logger: "
        daemon syslogd $SYSLOGD_OPTIONS
        RETVAL=$?
        echo
        echo -n $"Starting kernel logger: "
        daemon klogd $KLOGD_OPTIONS -c 3
        echo
        [ $RETVAL -eq 0 ] && touch /var/lock/subsys/syslog
        return $RETVAL
}


----- Original Message -----
From: "George Agnelli" <george@mattandgeorge.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, October 16, 2002 4:41 PM
Subject: Log output going to screen


> Does anyone know why my logs are occasionally being dumped to screen as
well
> as to the messages file? How can I stop this happening?
>
> This is what I am currently logging:
>
> iptables -A INPUT  -i eth1 -j LOG
> iptables -A OUTPUT -o eth1 -j LOG
> iptables -A FORWARD  -i eth1 -o eth0 -j LOG
> iptables -A FORWARD  -i eth0 -o eth1 -j LOG
>
> George
>
>


