From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Doubt about DNAT
Date: Tue, 10 Sep 2002 16:05:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209101506.g8AF64v07237@vulcan.rissington.net>
References: <009d01c258d4$aadbfc90$0100a8c0@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009d01c258d4$aadbfc90$0100a8c0@desktop>
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
To: netfilter@lists.samba.org

On Tuesday 10 September 2002 3:16 pm, Rodrigo Leme de Mello wrote:

> Hi all,
>
> I am in trouble to do a rule. Anybody can help me?
>
> I want to redirect all traffic from a specific valid ip and specific
> destination port to a machine located inside a LAN.
>
> This rule is to access SQL Server that is located inside a LAN and i have a
> valid ip address in a linux machine with iptables.
>
> I've tried the following:
>
> Lan IP with SQL Server: 192.168.0.10
> Valid IP with iptables: 200.221.98.123
> Valid IP that will acess SQL Server. 200.206.123.112
>
> This rule i've put in the machine 200.221.98.123
>
> iptables -t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j
> DNAT --to 192.168.0.10
>
> And now i configure my SQL Server to connect to 200.221.98.123 but i still
> can't connect. Dou you have any idea why it is not working?

1. Do you have a rule to allow the packets through, such as:

iptables -A FORWARD -s 200.206.123.112 -p tcp --dport 1433 -d 192.168.0.10 -j 
ACCEPT

2. Try adding a LOG rule in your FORWARD and INPUT chains so you can see if 
there are any other packets trying to get through which you didn't think of:

iptables -A FORWARD -s 200.206.123.112 -j LOG
iptables -A INPUT -s 200.206.123.112 -j LOG

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

