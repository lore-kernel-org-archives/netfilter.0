From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: (no subject)
Date: Sat, 21 Feb 2004 13:26:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4037CD0C.8020605@smgtec.com>
References: <1077367619.1966.3.camel@frozen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Anthony de Almeida Lopes <guerrilla_thought@gmx.de>
Cc: netfilter@lists.netfilter.org

No, but if you have a dynamic IP on the firewall, you can use the -i 
<dynamic_ip_network_interface> instead to do the same thing.

Anthony de Almeida Lopes wrote:

>Hi, I would like to add a certain rule to my firewall, but I have a
>dynamic IP, I'm wondering if there is some way I can work with this
>the line is as follows:
>
>iptables -A INPUT -p tcp -d <MyDynamicIP> --tcp-flags SYN,FIN SYN,FIN -j
>DROP
>
>Thanks for any information you can provide.
>
>--tony
>  
>

