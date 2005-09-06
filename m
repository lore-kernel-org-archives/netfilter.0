From: "curby ." <curby.public@gmail.com>
Subject: Re: only SNAT packets originating from local?
Date: Tue, 6 Sep 2005 14:39:01 -0600
Message-ID: <5d2f3791050906133966bfc5ac@mail.gmail.com>
References: <42410.80.87.162.74.1125668107.squirrel@aachalon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42410.80.87.162.74.1125668107.squirrel@aachalon.de>
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

(forgot to CC the list the first time i sent this)

On 9/2/05, Christian Bricart <christian@bricart.de> wrote:
> is there a simple way to do SNAT for packets that originate from the
> router itself?

Try using something like the following:

iptables -t nat -A OUTPUT -j SNAT --to-source $EXTDEV_SNATIP

Of course, this is oftentimes not necessary, but it might be if you
have *multiple* external-facing static IPs from which you want to set
one for outbound traffic.

Off-topic musing: It might also be strange if you have two static IPs
A and B with sshd listening to port 22 on both of them.  Someone
connects to B, but you SNAT the reply out of A, and the client gets
confused and drops the reply.

--Curby

