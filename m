From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall script by Iptables in redhat 9
Date: Mon, 12 Apr 2004 10:21:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404121021.16383.Antony@Soft-Solutions.co.uk>
References: <5.1.1.1.2.20040412095542.02ce11d8@jakarta.omnes.slb.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.1.1.2.20040412095542.02ce11d8@jakarta.omnes.slb.com>
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

On Monday 12 April 2004 3:58 am, Sutono wrote:

> Hi Alll,
>
> Are some of you have a firewall script use iptables in linux redhat 9?
> If you have, could you share to me please ....
>
> Thank you

Here's a script I find pretty secure.   I don't think there's anything 
specific to RedHat 9 about it, so it should work on other distros too:

iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

It lets me use ssh from my box to other machines (I can tunnel any other 
protocols through ssh), and it stops anything else getting into my machine.

Share and enjoy.

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


