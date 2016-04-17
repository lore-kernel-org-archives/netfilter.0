From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: nf_ct_ftp: dropping packet: partial matching of `227 '
Date: Sat, 16 Apr 2016 23:09:33 -0300
Message-ID: <5712F05D.1060609@gmail.com>
References: <570F7EB5.4090100@thelounge.net> <570FDC3E.5050109@gmail.com>
 <570FDDF8.7010506@thelounge.net> <5710115C.4020200@gmail.com>
 <5710A364.1050207@thelounge.net> <571243A8.8040204@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=HuY3lyeqXpx4sGmo8Lus8fSPOwSevsquv6viNJPJ7YI=;
        b=hcbISy75aQo/H+BKb7+vleccifEOSk1+Rw/Ds7NTYqrr2rWNYzvoTvSfWAcjTZ2FWi
         oqWx8iPWNYYbrRsI+1IvZYdcXCkWAsXN4Px4dcQ6bbcXlnvPG9IFGm2ZupgL8OYa0hNd
         rxiFbRVXvZYCTvd/o5tGB4l4vuOjD6FF/iOlixFvYoTdyWBmRvB72upuWY4+yKoFbakz
         8v9IclDqF2hOg4euKUXj5krLx/iXnLDSirw/myzJd5wNW3OZO/qSv+jusqwfcBV9U1bV
         Dn6KVx/JHDB/YRB8cMVynOPtoTb3yQ3NQKtLlP3eq6nRmNAy4Jc4rtVtdJ+cGUmvnw8y
         GirQ==
In-Reply-To: <571243A8.8040204@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, kernel@lists.fedoraproject.org
Cc: netfilter@vger.kernel.org

Cc'ing netfilter@ too
Thread: 
https://lists.fedoraproject.org/archives/list/kernel@lists.fedoraproject.org/thread/CLNQ6O6OGNEJAFFSNV56KU6P2JAPM5YU/

Em 16-04-2016 10:52, Reindl Harald escreveu:
>
> Am 15.04.2016 um 10:16 schrieb Reindl Harald:
>> Am 14.04.2016 um 23:53 schrieb Marcelo Ricardo Leitner:
>>>>> Otherwise it won't be able to expect the new connection
>>>>
>>>> sounds reasonable, on the other side the client yesterday had troubles
>>>> to make passive ftp connections with "connection refused" as far as the
>>>> admin was able to tell on the phone
>>>>
>>> It could be that the drop happened and an auxiliary connection was
>>> attempted before the retransmission of the 227 reply, so your firewall
>>> didn't know about it and actively blocked the connection. If it had
>>> silently dropped the new connection request, the client probably would
>>> retransmit the SYN after a bit.
>>>
>>> Now why the cameras are triggering it, good question
>>
>> not the cameras - a ordinary client with filezilla, that one with 227 in
>> his IP address, the cameras blow their images without any problem on the
>> FTP server
>
> maybe i made it not clear enough:
>
> there is no "my firewall" between that is just iptables directly on the
> machine running pure-ftpd and so it's killing outgoing localhost traffic
> - that is very weird

Okay but expected :) because even if conntrack is running on the system 
itself that is running the service, it ignores that fact and still acts 
like just a man-in-the-middle.

So you can still reproduce it? If so, I don't see another way to debug 
this but to unload nf_conntrack_ftp and take a traffic capture without 
limiting the packet size (don't use -s option), because I'm afraid that 
otherwise conntrack will drop the packet and we won't even see it in the 
capture.
Look for a packet containing a "227 " in the beginning of TCP payload. 
That should be our guy.
Feel free to send it only to my email if you prefer.

Unfortunately the pr_debug()s available on that area aren't much helpful 
for this problem.

And which kernel is this?

   Marcelo

