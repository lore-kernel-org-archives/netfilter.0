From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Im stupid or its broken
Date: Sun, 15 Sep 2002 12:00:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D845A4F.80308@fugmann.dhs.org>
References: <200209131029.g8DATBQ32523@bergelmer.thn.htu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mats Blomstrand <mats.blomstrand@htu.se>
Cc: netfilter@lists.netfilter.org

Mats Blomstrand wrote:
> 
>   root@wsk0 # iptables -t nat -A POSTROUTING -o eth0 \
>               -s 192.168.0.0/24 -j SNAT --to-source 193.10.192.63
> 
> and the do
> 
>   root@wsk0 # echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> it does what I want. Ie, i can ping from node to the outside
> and the node can do nfs-mounts from master.
> 
> ** However!! If I reboot the node it can still ping to the outside
> but it cant no longer do the nfs mount:
This should work.

Could you please verify that you can do NFS-mounts without the rules
applied.

Also, does the server logs (/var/log/messages) tell you anything of why 
the node is not allowed to connect?

 > PS: Versions ...
 >   root@wsk0 # iptables --version
 >   iptables v1.2.3
 >   root@wsk0 # uname -sr
 >   Linux 2.4.7-10smp
 >   root@wsk0 #
thats some old version there.
I strongly suggest that you upgrade to kernel 2.4.19, and iptables >= 
1.2.7. These version are filled with bugs. Upgrading might (though I 
doubt it) help with the problem.

Regards
Anders Fugmann

--
Author of FIAIF
Fiaif Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org



