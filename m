From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: Rule "labels"?
Date: Thu, 14 Apr 2005 16:03:11 -0700
Message-ID: <BAY106-F108732D77FE7E6B62F713BD6350@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: gtaylor@riverviewtech.net
Cc: netfilter@lists.netfilter.org

Grant,

>I think it would be FAR more practical to do an "iptables -t filter -L -n =

>-v --line-numbers", "iptables -t nat -L -n -v --line-numbers", "iptables -=
t=20
>mangle -L -n -v --line-numbers" and parse the output looking for all lines=
=20
>that match POLICY001.  I think this would be an excellent shell or Perl=20
>script.

Thanks for the suggestion.  I think it is a very good one.

I had not heard of the "-m comment" option before and its not in my revisio=
n=20
of Oskar Andreasson's Iptables Tutorial (guess I need to refresh my docs).

I am additionally hampered (protected?) by a dictum that scripting is not=20
allowed in my little world, so, in the end, I would have to do what you=20
describe programmatically (i.e. in a C or C++ program). However, I'm=20
certainly not averse to prototyping the functionality in a shell or Perl=20
script.  I do that sometimes anyway when I want a quick tunraround as I=20
iterate through changes to the logic.

I'll try playing around with that.  When I have something I'll send it to=20
you, or is there some sort of common repository where netfilter/iptables=20
denizens share stuff like this?

Thanks for your help and advice,

- Andrew

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/


