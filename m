From: Tomasz Korycki <engine2@flow.mine.nu>
Subject: Re: (no subject)
Date: Sat, 21 Feb 2004 15:52:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20040221154500.037bb8d0@198.52.32.246>
References: <1077367619.1966.3.camel@frozen>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077367619.1966.3.camel@frozen>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Anthony de Almeida Lopes <guerrilla_thought@gmx.de>
Cc: netfilter@lists.netfilter.org

At 07:46 2004-02-21, Anthony de Almeida Lopes wrote:
>Hi, I would like to add a certain rule to my firewall, but I have a
>dynamic IP, I'm wondering if there is some way I can work with this
>the line is as follows:
>
>iptables -A INPUT -p tcp -d <MyDynamicIP> --tcp-flags SYN,FIN SYN,FIN -j
>DROP

OTOMH:
iptables -A INPUT -p tcp -d `ip ad sh dev <external interface, like 
eth1>|grep inet|awk '{print $2}'|cut -d / -f 1` --tcp-flags SYN,FIN SYN,FIN 
-j DROP

I may be wrong on the "ip" output, You may need to change $2


