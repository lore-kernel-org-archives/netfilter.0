From: Stephen Satchell <list@satchell.net>
Subject: Re: iptables / network / linux issue ...
Date: Sun, 14 Dec 2003 07:56:05 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071417365.22104.57.camel@ssatchell1.pyramid.net>
References: <1071145955.22911.9.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071145955.22911.9.camel@raylinux.internal>
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
To: spoons@rchq.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2003-12-11 at 04:32, Ray Leach wrote:
> Hi
> 
> I have a strange network / iptables / Linux problem. I don't know which
> it is yet ...
> 
> If I ssh to my firewall (which has 4 NIC installed), I then ftp back to
> an ftp server on eth2 segment of the firewall and get a whole bunch of
> files (about 20 totaling 100MB), I get a transfer rate of 110KB/s
> (800Kb/s) - measured on both ends of the connection. This is on a 100Mb
> network.
> 
> I then ftp from the machine on the internal LAN (eth2) through the
> firewall to a machine in the DMZ (eth1 on the firewall). Now I get 1MB/s
> - that's more like it.
> 
> Any ideas why the first transfer could be so slow?
> 
> I have checked my -m limit iptables rules and verified (as can be seen
> above) that they are not limiting the packet rate.

Use netstat -i before and after each transfer to read out the connection
statistics for each of the interfaces.  Look for inordinate error
counts.  Remember the problem may well be on the other end of the link
(not visible on your end) so you will need to check error counts on the
other end as well.

You can also look at the statistics for TCP in /proc/net/snmp, paying
particular attention to packet retries.

You may have already tried a flood ping to try to diagnose the problem,
but most people don't realize that the packets being sent are quite
small.  To duplicate the conditions, you need to send ping packets of
near-MTU size.  "ping -f -s 1460 <endpoint>"  Try that with your problem
connection and see if you see significant packet loss.  (You may also
need to define data in order to tickle the poor NICs to fail; here's a
list I use:

   ping -f -s 1460 -p 00 $IPADDR   
   ping -f -s 1460 -p ff $IPADDR   
   ping -f -s 1460 -p aa $IPADDR   
   ping -f -s 1460 -p deadface0000ffffff $IPADDR

The first sends all zeros [the default], the second all ones, the third
alternating ones and zeros, and the fourth is a pattern I hit upon with
Realtek NICs.)

Remember, too, that each Ethernet segment is one big happy family, and
if one of the family members -- not even involved in your transfer -- is
playing interfering bully, you will need to send him/her/it to
his/her/its room.

My pair-o-pennies(tm).

Satch



