From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 17:22:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081722.59297.Antony@Soft-Solutions.co.uk>
References: <Law11-F6JcZikaTAbNF00019dce@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law11-F6JcZikaTAbNF00019dce@hotmail.com>
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

On Thursday 08 January 2004 5:12 pm, Martin Leduc wrote:

> Good morning Mr Stone,
>
> I'm sorry, I guess I dont explain correctly.
>
> I have a IP range about /28 Public IP.  I have 2 NIC in my Linux BOX, one
> for the Internet and the other for my servers Switch.

Oh.   If you do not have a DMZ network then the suggestion made earlier to 
subnet your /28 will not work.   We thought you had a genuinely separate DMZ 
with the publicly-accessible servers on it.

> My Topology:
>
> 192.168.0.2 (WEB) <---|
> 192.168.0.3 (DNS) <---|
> 192.168.0.4 (MAIL)<---|
> 		    eth1
> 		192.168.0.1 (GW)
> 		   -------
> 		   | BOX |
> 		   -------
> 		      ^
> 	eth0   : 20.0.0.1
> 	eth0:0 : 20.0.0.2  (DNAT 192.168.0.2)
> 	eth0:1 : 20.0.0.3  (DNAT 192.168.0.3)
> 	eth0:2 : 20.0.0.4  (DNAT 192.168.0.4)
> 		      ^
> 		   INTERNET

So where are the local client machines?

> So I have rules
> iptables -t nat -A PREROUTING -p tcp/udp --port X -s 20.0.0.2 \
> -j DNAT --to-destination 192.168.0.2:X
>
> And my postrouting
>
> iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.2 -j SNAT --to-source
> 20.0.0.2

I still don't understand where the local client machines are on your network.   
What you have described above should work fine for clients which are out on 
the Internet.

> My FORWARD rules are WideOpen

UGH!

> Spliting my DNS is not an option.

Why not?

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".


