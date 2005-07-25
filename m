From: "curby ." <curby.public@gmail.com>
Subject: Re: IP:Port REDIRECT problem
Date: Mon, 25 Jul 2005 12:48:41 -0600
Message-ID: <5d2f379105072511486949e30f@mail.gmail.com>
References: <42E35541.9050205@eulerhermes.pl>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E35541.9050205@eulerhermes.pl>
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
To: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Cc: netfilter@lists.netfilter.org

On 7/24/05, Marcin Giedz <marcin.giedz@eulerhermes.pl> wrote:
> As you can see default gateway for SERVICE SERVER is GATEWAY1. In
> GATEWAY1's iptables rules there is redirection rule for port 4000 to
> SERVICE SERVER:4000. In such configuration everything is OK, I can run
> service from Internet via GATEWAY1:4000. But I also want to run this
> services via GATEWAY2:4000. I tried redirection from GATEWAY2 to
> GATEWAY1 via public IPs but it doesn't work.

if I understand your question correctly, you should be able to take
requests sent to GATEWAY2:4000 and redirect them to your SERVER, just
as you redirected from GATEWAY1 to SERVER.  You can do this even
though GATEWAY2 is not SERVER's default gateway.  You might need to
allow incoming requests on SERVER from the interface going to
GATEWAY2.

