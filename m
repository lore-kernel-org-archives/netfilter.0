From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 20:34:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302012034.24812.netfilter@newkirk.us>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB575@EXCHANGE>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC5FB575@EXCHANGE>
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
To: Khanh Tran <khanh@slc.edu>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Saturday 01 February 2003 07:21 pm, Khanh Tran wrote:
> OK, so I tried to do:
>
> iptables -A POSTROUTING -j LOG --log-tcp-options --log-ip-options
>
> but all that gives me is an iptables error about that not being a
> valid chain.  I do get the MAC address info if I log the INPUT chain,
> but all that gives me is the info about the originating IP with a
> destination of the internal interface of my firewall.  That's not much
> help for keeping track of the activity of all my internals.  This is
> essentially all I am trying to do.  If anyone has a better solution,
> I'm up for suggestions.

The nat and mangle tables each have a POSTROUTING chain, but the filter=20
table does not.  If you don't specify a table, iptables uses "-t filter"=20
as the default.  In any case, you won't see MAC information in the=20
POSTROUTING logs. (If you want to try my dirty fix, you should be able=20
to get it in POSTROUTING, with "-t nat" before "-A" in your rule above) =20
In your situation you will only find it in logs from a PREROUTING chain. =
=20
Try:

iptables -t nat -I PREROUTING 1 -j LOG --log-tcp-options --log-ip-options

And you should see the "MAC=3D" field in each log entry.  You will likely=
=20
want to add some matches, however, like "-s 10.10.0.0/16" or "-p tcp=20
--dport 80" or such to keep it from logging unneeded info.  I'd also=20
suggest you consider "-m state --state NEW" in the log rule, if this is=20
compatible with your needs, so that you only log the first packet of=20
each connection.  You'll accurately log the activity but not the volume=20
that way.

BTW, If you are going to use this for everyday purposes, you will want to=
=20
redirect the logs to their own logfile, if you aren't already (IE with=20
'kern.=3Ddebug  /var/log/firewall" in /etc/syslog.conf, and append=20
"--log-level 7" to logging rules).  Also, you really might want to look=20
into some of the ULOG-based accounting packages available, that will=20
track a variety of packet information and store it - often without=20
consuming the immense storage required to log ALL traffic through a=20
gateway system using the LOG target.  You will probably also gain the=20
ability to easily create a report listing any machines conducting=20
unusual communications, exceeding given parameters, etc.

j

> Khanh Tran
> Network Operations
> Sarah Lawrence College



