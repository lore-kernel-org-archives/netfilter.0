From: Eric <evil.function@proton.me>
Subject: Re: nft -f fails with netlink: Error: Could not process rule: Message too long
Date: Fri, 20 Jan 2023 22:45:28 +0000
Message-ID: <31krx4HMbZU27l3y7-oNN8w6-rt6A7x9_4wQRp9XLtvdovhihgmiXQDf2l9kFHosN0_DfS9Xzotv-jlzo7hw8vE743aEWUjFXuWIUq0hLZk=@proton.me>
References: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com> <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me> <CADhidkr=O14uJzvxEa_O=4ubNTY2FkijH5N5XeeE_UGxXMt1Tw@mail.gmail.com> <0XPN5x_Lvw9aH38vS71DvG7iNI9ym8JClcemPZUAsbJX0Hp57eO841r_EqStnX923hNbDFGYyqMA86pAjVzxiultSkx31u2yjFgG1Ve5oUo=@proton.me> <CADhidkpbk8ZzUKe7yEisVasYxOuL9Ai7CuH_3e_xK9fMds3Ang@mail.gmail.com> <PLidOwUSlqbsZPzhlDT-ScXzv6lqbzfVQXOa3iqktKxMEv4-YzIxZnXqx3_YaVC3K1a2rppoZ079AKXDuGdc579v_BBX_E80okW5bUDqjHI=@proton.me> <CADhidkqu7Np4F2-6NQ34eZ12RNycAA326zCZPhWj=JNuLfauaA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1674254741; x=1674513941;
        bh=v942rFJ9HKuuRF01M5VvE5YikOZXdpVgdyrEuvAWPvo=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=J0CguxLbdZvzvrUvAZgzKzQK84UVk3iw50UE4xYMuCIOAw51YnXrmHOTYmi08hARF
         2LOnYbKQZVRz8B2K7TFgpHybWRhgm28H7IvkPOtn4tppbpS8H/QEnorXJwri+NCN3+
         5VgpJHhLCPlAt7vsouwdm43Pl+rbnzUiy7PiuArQQ2BNJd98vcVLQbvrViAbHOmsim
         1WdcCzdFD7/spUvYhf1qBF/q81c+liLOy9eM0wKJI5FWBR7nsPTIDs2lAHOFqVfrzX
         PqNQpGPwBCsYfUdkEhHQwbEUHsR3BQy7zcUztdziTDeqne6JqzPoqT7ZVn+s7vejcv
         kotMAHcBriRRA==
In-Reply-To: <CADhidkqu7Np4F2-6NQ34eZ12RNycAA326zCZPhWj=JNuLfauaA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Gio,

I tested it again on my Fedora 37 box (tried a bit on Alma 8.7, but got bog=
ged down with permission issues).  First I verified that my previous experi=
ment still worked, and it was successful.  I then did the 'unshare -n -r', =
got to root without the network namespace, created the table, chain and rul=
e, again all without issue.  Listing everything (nft list ruleset) showed w=
hat I expected, and nft didn't complain at all with 512 IPv6 addresses...

Eric

------- Original Message -------
On Friday, January 20th, 2023 at 00:33, Gio <gioflux@gmail.com> wrote:


> Thanks for helping debug and trying something on your end. This made
> me consider additional testing. Looks like this odd behavior does
> occur in:
> 1. LXC container (Debian 11 - my original "test" environment)
> 2. QEMU Ubuntu VM when using "unshare -n -r" to create a linux network
> namespace then trying to load the rules there.
>=20
> If I use the QEMU Ubuntu host and load the ruleset there are no errors
> and `nft list ruleset` works as expected. I'm not super familiar with
> what kind of limitations under the hood may be triggering a type of
> limit, but it does seem to be occurring in linux network namespaces as
> well as my LXC container in a proxmox host.
>=20
> Would you mind trying your test again; this time perhaps do so inside
> a linux network namespace? 'unshare -n -r' should get you into it then
> 'nft -f yourfile.nft' - curious if you will see the same error I saw
> on the ubuntu VM.
>=20
> On Sun, Jan 15, 2023 at 12:47 PM Eric evil.function@proton.me wrote:
>=20
> > Here's what I've done. Wrote a python script to generate a sh script:
> >=20
> > #!/bin/sh
> > CHAIN=3D'inet fw4 input'
> > nft -a -e add rule $CHAIN 'ip6 saddr { \
> > 2000:0:0:0::/64, 2000:1:1:1::/64, 2000:2:2:2::/64, 2000:3:3:3::/64, 200=
0:4:4:4::/64, 2000:5:5:5::/64, 2000:6:6:6::/64, 2000:7:7:7::/64, \
> > 2000:8:8:8::/64, 2000:9:9:9::/64, 2000:a:a:a::/64, 2000:b:b:b::/64, 200=
0:c:c:c::/64, 2000:d:d:d::/64, 2000:e:e:e::/64, 2000:f:f:f::/64, \
> > ... for 512 addresses, 8 per script line ... \
> > 2000:1f8:1f8:1f8::/64, 2000:1f9:1f9:1f9::/64, 2000:1fa:1fa:1fa::/64, 20=
00:1fb:1fb:1fb::/64, 2000:1fc:1fc:1fc::/64, 2000:1fd:1fd:1fd::/64, 2000:1fe=
:1fe:1fe::/64, 2000:1ff:1ff:1ff::/64, \
> > } ct state new accept comment "TOO MANY"'
> > echo "nft delete rule $CHAIN handle n"
> >=20
> > Run that on OpenWrt 22.03 Linux kernel 5.10.146, nftables v1.0.2 (Leste=
r Gooch), libnftnl11 - 1.2.1-2. Works just fine for me, no errors apparent =
and 'nft list ruleset' shows everything I'd expect.
> >=20
> > Went to my Fedora 37 box, kernel 6.1.5, nftables v1.0.4 (Lester Gooch #=
3), libnftnl.x86_64 1.2.2-2.fc37@fedora. Same story, everything works fine =
there. (Chain used was 'inet firewalld filter_INPUT'.)
> >=20
> > It becomes a bigger mystery, maybe old libraries for netfilter somewher=
e?
> >=20
> > ------- Original Message -------
> > On Saturday, January 14th, 2023 at 23:09, Gio gioflux@gmail.com wrote:
> >=20
> > > 309 IPv6 elements inside the anonymous set. The rule looked like:
> > >=20
> > > ip6 saddr { ---list of 309 /64 IPv6 ranges separated by commas } ct
> > > state new accept
> > >=20
> > > Rule was formatted inside a chain; then referenced in the base chain
> > > using "jump". Only after I replaced all 309 IPv6 items with a single
> > > IPv6 term for testing did the rule load without an error using "nft -=
f
> > > rule.nft" command.
> > >=20
> > > I could share the rule.nft file privately over email if someone would
> > > like to try to reproduce the error on their end.
> > >=20
> > > On Sat, Jan 14, 2023 at 11:37 AM Eric evil.function@proton.me wrote:
> > >=20
> > > > Gio,
> > > >=20
> > > > Just out of curiosity, how many elements did you have? I just dug t=
hrough the code, I think this is the right spot: https://git.netfilter.org/=
nftables/tree/src/evaluate.c#n2356 and it looks like only a lower bound (no=
 empty sets) is enforced on anonymous sets.
> > > >=20
> > > > I then created a rule with ~540 IPv4 elements and another with 375 =
IPv6 elements (strange numbers because I already had a script with a bunch =
of IPs in it), and it created the rules just fine.
> > > >=20
> > > > Eric
> > > >=20
> > > > ------- Original Message -------
> > > > On Friday, January 13th, 2023 at 21:05, Gio gioflux@gmail.com wrote=
:
> > > >=20
> > > > > thank you! this got me going into the right direction.
> > > > >=20
> > > > > It appears that I had too many IPv6 addresses inside an anonymous=
 Set
> > > > > - I wasn't aware there was a limit of how many elements could be
> > > > > within a set (inside curly brackets)?
> > > > >=20
> > > > > There is no mention of a limit of how many in
> > > > > https://wiki.nftables.org/wiki-nftables/index.php/Sets - unless I
> > > > > missed something.
> > > > >=20
> > > > > On Fri, Jan 13, 2023 at 11:14 AM Eric evil.function@proton.me wro=
te:
> > > > >=20
> > > > > > Off the top of my head, --echo and --debug all will increase th=
e quantity of output (the latter quite a lot).
> > > > > >=20
> > > > > > Eric
> > > > > >=20
> > > > > > ------- Original Message -------
> > > > > > On Thursday, January 12th, 2023 at 23:05, Gio gioflux@gmail.com=
 wrote:
> > > > > >=20
> > > > > > > Hi,
> > > > > > > I have a relatively small config.nft file with ~220 lines tha=
t I am
> > > > > > > trying to load onto my system. When I do this I get the below=
 error
> > > > > > > message.
> > > > > > >=20
> > > > > > > The ruleset is very small, so I don't expect this to be a buf=
fer
> > > > > > > issue. Are there any recommended troubleshooting steps or per=
haps a
> > > > > > > way to load the file in a more verbose way to see in which li=
ne of the
> > > > > > > config.nft file this error is triggered?
> > > > > > >=20
> > > > > > > Thanks.
> > > > > > >=20
> > > > > > > root@nf:~/nftables-geoip# nft -f noverbose.nft
> > > > > > > netlink: Error: Could not process rule: Message too long
> > > > > > > root@nf:~/nftables-geoip# wc -l noverbose.nft
> > > > > > > 221 noverbose.nft
