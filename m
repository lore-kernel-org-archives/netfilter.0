From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: query regarding hashlimit using ipset src,dst tuple
Date: Mon, 16 Oct 2006 11:19:14 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0610161101350.15489@blackhole.kfki.hu>
References: <001001c6f07e$9c290f80$0201a8c0@synapse.com> 
	<Pine.LNX.4.58.0610160858240.15459@blackhole.kfki.hu>
	<b322db070610160154g13f52818o32d0f7134c6d051@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b322db070610160154g13f52818o32d0f7134c6d051@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Retesh <retesh.chadha@gmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 16 Oct 2006, Retesh wrote:

> Can you let us know the way to AND 2 ipsets, with an example. It will
> be really useful.

Let's assume a bunch of servers (the IP addresses stored in the set
'servers') and a bunch of clients (the IP addresses stored in 'clients')
and one wants to allow any listed client to access any listed server:

iptables -A <chain> -m set --set clients src \
	            -m set --set servers dst \
		    -j ACCEPT

Or if you want to restrict the access to the given list of services on the
servers (port numbers are stored in 'services'), assuming the same list of
services on each server:

iptables -A <chain> -m set --set clients src \
	            -m set --set servers dst \
		    -m set --set services dst \
		    -j ACCEPT

Or if the list of services are different on the servers, then one can use
an ipporthash type of set to store (server IP, service port) pairs in
'server-service' and write:

iptables -A <chain> -m set --set clients src \
	            -m set --set server-service dst,dst \
		    -j ACCEPT

Hope it helps,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

