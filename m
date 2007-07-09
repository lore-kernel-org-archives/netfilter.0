From: David Liontooth <liontooth@cogweb.net>
Subject: NFS using iptables PREROUTING?
Date: Sun, 08 Jul 2007 17:40:36 -0700
Message-ID: <46918404.7050107@cogweb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Is it possible to access an NFS (v.3) server on a private network from a
machine on a public network?

I have a Debian Sid box B on a private network visible only to a gateway 
G. B has drive partitions I would like to mount on outside box A.
To make B visible to A, I use this sort of thing for ssh:

   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9000 -j
DNAT --to 192.168.0.1:22

This allows me to ssh directly from A to B, as if B were on a public
network. Can I do the same with NFS? I use iptables 1.3.6.0debian1-5.

So far, I've figured out how to fix the port of mountd, statd, and
lockd, and I can preroute these ports, along with 2049 for nfs and 111
for portmap. For each of these, I can preroute tcp and udp packets on G:

# Forward tcp and udp on port 111 for portmap on A
   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9200 -j
DNAT --to 192.168.0.3:111
   iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9200 -j
DNAT --to 192.168.0.3:111

# Forward tcp and upd for port 2049 for nfs to A (tcp may not be needed)
   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9201 -j
DNAT --to 192.168.0.3:2049
   iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9201 -j
DNAT --to 192.168.0.3:2049

# Forward tcp and udp for lockd (port assigned in A:/boot/grub/menu.lst)
   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9202 -j
DNAT --to 192.168.0.3:4000
   iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9202 -j
DNAT --to 192.168.0.3:4000

# Forward tcp and udp for mountd (port assigned in
A:/etc/default/nfs-common)
   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9203 -j
DNAT --to 192.168.0.3:4001
   iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9203 -j
DNAT --to 192.168.0.3:4001

# Forward tcp and udp for statd (port assigned in A:/etc/default/nfs-common)
   iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9204 -j
DNAT --to 192.168.0.3:4002
   iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9204 -j
DNAT --to 192.168.0.3:4002
# Do you need a POSTROUTING line to take outgoing tcp/udp for statd on
port 4003?

Is there a way on the client A to specify where to look for the
different NFS resources on B (via G)?

How do I tell NFS that for this particular mount B, and only for B,
portmap is on 9200, nfs is on 9201, lockd on 9202, mountd on 9203, and
statd on 9204? Can I specify all of this in /etc/fstab? For ssh, I can 
specify host:port in /etc/ssh/ssh_config, but it uses only one service.

On A, I also mount several other NFS drives, and they need the default
ports, so I can't forward the normal NFS ports on A indiscriminately to 
the new ports needed by B through G. G, the gateway, also exports its 
own drives to A via NFS, using the default ports, so I can't just remap 
its ports either.

I would prefer straight NFS with iptables to ssh tunneling, but can it
be done? I'm extremly grateful for the functionality iptables provides 
-- I use it to give SSH and Munin access to the private network, and the 
private network access to the outside -- but I'm completely new to it 
and found no examples of what I want to do with NFs.


Cheers,
Dave



-------------------------------------------------------------------------
This SF.net email is sponsored by DB2 Express
Download DB2 Express C - the FREE version of DB2 express and take
control of your XML. No limits. Just data. Click to get it now.
http://sourceforge.net/powerbar/db2/
_______________________________________________
NFS maillist  -  NFS@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/nfs

