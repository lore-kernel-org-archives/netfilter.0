From: "Andrej Ricnik" <lemmetink@hotmail.com>
Subject: Re: lan users surfing on lan webserver
Date: Wed, 26 Feb 2003 01:37:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F65mOV39Y1Ije0f3aRN00013cfa@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>I'm configuring a firewall on a network where we have put
>the webserver on the inside of the firewall and given it
>a reserved ip-address.
>I have done the appropriate forwarding so that the webserver
>can be reached from the internett. Trouble is, users on the
>LAN have to use its internal ip-address to reach the web-
>pages. I know I can set up an internal dns-server to fix this,
>but I was hoping it would be possible to solve this with some
>more ip-forwarding.
>
>Is it possible to forward internal requests going to the
>external webserver-address back into it's internal address?
>
>Is it recommended? :)

Not quite sure what you're actually after, but to
me it sounds as if what you *really* need is Squid
and transparent proxying :)

Cheers,
Tink

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCM/IT/O d-(++)@ a C+(+++)@ UL++>+++ P+>+++ L++ E+@ W+@ N+ o? K? w---@(+) 
O+++(+)@ M-@ V? PS+ PE- Y+ PGP++ t- 5- X- R-(*) tv-@ b+ DI++ D-- G++ !e* 
h--- r++ z?
------END GEEK CODE BLOCK------



_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


