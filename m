From: Eric Leblond <eric@regit.org>
Subject: Re: Howto get ulog-prefix with ulogd-1.24 + sqlite3 backend?
Date: Sun, 10 Apr 2011 12:29:11 +0200
Message-ID: <09d05a28-a963-4bb5-9d6c-94347923e909@email.android.com>
References: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Clemens Eisserer <linuxhippy@gmail.com>, netfilter@vger.kernel.org, Clemens Eisserer <linuxhippy@gmail.com>, netfilter@vger.kernel.org

Hi,


Clemens Eisserer <linuxhippy@gmail.com> a =C3=A9crit=C2=A0:

>Hi,
>
>We try to use ulog for traffic accounting in an university project.
>
>First we tried ulogd-2.0beta4 + pgsql backend, but even under moderate
>load the database couldn't keep pace with the amount of requests.

Interesting. Could you share some information?

Do you use flat or multitable SQL schemas?
What is the insert rate?=20

>I thought about using ulog2 with sqlite, however in TODO theres an
>entry about making ulogd2 compatible with squlite, so I guessed sqlite
>is not yet supported with ulogd2?
>
>Then we switched back to ulog-1.24 + squlite3, which works perfectly.
>It can handle 100mbit/s torrent traffic at about ~50% CPU load.
>However in sqlite's ulog table, the ulog-prefix is not stored. Is
>there any way to get it stored - to be able to track which rule caused
>the log enrty?
>
>Also, conntrack is supported in ulogd2. Is this also true for
>ulogd1.2? I couldn't find specific docs about that.

No. Support for conntrack has been added in Ulogd2.

BR,=20

--=20
Envoy=C3=A9 de mon t=C3=A9l=C3=A9phone Android avec K-9 Mail. Excusez l=
a bri=C3=A8vet=C3=A9.
