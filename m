From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: NAT and log traffic
Date: Wed, 15 Jan 2003 17:26:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301151726.44563.netfilter@newkirk.us>
References: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
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
To: Simone Sestini <simone.sestini@plugit.net>, netfilter@lists.netfilter.org

On Wednesday 15 January 2003 06:36 am, Simone Sestini wrote:
> Hi folks..
>
> I have made two NAT box for a special dialup server.
> I have create an iptables stratup script like that..
>
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.2.0/23 -o eth0
> -j SNAT --to PUBLIC-IP1
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.4.0/23 -o eth0
> -j SNAT --to PUBLIC-IP2

> and so on..
>
>
> Now.. i need to LOG all the traffic that transit over the rules..
> I need to log at least PUBLIC-IPX and DESTINATION-IP.
>
> A friend of that mailing list wrote me back and told..
>
> change your string like that
>
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0
> -j LOG --log-level debug --log-prefix "POSTRT: "
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.20.0.0/23 -o eth0
> -j SNAT --to PUBLIC-IP1
>
> I did that and added that over syslog.conf
> # For NAT
> *.*                                             /var/log/nat.log
>
> but i don't see any datas logged over that file..
>
> See that..
>
>     75  3727
> LOG        all  --  *      eth0    10.20.0.0/23         0.0.0.0/0
> LOG flags 0 level 7 prefix `POSTRT: '
>     75  3727
> SNAT       all  --  *      eth0    10.20.0.0/23         0.0.0.0/0
> to:xxx.x.xx.x
>
> I generated the traffic over that rule but nothing appear over the log
> file.
>
> Any idea ?

The log by default goes to /var/log/messages with other kernel logging. =20
You CAN redirect it, but with the LOG target all you can do is specify=20
the log-level, and then redirect ALL kernel logs of that level with=20
changes to syslog.conf.  Usually 'debug' is tolerably empty of other=20
logging, so his suggestion of rules is reasonable.  (although you could=20
improve it by having the log-prefix itself indicate which rule matched,=20
rather than even having to read the log data itself)  However, the=20
syslog.conf change you made doesn't make sense to me.

Try 'man syslog.conf' for info, but using the *.* will redirect ALL=20
logging of EVERYTHING to the destination file.  In order to redirect=20
kernel debug logging ONLY, you need something like:

kernel.=3Ddebug=09/var/log/natlog

to specify that ONLY debug level of kernel logs go to the specified file.=
 =20
Also, I believe you will need to restart syslogd in order for the change=20
to be effective.

BTW, You might want to consider adding "-m state state NEW" to your=20
logging rules.  This will log ONLY new connections, rather than every=20
single packet that goes out.  As long as all you are interested in is=20
the fact that a connection was initiated, and the source and=20
destination, this will be MUCH easier on your system.  If you really=20
need to gather information on EVERYTHING, then I suggest you look into a=20
ULOG accounting package, which will gather information directed to it=20
through the ULOG target and compile whatever information you need=20
without creating massive logfiles.

j

>
>
>
> Simone Sestini [ SS971-RIPE ]
>
> Plug IT s.p.a. - Technical Office
> Via Galileo Ferraris 216
> 52100 Arezzo
>
> Titles:
> System and Network Administrator
> Data Transmission Manager
>
> Fax             +39 199 440088
> E-mail  simone.sestini@plugit.net
> Web             http://www.plugit.it


