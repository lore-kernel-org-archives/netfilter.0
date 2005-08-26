From: "curby ." <curby.public@gmail.com>
Subject: Re: Monitoring a TARPIT
Date: Fri, 26 Aug 2005 15:56:00 -0600
Message-ID: <5d2f37910508261456604591e7@mail.gmail.com>
References: <BAY17-F395E91EF38C195535713309DAB0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F395E91EF38C195535713309DAB0@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Gottmar_Krak=E9liusz?= <ulan.bator@hotmail.com>
Cc: netfilter@lists.netfilter.org

On 8/25/05, Gottmar Krak=E9liusz <ulan.bator@hotmail.com> wrote:
> Hi!
> I use the TARPIT target to delay those brute force attacks on my SSH port=
.
> Now I wonder if there is a way of getting some statistics on how many, wh=
ich
> IP:s and for how long they are caught.
> AFAIK, I cant get ALL this by simply logging?

If you put your logging rule right before the TARPIT rule, it should
log everything that would get to TARPIT.  This will show you IPs that
get TARPIT-ed, and with some log analysis you could also find when,
how many, etc.

