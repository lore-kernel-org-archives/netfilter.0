From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Question about fiewall script....
Date: Tue, 31 Dec 2002 22:26:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212312226.46802.netfilter@newkirk.us>
References: <001601c2b13c$41954190$6501a8c0@athlon>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c2b13c$41954190$6501a8c0@athlon>
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
To: "Kevin L. Collins" <kcollins@qx.net>, netfilter@lists.netfilter.org

On Tuesday 31 December 2002 09:19 pm, Kevin L. Collins wrote:
> I'm in the midst of building VICTORY, my Linux Router/Firewall.
>
> I'm reading the book "Linux Firewalls, Second Edition" by Robert L.
> Ziegler, and using a great deal of the 4th chapter to help me protect
> my LAN from the 'baddies'.

Set a bookmark to http://iptables-tutorial.frozentux.net .  Keep the=20
ChunkyHTML version alway open in a minimized browser window.  Print out=20
the PS version.  Carry it with you everywhere until you see firewall=20
scripts in your sleep.  (Just a suggestion... :^)

> But I have a question that I can't seem to find an answer
> for...(beware this may show extreme newbie stupidity, you've been
> warned.)
>
> On several occasions, Mr. Ziegler invokes lines simaliar to the
> following for IPTABLES rules and I'm not so sure I can follow them.

> My big concern is: No where in the book (that I have yet found) does
> he mention that you should or need to set the constant
> "CONNECTION_TRACKING"
> in the script you're creating.  So, this leads me to believe that the
> Connection Tracking module does it as it loads.  It also leads me to
> think
> that the module controls the state of the constant as it works.
>
> Does someone know if this is the case?  Or maybe be able to point me
> to somewhere that I can find out.

Not the case, unless you explicitly set it.  Try "echo=20
$CONNECTION_TRACKING" and you should see that it is null.

j


