From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what rules to use
Date: Wed, 23 Oct 2002 16:23:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210231523.g9NFNrL02953@vulcan.rissington.net>
References: <3DB69D6C.9030701@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DB69D6C.9030701@bol.com.br>
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

On Wednesday 23 October 2002 2:00 pm, Julio Cesar Ody wrote:

> Hello, I have the following scenario:
>
>   --------                       --------
> |gatebox1|  ----------------   |gatebox2|
>   --------                       --------
>      |      \
>      |        \
>      |          \
>   --------         --------
> |userbox1|       |userbox2|
>   --------         --------
>
> gatebox1(10.2.56.5) is the main router in the network. It's a red hat
> 7.3 box performing NAT, and uses a 802.11b connection to the internet.
>
> gatebox2(10.2.56.3) is a WinNT 4 machine equipped with a sattellite
> connection device used to access a private site/intranet (gmconnect
> domain) that only accepts requests made by that device (or real ip range).
>
> when the userboxes make any request for the gmconnect domain, I need
> them to get routed to gatebox2, instead of going straight to the
> internet via gatebox1, so gatebox2 can make the request and deliver the
> content to the userboxes (since it's the only way to get it).

This is simply a routing question - nothing to do with netfilter really.

All you need to do is set up a route on gatebox1 so that packets for the 
gmconnect domain are routed via gatebox2.

gatebox2 also needs a route back to your userboxes via gatebox1 of course.

Antony.

-- 

This is not a rehearsal.
This is Real Life.

