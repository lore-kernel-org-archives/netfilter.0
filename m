From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: connection dropouts
Date: Thu, 26 Feb 2004 16:15:46 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AwOAt-001GiC-A2@alf1.lmb.internal>
References: <403DB5B3.7030509@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403DB5B3.7030509@snapgear.com> from Philip Craig at "Feb 26, 2004
 07:00:35 pm"
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

>T. Horsnell (tsh) wrote:
>> The firewall box is a 1GHz AMD with 128MBytes mem, and
>> /proc/sys/net/ipv4/ip_conntrack_max is currently set to 8184.
>> 
>> How can I track how close I get to this limit? 
>
>There will be a syslog message telling you when you reach the limit.
>Or 'grep ip_conntrack /proc/slabinfo', and read the first number
>(active_objs).
>Or 'wc -l /proc/net/ip_conntrack', but that is slow and maybe unreliable.
>
>> What is the memory use per conntrack entry?
>
>The kernel displays this when the conntrack module is loaded, eg
>kernel: ip_conntrack version 2.1 (8191 buckets, 65528 max) - 300 bytes
>per conntrack
>Or 'grep ip_conntrack /proc/slabinfo', and read the third number (objsize).
>(Hmm, except I noticed those two numbers are different on my PC.  The
>slabinfo may be more accurate.)
>
>> Is there anything particular about NAT entries in the conntrack
>> tables that would make NAT'd hosts more prone to net hangups
>> that unNAT'd ones?
>
>Not that I'm aware of.  Do the hangups have any sort of consistency?

They seem much more prevalent in machines which have been moved
to our private addresses. I havent gathered much evidence yet,
but one thing I have noticed is that I accumulate a large number
of entries in ip_conntrack like:

tcp      6 431253 ESTABLISHED src=10.2.0.4 dst=131.111.85.78 sport=49278 dport=143 [UNREPLIED] src=131.111.85.78 dst=10.2.0.4 sport=143 dport=49278 use=1

'ESTABLISHED' 'UNREPLIED' seems an odd combination to me.
To help in the move to 10.x.x.x we have a number of servers with
(temporary) dual ip addresses.
Host 131.111.85.78 is one of these and has a primary ip address
of 10.1.0.1 with an alias of 131.111.85.78. The netfilter box
is configured to route between 10. and 131.111.85.x, and
10.2.0.4 will have been configured to use the netfilter box
as its default router.

The conntrack entry above appears to be an attempt by host 10.2.0.4
to make an imap connection to 131.111.85.78. My feeling is that
host 131.111.85.78 switches to using its 10.1.0.1 address at some
point in the connection, and so the UNREPLIED state stays put.
I dont yet know why traffic between our 10. hosts and our
131.111 hosts should generate a conntrack entry at all...

Cheers,
Terry.


>
>> If I raise my ip_conntrack_max value, am I likely to crash
>> the firewall if I raise it too high?
>> What is the theoretical maximum number of conntrack entries?
>> What is the theoretical maximum number of NAT connections?
>> (this would seem to me to be 65536 - the maximum number
>> of ports available on a single host, i.e. the NAT box
>> since it has to map a source host:hostport into a NAT:natport)
>
>The only limit is available memory.  It is not limited to 65536 since
>each entry is based off protocol/source host/source port/dest host/dest
>port, the number of combinations of which is more than you'll ever need.
>There is a limitation of 65535 NATed connections to a single port on a
>given dest host (ie if source host, dest host, and dest port are all
>constant), but that would be unusual to encounter.
>
>-- 
>Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com
>
>


