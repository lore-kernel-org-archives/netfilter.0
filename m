From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: Re: ip6tables problem
Date: Wed, 20 Dec 2006 20:35:13 +0000
Message-ID: <79328ea80612201235nb8e3f20v8cf193afe8ea6c9b@mail.gmail.com>
References: <79328ea80612191634s1ffbb494ge96c56c771a05d66@mail.gmail.com>
	<slrneoifta.ln3.xpisar@album.ics.muni.cz>
	<79328ea80612200756i538b3f4fp38192730a8518fc5@mail.gmail.com>
	<slrneoinkj.miu.xpisar@album.ics.muni.cz>
	<79328ea80612200837q45d7bbd5y1723904880f6d90@mail.gmail.com>
	<79328ea80612201233t424a761eo23cdc74176ccc9bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <79328ea80612201233t424a761eo23cdc74176ccc9bf@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 12/20/06, Asfand Yar Qazi <ayqazi@gmail.com> wrote:
>
> Argh - still no luck.  I can now ping6 remote destinations, but I
> can't, for example, establish ssh connections.  I can't even ssh to
> another local box over eth0!
>
> To summarise, here's where it stands:
>
> ip6tables -N filter6
> ip6tables -A filter6 -p icmpv6 -j ACCEPT
> ip6tables -A filter6 -m state --state NEW -i ! tunbt6 -j ACCEPT
> ip6tables -A filter6 -m state --state ESTABLISHED,RELATED -j ACCEPT
> ip6tables -A filter6 -j REJECT
>
> ip6tables -A INPUT -j filter6
> ip6tables -A FORWARD -j filter6
>
> To force it to let me ssh around to and from my router box, I am
> forced to do this:
> ip6tables -N filter6
> ip6tables -A filter6 -i eth0 -j ACCEPT
> ip6tables -A filter6 -i lo -j ACCEPT
> ip6tables -A filter6 -p icmpv6 -j ACCEPT
> ip6tables -A filter6 -m state --state NEW -i ! tunbt6 -j ACCEPT
> ip6tables -A filter6 -m state --state ESTABLISHED,RELATED -j ACCEPT
> ip6tables -A filter6 -j REJECT
>
> ip6tables -A INPUT -j filter6
> ip6tables -A FORWARD -j filter6
>
> Anybody know what's happening?
>

And let me just add that doing what I did on the last bit only lets me
ssh to/from this router box inside my network (over eth0) - why was
enabling lo explicitly necessary?

Thanks

