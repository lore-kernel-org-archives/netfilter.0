From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 15:28:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051528.hA5FSar13183@agate.rockstone.co.uk>
References: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br> <1068043048.810.141.camel@elendil.intranet.cartel-securite.net> <014201c3a3af$abc00bc0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <014201c3a3af$abc00bc0$c2bf09ca@Housecall>
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

On Wednesday 05 November 2003 3:15 pm, hare ram wrote:

> Hi
>
> iam using p-o-m with PSD patch
>
> right now iam running this
>
> iptables -A INPUT -m psd -j DROP
>
> how do i run the script like this
> Log the Portscanner IP and Drop them

How about:

iptables -N log-and-drop

iptables -A INPUT -m psd -j log-and-drop

iptables -A log-and-drop -j LOG --log-level=....etc
iptables -A log-and-drop -j DROP

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.
                                                     Please reply to the list;
                                                           please don't CC me.

