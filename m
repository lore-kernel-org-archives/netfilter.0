From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: transparent proxy
Date: Tue, 16 Mar 2004 08:44:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403160844.24937.Antony@Soft-Solutions.co.uk>
References: <3C204966522884458700FF59D6EFB87A474DDE@FORUS01.netpower.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3C204966522884458700FF59D6EFB87A474DDE@FORUS01.netpower.lan>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Monday 15 March 2004 9:19 am, Fredrik Emil Jensen wrote:

> Hey
>
> I'm currently using squid and squidGuard for redirection. Setting up the
> rules:
>
> Iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -d 0/0 --dport 80
> -j REDIRECT --to-ports 3128
>
> But does anyone know what to do if you want to use iptables to bypass
> squid with single IP address?

Yes, put a rule above that one in the PREROUTING chain which matches the 
source address you don't want to be REDIRECTed, and jump out of the chain:

iptables -I PREROUTING -t nat -p tcp -s 192.168.1.10 --dport 80 -j ACCEPT

That will match a single address, 192.168.1.10, TCP port 80, and make sure the 
following REDIRECT rule is not activted.   Note the "-I" to insert the rule 
at the top of the list, instead of the more common "-A" which appends to the 
end of the list.

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


