From: Thorsten Scherf <tscherf@web.de>
Subject: Re: Corrupted packets + Logs
Date: Thu, 18 Sep 2003 15:35:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309181535.04020.tscherf@web.de>
References: <200309171256.49551.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309171256.49551.mrakotom@free.fr>
Content-Disposition: inline
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
To: Rakotomandimby Mihamina <mrakotom@free.fr>, netfilter@lists.samba.org

On 17 September 2003 12:56 Rakotomandimby Mihamina wrote:

>#1
>I'm learning networks and i saw that there are some tools that send
>"corrupted" packets to a host to have an idea of the local OS ( an exemple
> is nmap ) .
>I would like my firewall to drop all corrupted packets .
>I made a search on google with the words " iptables drop corrupted
> packets" but i cannot find any clear-enough documentation .

There is a Netfilter Extension called "unclean" , which have the state of 
Experimental. You can try to use this one. Possible Checks are: packet 
lenght, packet checksum, lenght of a fragment if available, invalid 
icmp-codes, tcp/udp port 0 testing.


>#2
>I would like iptables to log into /var/log/messages .
>What have a got to configure into syslogd && iptables to do it ?
>What rules have i got ad apply ?

You can use the the target log along with a log-prefix and configure your 
syslogd to write all Kernel-Messages (Netfilter is Kernel based) to your 
/var/log/messages.

iptables -A FORWARD -p tcp --dport 80 -s $EXTNET -d $WWW -j LOG --log-prefix 
WWW-Connection


Greetings,

Thorsten Scherf
RHCE, RHCX


