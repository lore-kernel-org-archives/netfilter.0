From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allowing FTP and internal but nothing else
Date: Wed, 3 Mar 2004 17:24:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403031724.53175.Antony@Soft-Solutions.co.uk>
References: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net> <200403031718.12761.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403031718.12761.lists@edeca.net>
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

On Wednesday 03 March 2004 5:18 pm, David Cannings wrote:

> I am no guru but here is my 2c.
>
> > iptables -I INPUT -i eth0 -j ACCEPT
>
> This would accept any packet coming in on eth0, this is fine as long as
> you didn't want to be more restrictive about this interface.
>
> > iptables -I INPUT -i eth1 -d port 21 -j ACCEPT
> > iptables -I INPUT -i eth1 -d port 20 -j ACCEPT
>
> Both should be "--dport", "-d" is destination, for hosts.  You'd use -d
> like this:
>
> iptables -I INPUT -d 192.168.0.1 -j ACCEPT
>
> Your rule above could be rewritten as:
>
> iptables -I INPUT -i eth1 --dport 21 -j ACCEPT

If you want to specify a port, you must first specify a protocol.   Only TCP 
and UDP use port numbers, therefore the protocol must be one of these.

FTP uses TCP, so what you actually want to specify is:

iptables -I INPUT -i eth1 -p tcp --dport 21 -j ACCEPT

> For FTP, you might like to look into the FTP connection tracking helpers.
> Also, you may well need rules to allow established or related packets.

I agree.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


