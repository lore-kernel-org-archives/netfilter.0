From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: Re: Control outbound access on a per-application level
Date: Wed, 2 Oct 2002 21:51:26 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <50780.64.86.49.17.1033584686.squirrel@www.icafe.co.tz>
References: <1033569217024171@spray.se>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033569217024171@spray.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: gurra16@spray.se
Cc: netfilter@lists.netfilter.org

An application in Windoze called Personal Firewall does this. IT somehow
does an checksum on the .exe file and then compares, but it is a user-lev=
el
firewall and not kernel level.

Gustav Svensson said:
> Is it possible to set "outbound" rules based on what binary application
> it is that wants to access the Internet?
> Just like what I'm used to when I run win32. In every firewall
> application there, I get a message when some program is trying to
> access the internet. Then I can decide whether to procede the action,
> or block it. On Linux I see nothing like this. I'm having a concern
> with the RealPlayer. I would like to block it to reach any other
> addresses but those to my favourite stations.
> Sure, I could set up a rule for the port that RealPlayer is supposed to
> use, but what guarantee do I have that it isn't capable of using some
> other port, like 80 for example? Assume it does use the port 80. Then
> it would be imposible to stop without a rule like mentioned here.
> Because I would want Galeon to have access to any address on port 80,
> so I have to leave it wide open. It would be better if I could allow
> this privilege to Galeon only, not to any program that uses port 80. Is
> this feasible, if so how?
>
> Gustav
> ______________________________________________________
> H=E4r b=F6rjar internet!
> Skaffa gratis e-mail och internet p=E5 Spray http://www.spray.se




Regards,

Cyberdude Murli
The Earth



