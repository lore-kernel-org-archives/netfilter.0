From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack cleanup
Date: Thu, 13 Jun 2002 18:09:56 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131710.SAA08618@slate.rockstone.co.uk>
References: <3CE9F837.3040606@snt.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CE9F837.3040606@snt.pl>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 21 May 2002 8:33 am, Wojciech Sobola wrote:

> Hello,
>
> I've been using ipt 1.2.6a for 2 month's. There's seem to be a problem in
> /proc/net/ip_conntrack. I have chains here, that can't be cleared out.

> Example:

> tcp      6 321156 ESTABLISHED src=63.218.135.142 dst=62.xx.x.44 sport=63920
> dport=80 [UNREPLIED] src=192.168.101.2 dst=63.218.135.142 sport=80
> dport=63920 use=1
>
> Such table can stay even 2 or 3 days.

The standard TCP timeout on an ESTABLISHED connection is 5 days.   I have no 
idea why this was once thought to be a good idea, but it is now in the 
standards.

You could change it and recompile your kernel if you want, but this is the 
reason you are seeing these connections for 2 or 3 days - they're not even 
halfway to timing out yet :-)

Also, once a connection is in the conntrack table, you cannot get rid of it 
by doing anything at all to your netfilter rules.

If you compiled modules you can remove and reinstall the ip_conntrack module, 
but if you use a monolithic kernelonly a reboot willget these out of the 
table.

 

Antony.

