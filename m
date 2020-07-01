From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Wed, 1 Jul 2020 22:01:27 +0200
Message-ID: <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc> <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc> <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sy4mBNUTtZm/KAds6hF9/bJzgQ9RqlMQQcxD9i4jx4E=;
        b=duWEcgfT66i1mdAWTHlz9/eH7Xnkr+bcFvmCLh5YnpD98M89EOO+ersOv6cjbpEHPD
         /r2oV7bZAMqGQFKl8W36TtgwJcyb/jT+Nvk6K8f2QYQcLj4WYk1G3Uwrw135FIABbBnY
         a5AigN8uB1oOME5DDCt/TD8hW2L5go4XtuYEILe5g7P7LrUc5uaBRCkAcKD6uhNFDo/3
         GF3GX1kViuvARjkXVMVmNaIkqcQUs4auravigznQPme9yw6ixDXb7+Xz7K10G8anrOxa
         56KK9bz44ZZC0K/BkJI3PYGHa9CqdfFakbWE7bRbV/8h17Qi/ewy2n5XpST0oNilxea7
         XALA==
In-Reply-To: <20200621104516.GM26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Hi Florian,

please is it a bug the rules did not work in the raw table or was it
my configuration error?

If it is a bug is it a bug of kernel or userspace?

If it was my configuration error, should not be the rules moved to the
filter table?

How is it possible that using iptables-nft the rules are added to the
raw table and it is working?

Thanks

Marek


2020-06-21 12:45 GMT+02:00, Florian Westphal <fw@strlen.de>:
> Marek Gre=C5=A1ko <mgresko8@gmail.com> wrote:
>> Hello,
>>
>> unfortunately the helper is not there:
>>
>> conntrack -L | grep sip                     -> no output
>>
>> It is strange, that if I use iptables-nft it is working. Some userspace
>> problem?
>
> No, looks more like a kernel bug to me, I will have a look on
> Monday.
>
> In mean time, you can work around this bug by removing the entire "ip
> raw" / "ct set" stuff.
>
> and then use:
> sysctl net.netfilter.nf_conntrack_helper=3D1
>
> to re-enable the old auto-assign behaviour.
>
