From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Outgoing SMTP Mystery
Date: Wed, 5 Jun 2002 00:46:53 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042346.g54NksA14771@Networker.rockstone.co.uk>
References: <013601c20c15$cba57520$52cfd3cf@michael>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <013601c20c15$cba57520$52cfd3cf@michael>
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

On Tuesday 04 June 2002 11:18 pm, Michael Hudin wrote:

>  I've always assumed that the numbers in the brackets were port allowances

No, they're not (although I can't say what they are - I don't use 
iptables-save).   If you look at the numbers, many of them are larger than 
65535, so they're certainly not port numbers :-)

> Here are my tables:
>
> *nat
>
> :PREROUTING ACCEPT [241:88600]
> :POSTROUTING ACCEPT [0:9862]
> :OUTPUT ACCEPT [68:4275]
>
> *mangle
>
> :PREROUTING ACCEPT [18365:3221456]
> :INPUT ACCEPT [10886:760348]
> :FORWARD ACCEPT [7269:2438049]
> :OUTPUT ACCEPT [8009:752540]
> :POSTROUTING ACCEPT [15177:3182145]
>
> *filter
>
> :INPUT ACCEPT [0:229546]
> :FORWARD ACCEPT [363:1553786]
> :OUTPUT ACCEPT [2:619341]

I find this interesting - you have a default ACCEPT policy on all your chains 
- specifically on FORWARD, and I cannot see any rules you have included which 
DROP or REJECT packets..... so is there really any filtering going on in your 
firewall, or is it in fact just an open router doing some network address 
translation !?

I know this doesn't exactly solve your problem, but I wonder if it means the 
problem isn't on your firewall ?

Perhaps you could check the routing table on your SMTP server - what does it 
have for a default gateway address ?


Antony.

