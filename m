From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Thu, 2 Dec 2004 07:13:59 -0800
Message-ID: <CACE583C-4474-11D9-A63B-0003939B51C0@grajagan.org>
References: <1101964546.2025.149.camel@localhost>
	<Pine.LNX.4.44.0412012128370.22471-100000@gollum.grajagan.net>
	<20041202151447.GA4749@bender.817west.com>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041202151447.GA4749@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Jason,

	my ESP packets do not go from the external interface to the internal 
one and vice versa. The connection to the VPN server works when I hook 
up directly with no changes other than the IP of the client. I cannot 
see how this would be a problem with the VPN network at all.

h.

On Dec 2, 2004, at 7:14 AM, Jason Opperisano wrote:

> On Wed, Dec 01, 2004 at 09:44:13PM -0800, Helge Weissig wrote:
>> ok... I now have:
>
> <snip>
>
> do you control the VPN server?  it looks like the packets from your
> client are getting dropped at that end either pre or post decrypting
> (most likely post).  what is the VPN server?
>
> -j
>
> --
> "English - Who needs that? I'm never going to England!"
>         --The Simpsons


