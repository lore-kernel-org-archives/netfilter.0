From: "curby ." <curby.public@gmail.com>
Subject: Re: Kind of Limits
Date: Tue, 26 Jul 2005 09:43:12 -0600
Message-ID: <5d2f3791050726084365a8deea@mail.gmail.com>
References: <3b29fb7905072513472be37619@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b29fb7905072513472be37619@mail.gmail.com>
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
To: bright true <brighttrue@gmail.com>
Cc: netfilter@lists.netfilter.org

On 7/25/05, bright true <brighttrue@gmail.com> wrote:
> Hello ,
>  i have no experience with iptables at all ... i just want to get my prob=
lem
> solved , i hope you can help me
>  How can i limit the number of connection or not limiting , let's say
>  when the number of connections reach the ALLOWED numbers of connections =
it
> will get block for about 2 minutes or something

It's difficult to solve problems when you don't have experience. =3D)

Try looking at the recent, connlimit, and expire matches.  Whether
they can be used directly without recompilation depends on your
distribution/installation of netfilter.

