From: Karl Fischer <karl.fischer@quantum.com>
Subject: Re: DNAT w ssh tunnel
Date: Fri, 21 Jun 2002 09:49:46 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D12DA9A.E2C585BC@atlp.de>
References: <3D12D59E.6020709@finsiel.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: eth <eth@finsiel.ro>
Cc: netfilter@lists.samba.org

eth wrote:
> 
> Hi listers.
> 
> I try to make a simple tunnel for a jdbc connection with port forward from
> one machine to another via a firewall.
> 
> |client| --Inet--> |firewall| --LAN--> |database|
> 
> The client runs a ssh client with port forwarding to the firewall machine.
> On the fw I have the "simpleproxy" which is a tcp proxy that forwards all
> local sockets to a remote host. Yet I thought I should do a:
> 
> iptables -t nat -A OUTPUT -d 194.226.254.1 -p tcp -m tcp --dport 1521 -j
> DNAT --to-destination 192.168.10.100:1521
> 
> ... which should do the fw->database port forward trick; it doesn't. :-|

Hi, 

you don't even need to use netfilter's port-forwarding and also no
simpleproxy. SSH does all the job on it's own and most secure too ...

on the client you use:

ssh -L 1521:192.168.10.100:1521 user@firewall

then your database frontend on the client should be able to connect to
the database using the localhost interface 127.0.0.1:1521 - that's it.

Regards
- Karl



