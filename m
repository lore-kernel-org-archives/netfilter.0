From: Bill <boober95@rogers.com>
Subject: Re: Connection tracking Cli and an ALG for DNS
Date: Thu, 19 Nov 2015 13:52:03 -0500
Message-ID: <201511191352.03564.boober95@rogers.com>
References: <201511041332.09522.boober95@rogers.com> <201511061727.37090.boober95@rogers.com> <5648D2D2.7010107@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1447959125; bh=a60jIjLl0NMy9+FgDEvu7LZVVop96vA3yg0l4cP5udY=; h=From:To:Subject:Date:Cc:References:In-Reply-To:From:Subject; b=ZbSnXlbNnUknWPqQlt0J70kwgBaJp4BnBd5DDqo9ZZno08+8j/uxumwOGmtzuT5Enw95ce45Jxan8Iowzqs9q0CfoP8G2xLVwrTc7gKjc9k4Rts1OVCWJvcbmsh4YBv9ny1CY74ukJ91UazjaaU7XZ2gfN8gbYiWXeBlxJHDi4BUef8lyje73Q9df/4ptfJMcYH72NEth6OSIkobpK4C780gqtsizO00kGHfAwDwtFpuCaljP5fwarGPNlcUt5wq9oveofOmB3fzvdxjkZT8i0EtVjb5Ikf3MW2YIKIrX5emNpJ37Bm5JK391jhCs8+XanAGD8rfA+nD+7A1io17ng==
In-Reply-To: <5648D2D2.7010107@free.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adel Belhouane <bugs.a.b@free.fr>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Sunday 15 November 2015 13:45, Adel Belhouane wrote:
> (I didn't reply to the original sender, my bad. So sending the same m=
essage
> again...)
>
> Le 06/11/2015 23:27, Bill a =E9crit :

> Do you just want 192.168.20.171, behind a NAT gateway, to be the DNS =
server
> for outside? Can you confirm that's the case or is there something el=
se?

Actually it is 192.168.30.171 that is a NAT gateway and the DNS server =
for the=20
192.168.20.0 network.

> Can't you simply use the iptables DNAT target? If not, can you explai=
n why
> it won't work for your use case and for what reason you'd need someth=
ing
> else?
>

DNAT would give access to a specific host, but I want to refer to it by=
 a DNS=20
name for 2 reasons:

1)  The host I am going to connect may change it's IP address, or if it=
 is a=20
service being requested, it might be provided by another host if the ne=
twork=20
changes (I am looking at a mobile network where hosts may come and go, =
or=20
other hosts may replace them in times of interruption).

2)  Since the DNS may return different IP's over time; I don't' want th=
e IP in=20
the local 192.168.20.0 network to be revealed.  Instead I want it to ap=
pear=20
NATted, so it will be 192.168.30.170 + a port for this connection.  In =
other=20
words I want it to look like the host on the 192.168.20.0 network initi=
ated=20
the connection.

=46or reference here is my diagram again:

> >> local host               dns/nat gateway              remote host
> >> 192.168.20.171      192.168.20.170                192.168.30.172
> >>                                192.168.30.170
> >> inside               ----->>> nat >>> ------          outside

As you can see, DNAT would no do for my requirements since I'd have to=20
add/delete iptables rules, which I supposed I could do, but doesn't see=
m te=20
right approach.

Now since my original posting I have been reading code and have manged =
to=20
create an e'expect' connection by upgrading to the latest 4.4 kernel.  =
In=20
this version I find the sample test 'create-expect' works.

After succeeding with this I realize I may need to build a kernel modul=
e for=20
the expectation and have started looking at the kernel code for this, s=
uch as=20
those for FTP etc.

/bill
