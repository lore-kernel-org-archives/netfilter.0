From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: query regarding hashlimit using ipset src,dst tuple
Date: Mon, 16 Oct 2006 14:36:11 +0800
Message-ID: <360980823.25277@mail.nankai.edu.cn>
References: <360933340.11695@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <4533285B.8040609@mail.nankai.edu.cn>
In-Reply-To: <360933340.11695@mail.nankai.edu.cn>
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
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Manish Jain :
> Hi,
>
> I have a requirement as follows -
>
> Say there are 2 source IPs - src1 and src2, and 2 destination IP - dst1,
> dst2.
> I need to limit src1->dst1 as well as src2-dst2 communication but want
> unlimited src2->dst1 communication.
> I have a ipset KNOWN, which contains src1, src2, dst1, dst2
>
> Now i write a rule as follows -
> iptables -A INPUT_CHAIN --match hashlimit --hashlimit 1000/s
> --hashlimit-mode srcipdstip --hashlimit-name foo -m set --set KNOWN
> src,dst -j ACCEPT
>
> But this will limit the src2->dst1 communication as well, which I dont
want.
>
> 1. Is there a way to add ip1,ip2 as a tuple in a ipset the way we can
do for
> ip1%port?
Yes , look the ipset manual to find the binding .
> 2. Is there a mode which can help me do this, using a single iptable
rule as
> above?
Following maybe :
ipset -N from  ipmap --network 192.168.0.0/24
ipset -A from src1
ipset -A from src2

ipset -N to ipmap --network 192.168.0.0/24
ipset -A to dst1
ipset -A to dst2

ipset -B from default -b to

iptables -A INPUT_CHAIN --match hashlimit --hashlimit 1000/s
- --hashlimit-mode srcipdstip --hashlimit-name foo -m set --set KNOWN
src,dst -j ACCEPT

> 3. Is there a way to specify multiple ipsets in 1 iptable rule?
I think one set with its bindings can do everything for you ~
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFMyha7tZp58UCwyMRAhWDAJ9o8DdSFxcMDUbK8djcqtTF3Va7MACgsbU1
e5JKNYI/P62IGXKtVD3i7wY=
=mDXZ
-----END PGP SIGNATURE-----


