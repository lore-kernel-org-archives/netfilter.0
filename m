From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 19:30:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302191930.05271.netfilter@newkirk.us>
References: <HMEBKOCKLOOEJGIOMFAPAEJNFJAA.ian@icreditvision.com> <200302191912.06748.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302191912.06748.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ian Douglas <ian@icreditvision.com>, netfilter@lists.netfilter.org

On Wednesday 19 February 2003 07:12 pm, Joel Newkirk wrote:

> AFAIK, you can only DNAT to a contiguous range of IPs from a single
> rule, and the rule construction you have here will ignore 'excess'
> destinations. =20

Well, I was wrong again.  :^)  Digging a bit further after posting this I=
=20
find that multiple "-to" entries ARE valid, and should do what you want. =
=20
The only reason I can think of (now) that all your traffic went to the=20
first on the list is that there simply wasn't any load to speak of.  How=20
were you testing?  Multiple simultaneous connections?  Otherwise (from=20
my latest reading :^) it will simply keep sending traffic to the first=20
on the list, only using the next one if there is more traffic=20
'currently' (presumably based on the connection-tracking data) on the=20
first destination than on the second.

> j

j


