From: Curtis Call <curtiscall@usa.net>
Subject: Re: [Re: [FTP large file problem]]
Date: Fri, 18 Jul 2003 08:34:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <993HgRoIe8480S06.1058538844@cmsweb06.cms.usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Curtis Call <curtiscall@usa.net>
Cc: Marcel de Boer <marceldb@luon.net>, netfilter@lists.netfilter.org

See:

http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.ht=
ml#ss7.3

Scroll down to 'Specifying fragments'.  Looks like whether it is reassemb=
led
prior to the filter depends on a few different factors...

Anyway, I was having problems with a local firewall filter stalling my la=
rge
IMAP downloads.  Permitting fragments did the trick...


Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> On Fri, Jul 18, 2003 at 07:47:29AM -0600, Curtis Call wrote:
> =

> > Are you explicitly allowing fragments through?  When a packet is
fragmented
> > only the first fragment contains the TCP/UDP header.  So if you're on=
ly
> > permitting based on that header the fragments won't make it.
> =

> Are you sure about this? Doesn't defrag occure on the fw by default?
Specially
> when you do nat it cannot work without this logic? And I don't recall a=
ny
> mention of "let fragments through" in the howto's or alike.
> =

> Ramin
> =





