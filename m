From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: differences between win and unix tcp clients.
Date: Tue, 16 Mar 2004 07:41:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079440877.2021.71.camel@grendel>
References: <024b01c40b4f$e3341620$3f32a8c0@ds.ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <024b01c40b4f$e3341620$3f32a8c0@ds.ig.com.br>
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
To: Fabiano Reis <silos.reis@ig.com.br>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-03-16 at 07:12, Fabiano Reis wrote:
>
> iptables -A INPUT -p tcp --source 192.168.0.2 --dport 23 -j REJECT
> iptables -A INPUT -p tcp --source 192.168.0.3 --dport 23 -j REJECT
>  
> On the Solaris machine: a very fast response that the connection was
> refused.
>  
> On the Windows 2000 machine: after for about 20 seconds I got the
> message that the connect failed (I thing this is the same as
> connection refused).

If you don't specify a reject option, the default is an ICMP port
unreachable. This is an odd thing to return for a closed TCP port, as
normally it would be an ACK/RST.

So I'm guessing that Solaris handles this like an ACK/RST while Windows
handles this like any generic type 3 error. Doing a:

-J REJECT --reject-with tcp-reset

would produce more consistent results, however you are running such an
old version of iptables I *think* that version was still returning bad
sequence numbers on the RST's. It might work for you, it might not. You
should really upgrade.

HTH,
C



