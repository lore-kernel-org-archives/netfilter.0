From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: understanding ip_conntrack entry
Date: Thu, 3 Oct 2002 23:40:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021003224005.VUHG7631.mta03-svc.ntlworld.com@there>
References: <000f01c26b18$2d114990$3201a8c0@leonardo>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c26b18$2d114990$3201a8c0@leonardo>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 03 October 2002 9:05 pm, Leonardo Rodrigues ( listas ) wrote:

>     Hello Guys,
>
>     I'd like your help to understand this entry from
> /proc/net/ip_conntrack:
>
> tcp      6 325849 ESTABLISHED src=192.168.10.1 dst=192.168.229.25
> sport=53699 dport=80 [UNREPLIED] \
>     src=192.168.229.25 dst=192.168.10.1 sport=80 dport=53699 use=1
>
>     Well ...... 192.168.10.1 is my iptables box and 192.168.229.25 is one
> of my remote machines. My question is .... if this connection is marked as
> ESTABLISHED, shouldnt it appear on 'netstat -an' entries ??? I think it
> should, but it's not appearing there .....

You might think so, but no, in this case your connection won't show up in 
netstat because it hasn't completed a TCP handshake.   The description 
'ESTABLISHED' in connection tracking is not the same as 'established' in 
TCP-speak :-(

The clue here is in the note above: [UNREPLIED].

As you can see there was a packet in each direction (the one with 
src=192.168.10.1 and the one with src=192.168.229.25) and this is what causes 
netfilter to consider the state of the connection to be ESTABLISHED - at 
least one packet has been seen each way on the link.   However if you haven't 
successfully completed the TCP 3-way handshake: SYN; SYN-ACK; ACK then it 
won't be regarded as an established connection by netstat (and indeed it 
isn't as far as the TCP/IP stack is concerned).

It's impossible to tell from the conntrack entry quite what packets went each 
way; to learn this you'd have to add some LOGging rules to your firewall or 
run a packet sniffer on one of the connections to see exactly what packets 
with what flags set actually go in each direction.

Antony.

-- 

This is not a rehearsal.
This is Real Life.

