From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: string match fails to find anything/everything
Date: Tue, 20 Jul 2004 14:10:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407201410.48990.Antony@Soft-Solutions.co.uk>
References: <20040718221103.28836.60474.Mailman@vishnu.netfilter.org> <2996.216.239.71.162.1090327934.squirrel@216.239.71.162>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2996.216.239.71.162.1090327934.squirrel@216.239.71.162>
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

On Tuesday 20 July 2004 1:52 pm, Samuel Jean wrote:

>  On Sun, 18 Jul 2004, gypsy wrote:
> > Problem:
> > No matter what text is in $STRING, iptables fails to see the match.
> >
> > iptables -I INPUT -m string --string $STRING -j LOG
>
> That rule will _only_ apply for packets going to the firewall itself.

Correct.

> > "iptables -nvL | grep STRING" has zeros in the counters.
> >
> > Example:
> > Replace $STRING with "oreilly".  From a remote computer run "lynx
> > http://myurl/oreilly" and variants until at least 30 pages have been
> > displayed to be certain that at least one packet is not so fragmented
> > that "oreilly" isn't there (see also Facts above).  On the "myurl"
> > computer iptables counters are zero.
>
> Try using that match in the FORWARD chain.

No, I think INPUT is the right one to use here - because the web server is 
running on "myurl", and that is the machine with the netfilter rules (as 
stated in the explanation given above).

Regards,

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


