From: Michael <mutk@iprimus.com.au>
Subject: Re: Samba blocked?
Date: Wed, 27 Nov 2002 13:12:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE43834.5090603@iprimus.com.au>
References: <000d01c2958f$d3fadbd0$1e00a8c0@yamatto> <3DE41C6F.2050704@iprimus.com.au> <001701c295bd$2967c7e0$1e00a8c0@yamatto>
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

>Traffic to 192.168.0.255? I don't recall seeing anythign that would block
>that. Here's what the table list shows:
><snip>
>

Yes, ok. That's why I said "Probably nothing wrong with the iptables 
rules". I went on to elaborate that you do need to allow bcast for bcast 
name lookups to work...

Like I said, have a look at the name lookups setup in smb.conf.

What message does smbclient give you ??

Here's a good bcast namelookup:

smbclient //mandingo/mandingo -U mandingo
added interface ip=192.168.0.241 bcast=192.168.0.255 nmask=255.255.255.0
Got a positive name query response from 192.168.0.250 ( 192.168.0.250 )
Password:
Domain=[WORKGROUP] OS=[Unix] Server=[Samba 2.0.6]
smb: \> exit

This is without /etc/hosts  entry for mandingo host.

What say ?:

nmblookup -B 192.168.0.255 shared1

Cheers, Michael



