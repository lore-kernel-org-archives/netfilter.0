From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Multiple firewalls
Date: Wed, 11 Sep 2002 15:43:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111543.45177.roy@karlsbakk.net>
References: <1031749586.345.26.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031749586.345.26.camel@bigblue>
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
To: darkstar <security@darkstar.nom.za>, netfilter <netfilter@lists.netfilter.org>

On Wednesday 11 September 2002 15:06, darkstar wrote:
> I have two seperate iptables firewalls for two lines for our
> company.Both machines have two network cards.
> Would it be advisable to combine the two into one machine with three
> cards..???

I beleive I'd do that to simplify routing & al.

one nic for WAN 1
one for WAN 2
one for company LAN
and one for the DMZ

:-)

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


