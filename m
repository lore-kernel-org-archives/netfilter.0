From: Harry <hari76@omantel.net.om>
Subject: Re: Rules for Blocking Proxies...THANKS !!
Date: Wed, 28 Apr 2004 10:34:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c42d47$01e04760$36b4fea9@SABNANIS>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS>
 <200404201453.14678.Antony@Soft-Solutions.co.uk>
 <00ba01c426e3$a4d0de40$0c00a8c0@pepelui>
 <200404201537.12472.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi All,
Many thanks Mr.Antony, Alexix and the rest who helped me with the rule, the
DNAT rule works great!! Was just going thru a website
http://www.antiproxy.com
wow...they have loads of ports thru which proxies can be bypassed?So does
that mean I have to write rules for each of the relavent ports?at the moment
I have just done for port 3128, and blocked the site antiproxy.com thru
squid.
Suggestions are welcome...

Regards
Harry

"In all this world, there is only you
When all else ceases, there is only you"
-- to my MASTER!
    Harish
harish@sabnanis.com
harish.sabnani@cyberhutoman.com
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, April 20, 2004 7:37 AM
Subject: Re: Rules for Blocking Proxies...


> On Tuesday 20 April 2004 3:27 pm, Alexis wrote:
>
> > beside this.
> > You could remove privileges from the clients, even with an active
directory
> > implementation (ajjjj) or i think i saw cybercafe software that block
any
> > settings change on the client box.
>
> That is making some very big assumptions about what Operating System/s are
> running on the clients....
>
> Regards,
>
> Antony.
>
> --
> The truth is rarely pure, and never simple.
>
>  - Oscar Wilde
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>


