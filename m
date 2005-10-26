From: Askar <askarali@gmail.com>
Subject: Re: Allowing ping
Date: Wed, 26 Oct 2005 21:24:50 +0500
Message-ID: <a0f69e50510260924j61ed687dkfaf0a5a2bf4af82a@mail.gmail.com>
References: <435E6C3A.20709@beaconet.net> <200510261055.48199.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510261055.48199.rob0@gmx.co.uk>
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

hi rob

would you pls share your iptables rules that dealng incoming pings ?


On 10/26/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Tuesday 2005-October-25 12:32, Askar Ali wrote:
> > I have a very simple question, presently we are blocking icmp
> > "ping" on our servers. But as far I can userderstand its not very
> > good practice or providing a good security by blocking ping request.
>
> I agree. Blocking pings is like shooting yourself in the foot.  You
> never know when you will need ping. Some think it's a good idea to try
> to hide. Rubbish, if you have any open services, the bots and worms
> will find you anyway.
>
> > see one can ping www.xyz.com and get the reply back.
> >
> > However Before allowing ping "echo-request" I just want to confirm
> > whether doing ...
> >
> > iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
> >
> > would be enough or doing some rate limiting would be better?
>
> I think a reasonable --limit is not a bad idea, but there is no
> objective measurement of "better". I use a --limit on incoming ping
> requests. It might help in the event of a flood ping attack, and you
> can still ping to verify your connectivity when you need it.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>


--
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)

