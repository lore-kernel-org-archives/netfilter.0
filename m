From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging MAC
Date: Sat, 22 May 2004 17:17:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221717.20889.Antony@Soft-Solutions.co.uk>
References: <5390820828.20040521103958@alternativa.com.br> <200405221333.35216.Antony@Soft-Solutions.co.uk> <200405221157.32312.Alistair@nerdnet.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405221157.32312.Alistair@nerdnet.ca>
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

On Saturday 22 May 2004 4:57 pm, Alistair Tonner wrote:

> On May 22, 2004 08:33 am, Antony Stone wrote:
> >
> > I guess (without having looked at the source) that it should be a simple
> > enough hack to get ipt_LOG.c to log MAC addresses for all chains.
>
> 	should be ridiculously simple -- the limiter is a wrapping if statement
>
> 	if ( in && !out) {
>
> 	(logging of MAC code)
> 	}
>
> 	I suspect that the clever hacker will want to re-wrap that if statement
> such that it only logs it if there IS a MAC address present.  Not being a
> maven with such, I'm NOT gonna make any suggestions as to how.

I would guess that such a check is already present (still not having bothered 
to look at the source code), because as you said yourself earlier in this 
thread:

> >     I note that iptables doesn't log mac addresses it cannot see (i.e. not
> > directly connected)

And this is true even for the INPUT chain (eg: when you are using a ppp 
interface), so presumably the check for "only show MAC if one exists" is 
already coded.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


