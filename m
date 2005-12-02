From: James Courtier-Dutton <james.dutton@gmail.com>
Subject: Re: Internal IPs leaking past masqerade gateway
Date: Fri, 2 Dec 2005 11:14:05 +0000
Message-ID: <ad2655cb0512020314p468e5109t@mail.gmail.com>
References: <d41fd4d10511281607p79cbefecu7283966cc4f69ecb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41fd4d10511281607p79cbefecu7283966cc4f69ecb@mail.gmail.com>
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
To: Mark Dobossy <mark.dobossy@gmail.com>
Cc: netfilter@lists.netfilter.org

On 29/11/05, Mark Dobossy <mark.dobossy@gmail.com> wrote:
> I am having some issues with my internal IP's being leaked through my
> gateway, to a few specific IP addresses.  I have tried both "rolling
> my own" iptables setup (very simple, only port 80 open, using either
> masquerade or SNAT), as well as the ipkungfu script, and see the issue
> across either way, and even on multiple machines/distros.
>
> The issue in question occurs when visiting
> http://forums.corvetteforum.com.  One of their "ad" suppliers has the
> ip address, 66.110.24.220.  Connections to this IP are leaving my
> external device with my internal IP.  This was verified both from logs
> from my network admin's router, as well as by using ethereal on the
> gateway machine, and analyzing eth1 (external device) for any packets
> leaving with a source of 192.168.2.0/24.  I only see connections to
> this particular IP with the internal address (every thing else leaves
> with the correct, external IP).
>
> For now, I have simply banned this IP, but I am afraid it may start
> occuring elsewhere, and the network admin has threatened to kick this
> box off the network if it happens again.  Is there a rule to disallow
> any outgoing network connection with an internal IP?  Why would
> masquerading be allowing this?  I am pretty confused.
>
> I am currently running Mandriva 2006, with the 2.6.12 kernel, and
> would be happy to supply any other info that may be necessary to solve
> this.
>
> -Mark
>
>
I suggest that you post the output from "iptables-save" here, and we
can check it out for you.

