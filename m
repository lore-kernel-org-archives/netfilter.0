From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack
Date: Thu, 17 Oct 2002 11:11:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210171011.g9HABOL26192@vulcan.rissington.net>
References: <A4C806B83AC1974E8A2AC21267B922D62D272E@exchange.int.ngi.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A4C806B83AC1974E8A2AC21267B922D62D272E@exchange.int.ngi.be>
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
To: netfilter@lists.netfilter.org

On Thursday 17 October 2002 10:37 am, jrw@ngi.be wrote:

> Hi,
> How could I remove a connection listed in the ip_conntrack file?
> Because, now, I must wait until the timeout...
> And if it's not possible, is there a way to change the timeout?
>
> In my rules, I have the following line :
> ${IPTABLES} -A FORWARD -o eth1 -m state --state ESTABLISHED,RELATED      -j
> ACCEPT
> and thus, old connection are accepted even if I restart iptables. I must
> reboot the server to clean the connections listing.

You cannot remove entries from the connection tracking table.

If you know the IP address/es of the connection/s you wish to remove, you 
could insert some DROP or REJECT rules before the ESTABLISHED,RELATED match 
so that the connections get taken down.

eg iptables -I FORWARD -s a.b.c.d -j REJECT

will block packet from address a.b.c.d before they get recognised as part of 
a previously established connection.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

