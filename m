From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: poptop connection problem
Date: Thu, 24 Oct 2002 19:32:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021024183300.HQLI292.mta03-svc.ntlworld.com@there>
References: <200210231602.00745.roy@karlsbakk.net> <200210241155.g9OBtEe04312@vulcan.rissington.net> <005101c27b89$90256120$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005101c27b89$90256120$8c01a8c0@sundaram>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Thursday 24 October 2002 7:17 pm, Sundaram Ramasamy wrote:

> Hi,
>
> I am trying setup poptop VPN server on my firewall machine.
>
> eth0 - internet IP
> eth1 - LAN IP (192.168.1.1)
>
> from inside my LAN I was able to make the connection, from outside I was
> not able to make the connection.
>
> tcpdump -i eth0 proto 47 or port 1723
> the above command not showing any  information.
>
> my iptables command:
> iptables -A INPUT -i eth0 -p tcp --dport 1763 -j ACCEPT
> iptables -A INPUT -i eth0 -p 47 -j ACCEPT

What packets are you allowing out ?

Try adding a rule at the end of your INPUT chain just before the default DROP 
to LOG any packets which aren't being accepted to see if you need any extra 
rules.

The fact that it worked from the inside but it doesn't work from the outside 
means that (a) it can be made to work, (b) the problem, if it's with 
netfilter, must be in a rule which specifies the interface or the source 
address, and (c) you can easily capture a working session from the inside to 
see what protocols / ports it does need, to make sure they are allowed from 
the outside.

Are you sure that your ISP doesn't block the ports or protocols needed to 
make this work externally ?

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

