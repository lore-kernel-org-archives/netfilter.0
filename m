From: Khanh Tran <khanh@slc.edu>
Subject: RE: netfilter/iptables LOG not logging MAC addresses
Date: Tue, 18 Feb 2003 18:55:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB603@EXCHANGE>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: hare ram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org



-----Original Message-----
From: hare ram [mailto:hareram@sol.net.in]
Sent: Tuesday, February 18, 2003 8:33 AM
To: Khanh Tran
Subject: Re: netfilter/iptables LOG not logging MAC addresses


Hi

where can i find that perl script what you have done
take log files and put in to mysql database

thanks
hare
----- Original Message -----
From: "Khanh Tran" <khanh@slc.edu>
To: <netfilter@newkirk.us>; <netfilter@lists.samba.org>
Sent: Sunday, February 02, 2003 9:35 AM
Subject: RE: netfilter/iptables LOG not logging MAC addresses


> Thanks for all your help.  I merged a few of your ideas together into:
>
> /sbin/iptables -t nat -I PREROUTING 1 -m state --state NEW -j LOG
> --log-tcp-options --log-ip-options
>
> I've got my syslog logging kernel.warning level stuff into
> /var/log/warn.log.  I found a perl script package on SourceForge that
should
> do the trick of analyzing the log file and appropriately putting the
> elements into a mySQL database for later retrieval.  Hopefully the scripts
> will do all that I need, but at this point at least I'm logging what I
need
> to log.
>
> Thanks for all your help.  Now if we can only figure out what the :08:00
> means a the end of every MAC address.  Maybe some Hex value for the subnet
> mask or broadcast?  I'm stumped, but happy for now.
>
> Khanh Tran
> Network Operations
> Sarah Lawrence College
>
>
> -----Original Message-----
> From: Joel Newkirk [mailto:netfilter@newkirk.us]
> Sent: Saturday, February 01, 2003 8:34 PM
> To: Khanh Tran; 'netfilter@lists.samba.org'
> Subject: Re: netfilter/iptables LOG not logging MAC addresses
>
>
> On Saturday 01 February 2003 07:21 pm, Khanh Tran wrote:
> > OK, so I tried to do:
> >
> > iptables -A POSTROUTING -j LOG --log-tcp-options --log-ip-options
> >
> > but all that gives me is an iptables error about that not being a
> > valid chain.  I do get the MAC address info if I log the INPUT chain,
> > but all that gives me is the info about the originating IP with a
> > destination of the internal interface of my firewall.  That's not much
> > help for keeping track of the activity of all my internals.  This is
> > essentially all I am trying to do.  If anyone has a better solution,
> > I'm up for suggestions.
>
> The nat and mangle tables each have a POSTROUTING chain, but the filter
> table does not.  If you don't specify a table, iptables uses "-t filter"
> as the default.  In any case, you won't see MAC information in the
> POSTROUTING logs. (If you want to try my dirty fix, you should be able
> to get it in POSTROUTING, with "-t nat" before "-A" in your rule above)
> In your situation you will only find it in logs from a PREROUTING chain.
> Try:
>
> iptables -t nat -I PREROUTING 1 -j LOG --log-tcp-options --log-ip-options
>
> And you should see the "MAC=" field in each log entry.  You will likely
> want to add some matches, however, like "-s 10.10.0.0/16" or "-p tcp
> --dport 80" or such to keep it from logging unneeded info.  I'd also
> suggest you consider "-m state --state NEW" in the log rule, if this is
> compatible with your needs, so that you only log the first packet of
> each connection.  You'll accurately log the activity but not the volume
> that way.
>
> BTW, If you are going to use this for everyday purposes, you will want to
> redirect the logs to their own logfile, if you aren't already (IE with
> 'kern.=debug  /var/log/firewall" in /etc/syslog.conf, and append
> "--log-level 7" to logging rules).  Also, you really might want to look
> into some of the ULOG-based accounting packages available, that will
> track a variety of packet information and store it - often without
> consuming the immense storage required to log ALL traffic through a
> gateway system using the LOG target.  You will probably also gain the
> ability to easily create a report listing any machines conducting
> unusual communications, exceeding given parameters, etc.
>
> j
>
> > Khanh Tran
> > Network Operations
> > Sarah Lawrence College
>
>
>
>
>



