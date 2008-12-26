From: Nick <vbox.nick@gmail.com>
Subject: Re: Links to projects using netfilter
Date: Fri, 26 Dec 2008 19:16:28 +0200
Message-ID: <4955116C.7010806@gmail.com>
References: <4954EEA7.7000302@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=5pVzKD8QWIGtvz7IenOuJ2puKvnIFMDKkR1ZtsbLDbQ=;
        b=KmtxR11NqZoYgEmKGzy2pansqXo3m/PST6P9rciMOwfuZSJnzfubsShBusiQ5CJTFu
         jqfa2rdjESVd5T4U6NcDjWVsnXn2QNrj7umZyrJue6cJum8YqFS+RBIydkuzAcMJhcxw
         6HCvpZtWpgGUizYnFW59cfy7p2qKeR5deh2uQ=
In-Reply-To: <4954EEA7.7000302@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org, webmaster@netfilter.org

Alessandro Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi all!
>
> The NFQUEUE target is documented as "passing packets to userspace".=20
> However, I couldn't find a list of programs that can be used for this=
=20
> purpose on netfilter.org. Thus, I had to roll my own one (I'm now=20
> running my first alpha release.)
>
> Would it make sense to add projects using the QUEUE mechanism to, say=
,=20
> http://www.netfilter.org/links.html? IPQ BDB maps an IP Queue to a=20
> Berkeley DB indexed on the ipv4 field. More at=20
> https://savannah.nongnu.org/projects/ipqbdb/
>
> Ciao
> Ale
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
The NFQUEUE target is nice feature. I using perl ( module ) for inspect=
=20
and acounting network traffic, but perl script works slow. If the=20
bandwidth of more than 2MBit/s, the cpu loading is 50% (C2D E6550).
Here is a program written in C, works much faster and less weight CPU 1=
-2%.
