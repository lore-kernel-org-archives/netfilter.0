From: David Cannings <lists@edeca.net>
Subject: Re: Allowing FTP and internal but nothing else
Date: Wed, 3 Mar 2004 17:18:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403031718.12761.lists@edeca.net>
References: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net>
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
To: netfilter@lists.netfilter.org

On Wednesday 03 March 2004 16:55, Paul Harlow wrote:
> I have an FTP server that I would like to filter out all external
> traffic except ftp and ftp-data. This same server has an internal
> interface that I would like to allow everything on the inside to have
> access to. Given what I've read I have come up with this general idea
> of what to put into a filter table for now. Please let me know what
> your gurus of netfilter think. Thanks!

I am no guru but here is my 2c.

> iptables -I INPUT -i eth0 -j ACCEPT

This would accept any packet coming in on eth0, this is fine as long as 
you didn't want to be more restrictive about this interface.

> iptables -I INPUT -i eth1 -d port 21 -j ACCEPT
> iptables -I INPUT -i eth1 -d port 20 -j ACCEPT

Both should be "--dport", "-d" is destination, for hosts.  You'd use -d 
like this:

iptables -I INPUT -d 192.168.0.1 -j ACCEPT

Your rule above could be rewritten as:

iptables -I INPUT -i eth1 --dport 21 -j ACCEPT

> iptables -I INPUT -i eth1 -j deny

Note that "deny" isn't a valid target, unless you've definied your own 
chain called "deny".  From the manual page, the correct target would be 
"DROP".

> I am assuming this is similar to Cisco access lists in that it will
> read along the filter list until a hit is made then take action. Please
> correct me if I am wrong.

iptables is "first match", yes.  The first rule that matches a packet will 
be the one that controls the fate of it.  This can, however, include 
jumping through other chains.

For FTP, you might like to look into the FTP connection tracking helpers.  
Also, you may well need rules to allow established or related packets.

Hope this helps,

David

