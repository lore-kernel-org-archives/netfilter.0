From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: Possibly dangerous interpretation of address/prefix pair in -s option
Date: Fri, 3 Jun 2022 14:54:41 +0000
Message-ID: <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654268081;
        h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
        bh=//WqGhlIpbYSes0cir9HXXCG7hIaautPeJYr2hxMpMU=;
        b=MTfd4hDIYVoKMJPXsfEnF+Nwg46y3y6db3U6CYdvdOjDrvp1xZficm7qlkNg3ZCQ
        kXNAauZqrSr7sBhVayRg2t6Tw9wZ3s4NsMychnMFWkufkudVRex8gVC7g6Odr6R+iMX
        mDC+lnpMdy2095+5+9mSvQKgIC+SXclRyAYTrgUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654268081;
        h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
        bh=//WqGhlIpbYSes0cir9HXXCG7hIaautPeJYr2hxMpMU=;
        b=uAQo82DG9+WdHJUQ9Zxs3UHc/QnZzFLGwiBFthY0vAfQ88e1eCRh2PnE1nnfzHbp
        KcY+wDYHqitJcsjwPAQdfepoiYFaw2vdp6tS4BVYYIkcQwjj4Tc35YREQ7Gn2jrMYRi
        QpFYqW7IIrMD3IjaXBkcwwar4R3xwE8hfwP6wA7o=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

Hi,=0D=0A=0D=0AI'm a beginner and noticed than when I do e.g.=0D=0A=0D=0A=
iptables -A INPUT ... -s 10.0.0.2/24 ...=0D=0A=0D=0Athis gets interpreted=
 as "allow from source 10.0.0.0/24" i.e. from the entire network. I think=
 it would be more beginner-proof if iptables would interpret this as inco=
rrect input and error. Or at least, interpret 10.0.0.2/24 as 10.0.0.2/32.=
 So if there is incorrect input, and that input is automatically re-inter=
pretet (which in itself is unsafe, I would think), then at least interpre=
t it in the way that is more restrictive (i.e. single IP instead of subne=
t). Otherwise I like iptables a lot, thanks for all the great work!=0D=0A=
=0D=0ARegards, Stefan=20=0D=0A
