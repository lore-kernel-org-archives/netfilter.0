From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 19:57:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404301957.13018.Antony@Soft-Solutions.co.uk>
References: <1083350727.40929ec75a56c@sistemica.info>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083350727.40929ec75a56c@sistemica.info>
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

On Friday 30 April 2004 7:45 pm, Rhaoni Chiu Pereira wrote:

> Hi List,
>
>     I must implement a few firewallrules but I'm a little bit lost. I use a
> transparent proxy with this following rule:
>
>     IPTABLES -t nat -A PREROUTING -p tcp -i eth1 -s 192.168.0.0/16 -d !
> 192.168.0.0/16 --dport 80 -j REDIRECT --to-port 3128
>
>      The -d parameter is because I have a few VPN's and my squid uses a
> tcp_outgoing_address, so ... Now I must create some exceptions for two IP's
> more than the 192.168.0.0/16 net but I don't know how ... any ideas ?

iptables -N mytable
iptables -A PREROUTING -t nat -p tcp -i eth1 -s 192.168.0.0/16 --dport 80 -j 
mytable
iptables -A mytable -t nat -d 192.168.0.0/16 -j RETURN
iptables -A mytable -t nat -d 129.37.0.113 -j RETURN
iptables -A mytable -t nat 32.97.118.242 -j RETURN
iptables -A mytable -t nat -j REDIRECT --to 3128

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


