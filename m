From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: Re: string match fails to find anything/everything
Date: Tue, 20 Jul 2004 08:52:14 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2996.216.239.71.162.1090327934.squirrel@216.239.71.162>
References: <20040718221103.28836.60474.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040718221103.28836.60474.Mailman@vishnu.netfilter.org>
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

 On Sun, 18 Jul 2004, gypsy wrote:
> Problem:
> No matter what text is in $STRING, iptables fails to see the match.
>
> iptables -I INPUT -m string --string $STRING -j LOG

That rule will _only_ apply for packets going to the firewall itself.

>
> "iptables -nvL | grep STRING" has zeros in the counters.
>
> Example:
> Replace $STRING with "oreilly".  From a remote computer run "lynx
> http://myurl/oreilly" and variants until at least 30 pages have been
> displayed to be certain that at least one packet is not so fragmented
> that "oreilly" isn't there (see also Facts above).  On the "myurl"
> computer iptables counters are zero.

Try using that match in the FORWARD chain.

>
> QUESTION:
> How can I find out why the string match fails to find the intended
> text?  (Later on I may ask how to fix that...)
>
> gypsy
>
>
> --__--__--

--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


