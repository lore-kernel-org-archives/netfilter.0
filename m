From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Problem with PAT - HARD lock-up
Date: Wed, 5 Nov 2003 15:08:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051508.36925.Alistair@nerdnet.ca>
References: <3FA92644.91C0E53D@scs.carleton.ca>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA92644.91C0E53D@scs.carleton.ca>
Content-Disposition: inline
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
To: Peter Choynowski <pkc@scs.carleton.ca>, netfilter@lists.netfilter.org

On November 5, 2003 11:33 am, Peter Choynowski wrote:
> I need some ideas how to debug a hard lock-up problem with PAT.
>
> The setup - my test setup consists of 2 hosts, one running PAT, the
> other running Apache.  Both hosts are RH 8.0 with 2.4.22, iptables
> v1.2.8, P4 with 1GB of ram. I am using a default route pointing to the
> PAT for the return traffic from the web server.  The PAT rules are:
>
>         iptables -t nat -F
>         iptables -F
>
>         iptables -P FORWARD DROP
>         iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j
> ACCEPT
>
>         iptables -A FORWARD -i eth0 -o eth1 -p $proto --dport $port_numb
> -j ACCEPT
>         iptables -t nat -A PREROUTING -i eth0 -p $proto --dport
> $port_numb \
>           -j DNAT --to ${host_ip}:$port_numb
>
>
> Problem description - I am using wget from 2 or 3 outside hosts doing
> continuous gets of a 1Mb file from the web server - things work for
> about 5 to 40 min. after that that the PAT host locks up, the web server
> stays up.  Average transfer rate is about 60 Mbits/s.
>
> Actions taken - I have enabled SysRq, and other kernel debugging
> options, as well  added KDB code to the kernel, but when the lock-up
> happens neither can be invoked, there are no oops on the screen or logs
> of any kind - only reset button can bring it back.   I tried both 2.4.20
> and 2.4.22 with the same results.
>
> Any ideas ?

	I doubt (if Magic SysRq doesn't work) this will help much, but console over 
	serial port? 
	
	There are several kernel debuggng flags in 2.4.22 ... which do you have 
turned on other than SysRq? 

	You can turn on debugging in the iptables stuff in 
	/path/to/kernel/source/net/ipv4/netfilter/ip_tables.c
	there are three options in there that can be #defined and will 
	spew tons of info.
	

>
> Thx,
> Peter

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

