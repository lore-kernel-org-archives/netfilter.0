From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: conntrack thinks that ICMPv6 Echo reply to ICMPv6 Echo request
 sent to IPv6 multicast address is INVALID
Date: Fri, 23 Mar 2012 14:39:14 -0400
Message-ID: <CACuyg246Rc3Y+50wWk75cfdGd1JCtETGitK5bQV842Ks1w5u3A@mail.gmail.com>
References: <4F6C787E.90708@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=2y6CrWpr/HDqBoVo1jAGR0FuwXHJm8+jy4SxoTis6VA=;
        b=nc1bLfrSMyodoBhmrkSwdx3gC4HNTcLXsc6eHjeZvsQmcMSA5OvCMM28R8jcQd7ku0
         XNGSoaFjdDZgspjzOALk+cL5lfZSKMNXC32js5oclxVoBxNE7MSx2mMre6F0ma+Gknmj
         l/So2CluEZbBSOnqsPghIqnJ5lXztB01OnYUKtdzVmbDl6hDriQa8nmqRu18pS6ocMVu
         NvogaPWpD1junxfkkkJK5Yi2j5L3qUhx93Pmppk7vOKgkSeboWuasQ/X6kZtUkfQZsFP
         4w44ypQSQ2S/19tFoGUXHTN8M0aafji9FsixU6kmj2touiF/MNc4Na7nucIiNh+PQiNL
         E3Tw==
In-Reply-To: <4F6C787E.90708@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jiri Popelka <jpopelka@redhat.com>
Cc: netfilter@vger.kernel.org

I think that your *problem* is...

When you ping to all nodes, the target address is one, but the
response is other (the same occur in ipv4 when you ping multcast
address). The conntrack table cant map the real nodes in this type of
request. So, to conntrack view its *invalid*!

INHO, to do this i think that you need allow icmp for individual
address before REJECT.


2012/3/23 Jiri Popelka <jpopelka@redhat.com>:
> Hi all,
>
> 1) I have two virtual machines with interfaces on the same link:
> A) fe80::5054:ff:fe09:e0b9/64
> B) fe80::5054:ff:fe80:d951/64
>
> 2) I set up IPv6 packet filter on A with ip6tables:
> # ip6tables -F
> # ip6tables -A INPUT -m conntrack --ctstate INVALID -j REJECT --rejec=
t-with
> icmp6-adm-prohibited
> # ip6tables -A INPUT -p ipv6-icmp -j ACCEPT
> # ip6tables -A INPUT -j REJECT --reject-with icmp6-adm-prohibited
>
> 3) ping6 B from A:
> # ping6 -I eth2 fe80::5054:ff:fe80:d951
> PING fe80::5054:ff:fe80:d951(fe80::5054:ff:fe80:d951) from
> fe80::5054:ff:fe09:e0b9 eth2: 56 data bytes
> 64 bytes from fe80::5054:ff:fe80:d951: icmp_seq=3D1 ttl=3D64 time=3D0=
=2E265 ms
> <OK>
>
> 4) ping6 'all nodes' from A:
> # ping6 -I eth2 ff02::1
> PING ff02::1(ff02::1) from fe80::5054:ff:fe09:e0b9 eth2: 56 data byte=
s
> <no response, reply is rejected>
>
> 5) remove the first line from ip6tables
> # ip6tables -D INPUT 1
>
> 6) ping6 'all nodes' from A:
> # ping6 -I eth2 ff02::1
> PING ff02::1(ff02::1) from fe80::5054:ff:fe09:e0b9 eth2: 56 data byte=
s
> 64 bytes from fe80::5054:ff:fe09:e0b9: icmp_seq=3D1 ttl=3D64 time=3D0=
=2E072 ms
> 64 bytes from fe80::5054:ff:fe80:d951: icmp_seq=3D1 ttl=3D64 time=3D0=
=2E318 ms
> (DUP!)
> <OK>
>
> I see this with kernels 2.6.32 and 3.3.0.
> Is it a known bug or my misunderstanding ?
>
> thanks
> --
> Jiri
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
