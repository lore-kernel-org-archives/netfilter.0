From: "curby ." <curby.public@gmail.com>
Subject: Re: DNAT - newbie question
Date: Wed, 3 Aug 2005 14:55:20 -0600
Message-ID: <5d2f379105080313556d4e95ed@mail.gmail.com>
References: <7f22af9005072815367ee89a78@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7f22af9005072815367ee89a78@mail.gmail.com>
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
To: Dharanikanth Dugginni <dharanikanthd@gmail.com>
Cc: netfilter@lists.netfilter.org

On 7/28/05, Dharanikanth Dugginni <dharanikanthd@gmail.com> wrote:
> Lets suppose a host h1 is sending packets to addr N1 (this is the addr
> for NAT box)  I want to change this addr to a different addr which
> will not be known until after few packets arrive from h1 to n1.
> (Appears from the conntrack and NAT tables documenatation that after
> the first packet, the DNAT table will not be used any more).  Is there
> a way to force subsequent pacekets in the same stream to always use
> the DNAT table?

Are you using stateful rules?  If not, your DNAT rule handles packets
heading to N1, and NAT code transparently deals with packets heading
the other way.  If you are using an ESTABLISHED state-matching rule,
then only the first packet matches the DNAT rule, and then state
matching rule allows subsequent packets through, while NAT still
happens in the background.  At least I think so. =3D)

