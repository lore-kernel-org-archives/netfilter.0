From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: packet capturing
Date: Mon, 1 Jul 2002 08:37:58 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020701073800.HHEW4119.mta06-svc.ntlworld.com@there>
References: <20020630232050.3847.qmail@webmail9.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020630232050.3847.qmail@webmail9.rediffmail.com>
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

On Monday 01 July 2002 12:20 am, angela  cearns wrote:

> hello group,
>    i want to check if there is anyway  i can measure the # of
> packets after the iptables acted on them i.e. after dropping the
> packets. i use ethereal, it gives me all the packets before the
> iptables have acted on?

What do you mean by "the number of packets after iptables dropped the 
packets" ?

I assume you don't mean the packets which got dropped, and I assume you don't 
mean the further packets in the communication stream which never even arrive, 
because the earlier ones got dropped, so which packets are you trying to 
capture / count ?

Does it help to remind you that almost all packets dropped by netfilter rules 
are SYN packets (ie the first part of the TCP three-way handshake) and the 
very purpose of dropping them is so that the 3-way handshake does not 
complete, and the session does not start transmitting data ?

Give us an example of a TCP or UDP session with a drop rule, and tell us 
which packets you want to count, and we'll have a think.....

 

Antony.

