From: TheGesus <thegesus@gmail.com>
Subject: Re: QUEUE function called twice?
Date: Fri, 9 Sep 2005 06:26:14 -0400
Message-ID: <5e70f6530509090326538d2a0e@mail.gmail.com>
References: <000001c5b46a$87d8c2b0$2801a8c0@MBRC40>
	<000101c5b4e4$2996f7b0$2801a8c0@MBRC40>
Reply-To: thegesus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000101c5b4e4$2996f7b0$2801a8c0@MBRC40>
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
To: netfilter <netfilter@lists.netfilter.org>

This has happened to me so many times I have started using /dev/rob0's
method of editing an iptables-restore file instead of writing a
script.  It seems to be the only way to guarantee tables and chains
get flushed between revisions.

On 9/8/05, Michael D. Berger <m.d.berger@ieee.org> wrote:
> Mia culpa.  Because of a script error, I had two
> similar -j QUEUE lines.  My apologies.
> Mike.
> --
> Michael D. Berger
> m.d.berger@ieee.org
>

