From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Internal PC/external Gateway
Date: Tue, 17 May 2005 15:55:18 +0300
Message-ID: <1116334518.24331.6.camel@debianbox>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
	<20050514164144.GA24669@bender.817west.com>
	<1116090083.18707.6.camel@debianbox>
	<20050514172613.GA24810@bender.817west.com>
	<1116095410.18707.14.camel@debianbox>
	<20050514190005.GA25010@bender.817west.com>
	<1116114764.20275.0.camel@debianbox>
	<20050516214813.GA31167@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050516214813.GA31167@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Seems to be running smoothly. Thanks

On Mon, 2005-05-16 at 17:48 -0400, Jason Opperisano wrote:

> On Sun, May 15, 2005 at 02:52:44AM +0300, Sadus . wrote:
> > When i run this:
> > ip rule add from 192.168.1.3 table T2
> > 
> > i get this error:
> > RTNETLINK answers: Invalid argument
> 
> did you:
> 
>   echo 202 T2 >> /etc/iproute2/rt_tables
> 
> if you haven't i believe your error would be more along the lines of 
> 'Error: argument "T2" is wrong: invalid table ID'
> 
> does this give you the same error:
> 
>   ip rule add from 192.168.1.3 table main
> 
> if so--verify that your kernel was compiled with:
> 
>   CONFIG_IP_ADVANCED_ROUTER=y
>   
> if not--i don't believe you will be able to do policy routing until you
> recompile your kernel with the proper options set.
> 
> -j
> 
> --
> "Stewie: Yes, I rather like this God fellow. He's very theatrical, you
>  know, a pestilence here, a plague there. Omnipotence. Gotta get me some
>  of that."
>         --Family Guy
> 
