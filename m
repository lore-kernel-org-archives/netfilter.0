From: Reindl Harald <h.reindl-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org>
Subject: Re: nf_ct_ftp: dropping packet: partial matching of `227 '
Date: Sun, 17 Apr 2016 10:38:37 +0200
Message-ID: <57134B8D.2020005@thelounge.net>
References: <570F7EB5.4090100@thelounge.net> <570FDC3E.5050109@gmail.com>
 <570FDDF8.7010506@thelounge.net> <5710115C.4020200@gmail.com>
 <5710A364.1050207@thelounge.net> <571243A8.8040204@thelounge.net>
 <5712F05D.1060609@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7071245887590851006=="
Return-path: <kernel-bounces-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
In-Reply-To: <5712F05D.1060609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Archive: <http://lists.fedoraproject.org/archives/list/kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org/>
List-Help: <mailto:kernel-request-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org?subject=help>
List-Post: <mailto:kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Subscribe: <http://lists.fedoraproject.org/admin/lists/kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>,
	<mailto:kernel-join-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Unsubscribe: <http://lists.fedoraproject.org/admin/lists/kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>,
	<mailto:kernel-leave-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
To: Marcelo Ricardo Leitner <marcelo.leitner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org
Cc: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7071245887590851006==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="w83UK984SsN3Ev308VwHlCWCqaxIH84Nr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w83UK984SsN3Ev308VwHlCWCqaxIH84Nr
Content-Type: multipart/mixed; boundary="JInK7bQmSorTJSi1ffDSJF6Pd9utGfFuu"
From: Reindl Harald <h.reindl-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org>
To: Marcelo Ricardo Leitner <marcelo.leitner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org
Cc: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <57134B8D.2020005-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org>
Subject: Re: nf_ct_ftp: dropping packet: partial matching of `227 '
References: <570F7EB5.4090100-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org> <570FDC3E.5050109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <570FDDF8.7010506-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org> <5710115C.4020200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <5710A364.1050207-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org> <571243A8.8040204-nmX1w7yctrMqcZcGjlUOXw@public.gmane.org>
 <5712F05D.1060609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <5712F05D.1060609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--JInK7bQmSorTJSi1ffDSJF6Pd9utGfFuu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Am 17.04.2016 um 04:09 schrieb Marcelo Ricardo Leitner:
> Cc'ing netfilter@ too
> Thread:
> https://lists.fedoraproject.org/archives/list/kernel-TuqUDEhatI4ANWPb/1PvSj/laDblWjpS@public.gmane.org=
t.org/thread/CLNQ6O6OGNEJAFFSNV56KU6P2JAPM5YU/
>
>
> Em 16-04-2016 10:52, Reindl Harald escreveu:
>>
>> Am 15.04.2016 um 10:16 schrieb Reindl Harald:
>>> Am 14.04.2016 um 23:53 schrieb Marcelo Ricardo Leitner:
>>>>>> Otherwise it won't be able to expect the new connection
>>>>>
>>>>> sounds reasonable, on the other side the client yesterday had troub=
les
>>>>> to make passive ftp connections with "connection refused" as far as=

>>>>> the
>>>>> admin was able to tell on the phone
>>>>>
>>>> It could be that the drop happened and an auxiliary connection was
>>>> attempted before the retransmission of the 227 reply, so your firewa=
ll
>>>> didn't know about it and actively blocked the connection. If it had
>>>> silently dropped the new connection request, the client probably wou=
ld
>>>> retransmit the SYN after a bit.
>>>>
>>>> Now why the cameras are triggering it, good question
>>>
>>> not the cameras - a ordinary client with filezilla, that one with 227=
 in
>>> his IP address, the cameras blow their images without any problem on =
the
>>> FTP server
>>
>> maybe i made it not clear enough:
>>
>> there is no "my firewall" between that is just iptables directly on th=
e
>> machine running pure-ftpd and so it's killing outgoing localhost traff=
ic
>> - that is very weird
>
> Okay but expected :) because even if conntrack is running on the system=

> itself that is running the service, it ignores that fact and still acts=

> like just a man-in-the-middle.

but partial packets on the local system? :-)

> So you can still reproduce it?

not in a way that would make it easy to debug, some days are log floods=20
and that for years now and most time there is nothing - until last week=20
i thought that would be something to attackers related but then i had a=20
customer with borken PASV ftp and his IP address 100 times in the log=20
with that message

> If so, I don't see another way to debug
> this but to unload nf_conntrack_ftp and take a traffic capture without
> limiting the packet size (don't use -s option), because I'm afraid that=

> otherwise conntrack will drop the packet and we won't even see it in th=
e
> capture.
> Look for a packet containing a "227 " in the beginning of TCP payload.
> That should be our guy.
> Feel free to send it only to my email if you prefer.

hmm - if i could reproduce it in a way "i want it now" and somewhere=20
else than a production server

> Unfortunately the pr_debug()s available on that area aren't much helpfu=
l
> for this problem.
>
> And which kernel is this?

i have always the latest Fedora kernel running
4.4.7-300.fc23.x86_64


--JInK7bQmSorTJSi1ffDSJF6Pd9utGfFuu--

--w83UK984SsN3Ev308VwHlCWCqaxIH84Nr--

--===============7071245887590851006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18Ka2VybmVsIG1h
aWxpbmcgbGlzdAprZXJuZWxAbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcKaHR0cDovL2xpc3RzLmZl
ZG9yYXByb2plY3Qub3JnL2FkbWluL2xpc3RzL2tlcm5lbEBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9y
Zwo=

--===============7071245887590851006==--
