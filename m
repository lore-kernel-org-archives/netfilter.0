From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Re: Samba blocked?
Date: Tue, 26 Nov 2002 19:41:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002101c295be$881c5c00$1e00a8c0@yamatto>
References: <000d01c2958f$d3fadbd0$1e00a8c0@yamatto> <3DE41C6F.2050704@iprimus.com.au>
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
To: Michael <mutk@iprimus.com.au>, netfilter@lists.netfilter.org

Ok. I found the lookup order as:
wins lmhosts bcast

Which is how a windows client would connect. (except it would read lmhosts
first). This needs to work not only for
smbclient but also for any windows machines in the 192.168.0.x network. And
adding a lmhosts to each machine is not really an option except as an
absolute last resort.

I need the system to be able to resolve netbios names via broadcast if at
all possible. I still don't see why a request to 192.168.0.255 would fail.

Here's the log fragments when I run smbclient //myserver/shared1 -U myuser:
(resolve order = wins lmhosts bcast)
Nov 26 20:33:22 mail last message repeated 2 times
Nov 26 20:34:03 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=32814 DPT=137 LEN=58
Nov 26 20:34:07 mail last message repeated 2 times
Nov 26 20:34:09 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=192.168.0.2
DST=192.168.0.2 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32814 LEN=70
Nov 26 20:34:10 mail last message repeated 2 times
Nov 26 20:34:10 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=64.122.31.38
DST=64.122.31.38 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32814 LEN=70

Any ideas, anyone?

-- Dan
----- Original Message -----
From: "Michael" <mutk@iprimus.com.au>
To: "Dan Egli" <dan@shortcircuit.dyndns.org>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, November 26, 2002 6:14 PM
Subject: Re: Samba blocked?


> Dan Egli wrote:
>
> >Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filter
set
> >that will block certain ports and allow others. It seems to work
perfectly
> >for anything other than Samba. If I try:
> >
> >smbclient //myserver/shared1, it fails to connect. But using the IP in
place
> >of it:
> >smbclient //192.168.0.2/shared1 works just fine. I am specifically
allowing
> >NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?
> >
> >
> >
>
>
> Probably nothing wrong with the iptables rules. Might be something wrong
> with the name lookups for smbclient though.
> Have a look at man pages for smbclient, in particular the name resolve
> order (-R) command switch. Also have a look at man page for smb.conf,
>  as the method for name look ups is defined there (The order too)
>
> The default order is lmhosts, host, wins, bcast for name look ups.
> I beleive that for bcast name lookups to work you need to allow bcast
> traffic too. ie you need to allow 192.168.0.255 port 137.
>
> If you don't want that, a quick fix is to try adding the 'myserver'
> name and IP to /etc/hosts ..
>
> Cheers,
> Michael
>
>
>
>
>


