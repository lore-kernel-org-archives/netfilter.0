From: Michael <mutk@iprimus.com.au>
Subject: Re: Samba blocked?
Date: Wed, 27 Nov 2002 13:22:07 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE43A5F.3070909@iprimus.com.au>
References: <000d01c2958f$d3fadbd0$1e00a8c0@yamatto> <3DE41C6F.2050704@iprimus.com.au> <002101c295be$881c5c00$1e00a8c0@yamatto>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dan Egli wrote:

>Ok. I found the lookup order as:
>wins lmhosts bcast
>
>Which is how a windows client would connect. (except it would read lmhosts
>first). This needs to work not only for
>smbclient but also for any windows machines in the 192.168.0.x network. And
>adding a lmhosts to each machine is not really an option except as an
>absolute last resort.
>
>I need the system to be able to resolve netbios names via broadcast if at
>all possible. I still don't see why a request to 192.168.0.255 would fail.
>
>Here's the log fragments when I run smbclient //myserver/shared1 -U myuser:
>(resolve order = wins lmhosts bcast)
>
>Nov 26 20:33:22 mail last message repeated 2 times
>
>Nov 26 20:34:03 mail kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=32814 DPT=137 LEN=58
>Nov 26 20:34:07 mail last message repeated 2 times
>Nov 26 20:34:09 mail kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=192.168.0.2
>DST=192.168.0.2 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
>DPT=32814 LEN=70
>Nov 26 20:34:10 mail last message repeated 2 times
>Nov 26 20:34:10 mail kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=64.122.31.38
>DST=64.122.31.38 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
>DPT=32814 LEN=70
>
>Any ideas, anyone?
>


The logs are IN=lo. You have no rules to match interface lo.  Are you 
running smbclient from local? You need iptables rules to allow from lo 
too....

Sorry I didn't think of this before...

Cheers,
Michael


