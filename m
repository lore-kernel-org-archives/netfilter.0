From: David Liontooth <liontooth@cogweb.net>
Subject: Re: NFS using iptables PREROUTING?
Date: Sun, 08 Jul 2007 23:22:28 -0700
Message-ID: <4691D424.5040109@cogweb.net>
References: <46918404.7050107@cogweb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46918404.7050107@cogweb.net>
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

David Liontooth wrote:
>
> Is it possible to access an NFS (v.3) server on a private network from a
> machine on a public network? 
It turns out to be a lot simpler than I thought -- no need to worry 
about lockd, portmap, or statd.

On the host A, set the mount port in /etc/default/nfs-kernel-server:

    RPCMOUNTDOPTS="--port 4000"

In the gateway G's /etc/network/if-up.d/00-firewall, forward the NFS and 
the mountd ports

    # NFS: Forward udp on port 2049 to A on the private network
    iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9101 
-j DNAT --to 192.168.0.3:2049

    # Forward tcp and udp for mountd on A (port assigned in 
A:/etc/default/nfs-common)
    iptables -t nat -A PREROUTING -p tcp -d 128.65.183.178 --dport 9201 
-j DNAT --to 192.168.0.3:4000
    iptables -t nat -A PREROUTING -p udp -d 128.65.183.178 --dport 9201 
-j DNAT --to 192.168.0.3:4000

In the client B's /etc/hosts, define an alias for the NFS host behind 
the firewall, using the IP address of the gateway:

   128.65.183.178  a.fully.qualified.domain.name   A

And in the client B's /etc/fstab, define the mount, adding the gateway's 
ports that forward NFS and mount to the host:

   A:/db1 /mnt/a1 nfs 
noauto,user,exec,rw,rsize=16k,wsize=16k,hard,intr,port=9101,mountport=9201 
0 0

Works beautifully and transparently. Or does someone spot a potential 
problem?

Cheers,
Dave

