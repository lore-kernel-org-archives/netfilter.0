From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: [newbie]DNS on the internet... how to allow connections?
Date: Mon, 21 Feb 2005 19:08:15 -0500
Message-ID: <200502211908.15493.Alistair@nerdnet.ca>
References: <421A7018.4030800@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <421A7018.4030800@fastwebnet.it>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

	Marco -- yer on the right track -- read in line.... 

On February 21, 2005 06:34 pm, Marco Nicoloso wrote:
> Hi there,
>
> I solved all of my routing problems which I had before... Now everything
> works fine, but the name resolution. According to the scheme (Trusted
> subnet -> Firewall -> Internet), hosts on my trusted subnet can see the
> DNS properly, they get its address from the DHCP, but they cannot get
> DNS queries satisfacted.

	DNS queries -- okay - unless the DNS is on the same box as the firewall you 
want to :
>
> I tried with different rules, but none works:
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT
	Change INPUT to FORWARD 
	and try again...
> or these:
> $IPTABLES -A FORWARD -p tcp -s $DNS1_IP -j ACCEPT
> $IPTABLES -A FORWARD -p tcp -s $DNS2_IP -j ACCEPT
> $IPTABLES -A FORWARD -p udp -s $DNS1_IP -j ACCEPT
> $IPTABLES -A FORWARD -p udp -s $DNS2_IP -j ACCEPT
>
	Loose the above and use an ESTABLISHED, RELATED rule to accept the returns.

> Do I have to setup my own named, cache queries and requests new ones if
> I need? Or it is just my problem, that I am not able to write rules...?
	
	Nope -- just let the queries THROUGH the firewall -- not in or out.


	Alistair
>
> Thanks in advance
>
> Marco Nicoloso

