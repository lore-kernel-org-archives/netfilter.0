From: Robert White <rwhite@pobox.com>
Subject: Re: using PREROUTING to change destination
Date: Tue, 14 Mar 2017 11:29:50 +0000
Message-ID: <fd694cd0-4186-6d72-af78-3f23c06aedfd@pobox.com>
References: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
 <30f19523390f4222a80fd8fb4150eb1f@CCDEX021.corp.corpcommon.com>
 <CAJ2oMhLpOJ2qAebiV6SMkA+bxJYDuEaJ5OpQvo20+U+N93=rMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ2oMhLpOJ2qAebiV6SMkA+bxJYDuEaJ5OpQvo20+U+N93=rMw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Ran Shalit <ranshalit@gmail.com>, =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 03/14/17 09:56, Ran Shalit wrote:
> I understand from your reply that REDIRECT rule for the destination
> port will change the destination port, so that the real
> destination(=3D"final destination") is in the packet header  (and there
> is no memory for the original destination any where else).

REDIRECT is totally different from DNAT. Destination Network Address=20
Translation sends the packet off to a different machine (well IP=20
address, which could be another address on the current machine but=20
that's _super_ _rare_) so one might DNAT some packets arriving on your=20
firewall through to your Web Server, and others over to your XBox witch=20
is clearly never the same machine as your firewall.

REDIRECT says "this service is here on the firewall, but at a different=20
port than this packet thinks it would be.

Here's a REDIRECT example.

I want to run a web server. I decide to run it on the firewall. I don't=20
want the WebServer processes to be run as root because if someone breaks=20
into the WebServer I don't want them to have any special root=20
privileges. A process needs to be a root process to take over port=20
eighty because its less than port 1024.

So now what?

Well I create the web server user with no dangerous privilege and tell=20
it to use an unprivileged port (typically 8080).

Then...

iptables --table nat --append PREROUTING --protocol tcp --dport 80=20
--jump REDIRECT --to-port 8080

So the web server user can now open and close 8080 as needed with Just=20
Plain User=E2=84=A2 rights, and I don't have to tell the entire world to us=
e=20
8080 instead of the default.

And again the connection tracking system is going to do all the=20
translations automagically for the connections after you DNAT, SNAT, or=20
REDIRECT the first packet. So if you do a "iptables --table nat --list=20
--verbose" the packet count is more-or-less the 'new connections' or=20
'new flows' count for the rule. The connection tracker keeps the=20
necessary records of what's been changed for what so that you don't have=20
to think about that part of this at all (in most settings).


Again, saying/spelling the whole long-form arguments out is very helpful=20
in picking all this skill set up more quickly.

--Rob
