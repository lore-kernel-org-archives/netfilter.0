From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Im stupid or its broken
Date: Sun, 15 Sep 2002 12:02:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020915110243.OMDJ14766.mta05-svc.ntlworld.com@there>
References: <200209131029.g8DATBQ32523@bergelmer.thn.htu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209131029.g8DATBQ32523@bergelmer.thn.htu.se>
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

On Friday 13 September 2002 11:29 am, Mats Blomstrand wrote:

> Hi all
> This is perhaps a stupid question. But I have *really* tried to
> get it by reading FAQ's and tutorials all over all week long.
> Please take some  time to help me out.
>
> I have a master and a couple of nodes that need NAT from master.
> If I boot master and nodes without any iptables stuff and then
> add this rule to iptables
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
>
>   root@wsk9 # mount -t nfs wsk0.vip:/usr/local/share/ /usr/local/share/
>   mount: RPC: Timed out
>   root@wsk9 #

I see no reason why the situation should be different after rebooting the 
client machine.

Can you either add some LOGging rules to the INPUT chain on the nfs server to 
see whether it is getting packets for nfs, or else run a packet sniffer such 
as ethereal on the network joining the two machines, to see what's different 
before & after the reboot ?

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

