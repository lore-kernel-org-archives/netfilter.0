From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd issue with bonding
Date: Fri, 10 Aug 2012 11:19:27 +0200
Message-ID: <20120810091927.GB1729@1984>
References: <5024B38E.1060200@cica.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5024B38E.1060200@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Fri, Aug 10, 2012 at 09:09:02AM +0200, Arturo Borrero wrote:
> Hi there!
> 
> It's seem that there is a issue with Conntrackd using a bonding as
> dedicated interface.
> 
> The log:
> 
> [Thu Aug  9 14:14:23 2012] (pid=3819) [notice] -- starting in daemon mode --
> [Thu Aug  9 14:14:23 2012] (pid=3819) [ERROR] no dedicated links available!
> [Thu Aug  9 14:14:23 2012] (pid=3819) [ERROR] no dedicated links available!
> [Thu Aug  9 14:14:23 2012] (pid=3819) [ERROR] no dedicated links available!
> [Thu Aug  9 14:19:54 2012] (pid=3819) [notice] ---- shutdown received ----
> 
> 
> Or maybe i'm missing something important in the configuration:
> 
> /etc/conntrackd/conntrackd.conf
> 
> Sync {
>         Mode ALARM {
>                 RefreshTime 15
>                 CacheTimeout 180
>         }
>         Multicast {
>                 IPv4_address 225.0.0.50
>                 Group 3780
>                 IPv4_interface 172.16.0.1
>                 Interface bond2
>                 SndSocketBuffer 1249280
>                 RcvSocketBuffer 1249280
>                 Checksum on
>         }
> }
> General {
>     HashSize 8192
>     HashLimit 65535
>     LogFile on
>     Syslog on
>     LockFile /var/lock/conntrackd.lock
>     UNIX {
>         Path /var/run/conntrackd.sock
>         Backlog 20
>     }
>     SocketBufferSize 262142
>     SocketBufferSizeMaxGrown 655355
>     Filter {
>         Protocol Accept {
>             TCP
>         }
>         Address Ignore
>         {
>             IPv4_address 127.0.0.1 # loopback
>             IPv4_address 172.16.0.1 # cluster link
>             IPv4_address 172.16.0.2 # cluster link
>             IPv4_address xx.40
>             IPv4_address xx.41
>             IPv6_address xx::40
>             IPv6_address xx::41
>             IPv6_address xx::41
>         }
>     }
> }
> 
> Bond2 is up and running:
> 
> bond2     Link encap:Ethernet  HWaddr 00:xx:xx:57:b8:xx
>           inet addr:172.16.0.1  Bcast:172.16.255.255  Mask:255.255.0.0
>           inet6 addr: fe80::215:xx::/64 Scope:Link
>           UP BROADCAST RUNNING MASTER MULTICAST  MTU:1500  Metric:1
>           RX packets:7405527 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:3935915 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:7812500663 (7.2 GiB)  TX bytes:651422232 (621.2 MiB)
> 
> 
> Any idea?

Somoething is wrong with the link state checking.

Please, get a working copy of libnfnetlink:

git clone git://git.netfilter.org/libnfnetlink
autoreconf -fi
./configure --prefix=/usr
make
make check

[no need to make install]

Then go to utils/ directory, run ./iftest and get back to the list to
report what it says.

> I'm using this version (Debian amd64)

You didn't mention kernel version, I guess it is standalone Linux
kernel in Debian? (2.6.32). Using a recent Linux kernel version of the
3.x branch is really recommended to run conntrackd.

> :~$ conntrackd -v
> Connection tracking userspace daemon v1.2.1. Licensed under GPLv2.

BTW, it's a good idea if you upgrade to 1.2.2. There was a bug in the
commit operation that is resolved in lastest version.
