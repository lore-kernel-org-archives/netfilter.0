From: AZ 9901 <az9901@gmail.com>
Subject: Re: iptables as a protocol demultiplexer
Date: Sat, 16 Mar 2013 19:27:55 +0100
Message-ID: <2E9226BB-D2AD-4161-94A9-8CB0722953CC@gmail.com>
References: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com> <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com> <alpine.LNX.2.01.1303161917580.8551@nerf07.vanv.qr>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:subject:mime-version:content-type:from:in-reply-to:date
         :cc:content-transfer-encoding:message-id:references:to:x-mailer;
        bh=J9vGYbb0SY85Dg7DrC5p8VXDe9Prcz7Ag73utFweXr4=;
        b=iKIXUzMyjWKGO/kDjQDg7ZJuEbj23aPf9yUiIg6lhjQ9WDdZ5SvUIuJdM6Q40vosRq
         nmI1gnCcVbneJCDsbpZO/bXsopzB/m9ymCGW7lkUG2l68HLK7mmu/tKgXYWI70iS+YPr
         RbIP+asbZLldumnDaQkpQ7t0dWIkDh7BB50zUOry+rrbnLs8myO3IhCTpotAwtcUQ+sQ
         aVRYdAdnkH8jSGWxal1kpeIZ0zygHgQ0RzTkDFvQBH/hC6uX5V0/3ywXNTidE4JMp+mg
         TTFp2seeC/7Yb8ol4o7fn+4NfabCr3X+POWDMk85kat0/DBxIWVIf3HG72f84MkuVY2O
         0iMQ==
In-Reply-To: <alpine.LNX.2.01.1303161917580.8551@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Le 16 mars 2013 =E0 19:18, Jan Engelhardt a =E9crit :
> On Saturday 2013-03-16 18:25, AZ 9901 wrote:
>> Le 12 mars 2013 =E0 19:09, AZ 9901 a =E9crit :
>>>=20
>>> sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protocol =
demultiplexer, it allows to separate SSH and HTTPS streams which arrive=
 on the same port (443 for instance).
>>> I would like to do the same thing but with iptables only.
>>> Is it possible ?
>=20
> No. As the name already says, it works at the IP/Network level,
> not with upper protocols.

Yes but I was thinking of something like that :
- use "string" module to catch the first packet of a SSH connection (lo=
oking for SSH- pattern, as sslh does in its probe.c source file)
- use conntrack to follow this detected SSH connection
- redirect this detected SSH connection from port 443 to port 22

Other non-rediected connection (HTTPS connections) would then simply go=
 to Apache.

Any chance ?

Thank you !

Best regards,

Benjamin

