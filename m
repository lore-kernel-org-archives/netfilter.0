From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dinamic (www list) IP BAN ...
Date: Thu, 22 Apr 2004 18:07:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221807.50204.Antony@Soft-Solutions.co.uk>
References: <1331752368.20040422174719@lpgc.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1331752368.20040422174719@lpgc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 22 April 2004 5:47 pm, Roque wrote:

> Hi all, i wonder if someone could help me with a little problem ...
> I need to ban a number of IP=B4s that are posted in a plain text file o=
n
> a web site; the file changes every 30Min. The file is as simple as
>
> banned-ip1    #Reason1
> banned-ip2    #Reason
> ...
> The url can be reached in this way: http://www.url.com/ip/banned.txt
>
> I have read the iptables man pages and haven=B4t seen nothing similar.
> Is it really posible to do so?

I would suggest you set up a cron job which runs a shell script to fetch =
the=20
list (using wget or lynx etc), then add the current IPs to a user-defined=
=20
chain, then switch a rule in INPUT or FORWARD (you don't say which it is =
you=20
want to ban, possibly both) to that chain from the previous one which was=
 in=20
place, then flush the old list ready for populating the next time around.

ie: you have two user-defined chains, one of which is in use, and the oth=
er of=20
which you are populating with the banned IPs, then you switch between the=
m.

Don't try adn use just one list, or else you will either (a) have trouble=
=20
removing the old entries, or (b) have some period of time when there are =
no=20
IPs in the banned list (which presumably is undesirable).

Regards,

Antony.

--=20
Success is a lousy teacher.  It seduces smart people into thinking they c=
an't=20
lose.

 - William H Gates III

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


