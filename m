From: Eric Leblond <eric@regit.org>
Subject: Re: Ulogd2 messages stopped [Cent OS 6.8]
Date: Tue, 14 Mar 2017 09:02:01 +0100
Message-ID: <1489478521.15907.4.camel@regit.org>
References: <CAAzdDtPv0SC=8i3Zn5k4qCNZB7pLBC_4Yf7THAmBU5UAhvnoPA@mail.gmail.com>
         <CAAzdDtOzRi2digE+3uUbeOj50sOWpAGjxxznP69jDN=2NJu5pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAzdDtOzRi2digE+3uUbeOj50sOWpAGjxxznP69jDN=2NJu5pQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Muhammad Faisal <faisalusuf@gmail.com>, netfilter@vger.kernel.org

Hi,

On Tue, 2017-03-14 at 10:05 +0500, Muhammad Faisal wrote:
> Hello,
> Anyone experienced this behavior with ulogd2?
>=20
> We have setup nat server with src-nat event logging using ulogd2.
> After running for couple of day all of sudden the ulogd2 messages
> stopped. There was nothing related to connection events.
>=20
> When i run conntrack -L command and then conntrack -E command the
> logs
> starts appearing.
>=20
> Please help me out i did not find any clue why this is happening.

This looks rather strange. Could you have a task running in background
and removing conntrack related kernel module ?

BR,

>=20
> Thanks
> Best Regards,
> Muhammad Faisal
>=20
> Disclaimer:
> Information in this e-mail and attachments is confidential and may be
> legally privileged. Only intended recipients are authorized to use
> it.
> If you have received this message in error, please delete it and all
> copies of the message from your system and notify the sender
> immediately by return e-mail. I'm neither liable for incomplete
> transmission of the information in this communication nor for damage
> caused by any virus transmitted through this e-mail.
>=20
>=20
>=20
> On Mon, Mar 13, 2017 at 8:38 PM, Muhammad Faisal <faisalusuf@gmail.co
> m> wrote:
> > Hello,
> > We have setup nat server with src-nat event logging using ulogd2.
> > After running for couple of day all of sudden the ulogd2 messages
> > stopped. There was nothing related to connection events.
> >=20
> > When i run conntrack -L command and then conntrack -E command the
> > logs
> > starts appearing.
> >=20
> > Please help me out i did not find any clue why this is happening.
> >=20
> > Cent OS 6
> > Conntrack v1.4
> >=20
> > [root@wc01 ~]# ulogd -V
> > ulogd Version 2.0.5
> >=20
> > Installed Packages
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.1.6
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 141 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: installed
> > From repo=A0=A0=A0: epel
> >=20
> > Available Packages
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.1.6
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 59 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.1.6
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 181 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.1.6
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 181 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet10
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.2a
> > Release=A0=A0=A0=A0=A0: 18.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 39 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet10
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.2a
> > Release=A0=A0=A0=A0=A0: 18.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 37 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet10-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.2a
> > Release=A0=A0=A0=A0=A0: 18.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 21 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnet10-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.2a
> > Release=A0=A0=A0=A0=A0: 18.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 21 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_acct
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.2
> > Release=A0=A0=A0=A0=A0: 1.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 18 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_acct
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.2
> > Release=A0=A0=A0=A0=A0: 1.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 18 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_acct-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.2
> > Release=A0=A0=A0=A0=A0: 1.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 22 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_acct-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.2
> > Release=A0=A0=A0=A0=A0: 1.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 22 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_conntrack
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 0.0.100
> > Release=A0=A0=A0=A0=A0: 2.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 39 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_conntrack
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 0.0.100
> > Release=A0=A0=A0=A0=A0: 2.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 38 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_conntrack-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 0.0.100
> > Release=A0=A0=A0=A0=A0: 2.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 14 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_conntrack-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 0.0.100
> > Release=A0=A0=A0=A0=A0: 2.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 14 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_cthelper
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.0
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 17 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_cthelper
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.0
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 16 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_cthelper-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.0
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 14 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_cthelper-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.0
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 14 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_log
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 21 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_log
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 21 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_log-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 8.9 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_log-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 7.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 8.9 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: epel
> >=20
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_queue
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 18 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_queue
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 18 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_queue-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: i686
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 8.4 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> >=20
> > Name=A0=A0=A0=A0=A0=A0=A0=A0: libnetfilter_queue-devel
> > Arch=A0=A0=A0=A0=A0=A0=A0=A0: x86_64
> > Version=A0=A0=A0=A0=A0: 1.0.1
> > Release=A0=A0=A0=A0=A0: 3.el6
> > Size=A0=A0=A0=A0=A0=A0=A0=A0: 8.4 k
> > Repo=A0=A0=A0=A0=A0=A0=A0=A0: base
> > Best Regards,
> > Muhammad Faisal
> >=20
> > Disclaimer:
> > Information in this e-mail and attachments is confidential and may
> > be
> > legally privileged. Only intended recipients are authorized to use
> > it.
> > If you have received this message in error, please delete it and
> > all
> > copies of the message from your system and notify the sender
> > immediately by return e-mail. I'm neither liable for incomplete
> > transmission of the information in this communication nor for
> > damage
> > caused by any virus transmitted through this e-mail.
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0=A0http://vger.kernel.org/majordomo-info.html
--=20
Eric Leblond <eric@regit.org>
