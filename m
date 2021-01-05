From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables Set Bug with interval & timeout Flags
Date: Mon, 4 Jan 2021 19:03:55 -0800
Message-ID: <009362af-4e3f-af66-f6be-717dc93557fd@softtalker.com>
References: <5c90f2e3-76ac-1b00-1ca8-fab74bfd97cd@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5c90f2e3-76ac-1b00-1ca8-fab74bfd97cd@softtalker.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Happy new year team!=A0 I just wanted to ping status on this.=A0 Thank you!

-MikeD

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------------------------------------------------
 --------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------
*From:* Mike Dillinger [mailto:miked@softtalker.com]
*To:* netfilter@vger.kernel.org
*Date:* Thursday, December 10, 2020, 9:35 AM PST
*Subject:* nftables Set Bug with interval & timeout Flags

Greetings netfilter team,

I believe I have stumbled on a bug with nftables named sets.=A0 I'm seeing =
timeout values are lost for named set elements upon reboot or service resta=
rt, and it reverts to the default timeout setting for the set.=A0 I only ob=
serve this behavior when the interval flag is present.=A0 I have been able =
to reproduce reliably and I have included reproduction steps.

It is also worth noting that this is only an issue if the interval flag is =
present.=A0 For named sets without the interval flag, timeouts are preserve=
d across reboots and service restarts as expected. However, I'm interested =
in using the interval flag to specify CIDR's and IP ranges.

Step 1: Create a set with interval and timeout flags, some other options as=
 well
$ nft add set ip filter test2 {type ipv4_addr \; flags timeout,interval \; =
timeout 10m \; gc-interval 1m\; counter\;}
$ nft list set ip filter test2
table ip filter {
 =A0=A0=A0=A0=A0=A0=A0 set test2 {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 counter
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 10m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0 }
}

Step 2: Add a couple of elements to set; One will be a single IP and one wi=
ll be a CIDR/range
$ nft add element ip filter test2 { 1.1.1.1 }
$ nft add element ip filter test2 { 8.8.8.0/24 }
$ nft list set ip filter test2
table ip filter {
 =A0=A0=A0=A0=A0=A0=A0 set test2 {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 counter
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 10m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elements =3D { 1.1.1.1 expir=
es 9m45s348ms counter packets 0 bytes 0, 8.8.8.0/24 expires 9m55s816ms coun=
ter packets 0 bytes 0 }
 =A0=A0=A0=A0=A0=A0=A0 }
}

Step 3: Lets pause to allow the timers to decrement somewhat and then backu=
p the nftables config so we can restore it
$ rm -f /etc/nftables.conf && nft list ruleset > /etc/nftables.conf
$ grep --after-context 7 test2 /etc/nftables.conf
 =A0=A0=A0=A0=A0=A0=A0 set test2 {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 counter
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 10m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elements =3D { 1.1.1.1 expir=
es 6m4s752ms counter packets 0 bytes 0, 8.8.8.0/24 expires 6m15s220ms count=
er packets 0 bytes 0 }
 =A0=A0=A0=A0=A0=A0=A0 }

Step 4: Now restart nftables and observe the failure condition
$ systemctl restart nftables.service
$ nft list set ip filter test2
table ip filter {
 =A0=A0=A0=A0=A0=A0=A0 set test2 {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 counter
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 10m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elements =3D { 1.1.1.1 expir=
es 9m48s864ms counter packets 0 bytes 0, 8.8.8.0/24 expires 9m48s864ms coun=
ter packets 0 bytes 0 }
 =A0=A0=A0=A0=A0=A0=A0 }
}

Note the timers reset when the service restarted even though they were save=
d to /etc/nftables.conf.=A0 And again, this behavior is only present when t=
he interval flag is set.=A0 I have other sets of type ipv4_addr not using t=
he interval flag and those timers are preserved on reset/reboot.

Hopefully I'm doing something wrong, but if not, please let me know your th=
oughts.=A0 Here is some information regarding my setup (Debian testing):
$ uname -a
Linux rockenfield 5.9.0-4-amd64 #1 SMP Debian 5.9.11-1 (2020-11-27) x86_64 =
GNU/Linux
$ nft -V
nftables v0.9.7 (Anyface)
 =A0 cli:=A0=A0=A0=A0=A0=A0=A0=A0=A0 readline
 =A0 json:=A0=A0=A0=A0=A0=A0=A0=A0 yes
 =A0 minigmp:=A0=A0=A0=A0=A0 no
 =A0 libxtables:=A0=A0 yes

Thanks!
-MikeD


