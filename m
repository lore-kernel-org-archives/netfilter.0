From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: RE: Logging question
Date: Wed, 9 Feb 2005 11:11:16 -0500 (EST)
Message-ID: <7643.142.169.215.10.1107965476.squirrel@142.169.215.10>
References: <3144.142.169.215.10.1107963344.squirrel@142.169.215.10>
	<!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA7ow78K+3jEWLSOFdgBEHbAEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4ww
	L6DwAQAAAA7ow78K+3jEWLSOFdgBEHbAEAAAAA@rogers.com>
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
To: dave beach <drbeach@rogers.com>
Cc: netfilter@lists.netfilter.org

On Wed, February 9, 2005 10:35 am, dave beach said:
> Thanks, Samuel.
>
> So, if I understand correctly, the reason that nothing at all is being
> logged out eth0 (via the rule in the nat/POSTROUTING chain) is because =
all
> those packets are related to packets previously seen by the state machi=
ne
> and thus don't traverse that chain.

Unless you tell my that you put the logging rule _after_ the DNAT rule.
I assume the above is right, but a bit unbeleivable. If that's really
what happen (entries already exist), you can verify if my
assumption/explanation is right by unloading the ip_conntrack module
(and everything depending on). And test again with fresh conntrack.

>
> Okay, but that leaves me with the question about why I'd see so many
> packets
> logged out eth1 via a similar rule in the same place. The above
> explanation
> seems to tell me that each and every packet so logged would be the
> "first",
> and thus new.

Perhaps you've put your eth1 logging after eth1 DNAT and you see log for
the eth0 NAT. Is that possible case ?

>
> I guess the way to test this would be to move BOTH rules to
> mangle/POSTROUTING. I'd expect, based on the above, to see the packets
> logged out eth1 to jump dramatically. Does this sound generally correct=
?

Both logging rules at top of this chain should tell you the truth.

Cheers,
Samuel



