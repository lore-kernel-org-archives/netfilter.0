From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: MSN Messenger and HTTPS
Date: Wed, 3 Sep 2003 10:47:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309031033400.1440@simba.math.ucla.edu>
References: <001b01c36dff$401175c0$3b00a8c0@sturlaws>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c36dff$401175c0$3b00a8c0@sturlaws>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Sturla_Hall=E5s_-_Zonar_ANS?= <sturla@zonar.no>
Cc: netfilter@lists.netfilter.org

On Fri, 29 Aug 2003, Sturla Hall=E5s - Zonar ANS wrote:
> I've set up my iptables firewall and of course, it's working perfectly.
> But...Clients on the LAN cannot log on to MSN Messenger, and they can't
> browse https-webpages like to do their banking.

Perhaps you didn't allow port 443 through the firewall for HTTPS.  Openin=
g
up outgoing 443 should expose you to few threats.  Likely MSN Messenger
also needs a port opened.  Much of its functionality works through a sing=
le
TCP connection to the server, originated by the client, so opening that
port in the outward direction should (?) be safe.

> The thing is, the user can log on to their MSN-accounts through clients
> like Trillian, but not through MSN Messenger.

I'm talking through my hat here, but if a HTTP post sequence on port 80
were used to log the user in, that would work, whereas I'm sure that the
real Microsoft Passport protocol uses a different (and secure) port.  You
would have to discover what it was, and allow it through your firewall.  =
A
combination of web research and packet snooping with Snort or Ethereal
would give a quick conclusion.

If they're using H.323 for the audio-visual, like they do in NetMeeting,
that's a real can of worms, but I've seen people mention a H.323 netfilte=
r
module that can make this work. Of course, the more complicated the
protocol is, the more likely that holes will be found and exploited soone=
r
or later.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-15=
55
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP=
 key)

