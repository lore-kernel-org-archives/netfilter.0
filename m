From: Frank <oldcurmudgeon@gmail.com>
Subject: Re: Policy routing with mark not working.
Date: Fri, 12 May 2006 17:10:30 -0700
Message-ID: <803aaa110605121710s26eaccf6r4a8d9bd78924721b@mail.gmail.com>
References: <20060510202615.51988.qmail@web53303.mail.yahoo.com>
	<44625A23.30606@zoomnet.ro>
	<803aaa110605111701v56ea7d8dg39b278888321b1ee@mail.gmail.com>
	<4464694E.8030309@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4464694E.8030309@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

On 5/12/06, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Frank a =E9crit :
> > Also, after much time banging my head against the wall trying to
> > figure out why my marks were ignored, I discovered that in spite of
> > what the netfilter packet traversal diagram shows, marks set in
> > PREROUTING are ignored for packets originating on the box doing the
> > routing, and the marks need to be set on the OUTPUT chain for that
> > case
>
> "In spite" ? What are you tacking about ? That's exactly what the
> Netfilter diagram shows : locally generated packets don't go through the
> PREROUTING chain - except when sent to (and therefore received back
> from) the loopback interface.
>
Yes, you are correct about PREROUTING, although there was dual-homed
howto that made no mention of how to handle locally-generated traffic
but just used PREROUTING, and I initially went down that dead-end
That's what I get for taking an example config at face value and not
doing sufficient research.  However, diagrams such as the one at
http://www.docum.org/docum.org/kptd/  show the routing decision made
before the OUTPUT chain, making me believe setting a mark there
wouldn't work.  After further research I discovered that the routing
decision is revisited if the packet is later changed (i.e., a mark
being set in the OUTPUT chain), and that important detail seems to be
left out of the traversal diagrams I've found before now (the one
mentioned above does have some notes below it mentioning the
rerouting, but otherts I found didn't).

