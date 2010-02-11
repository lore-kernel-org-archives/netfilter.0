From: Payam Chychi <pchychi@gmail.com>
Subject: Re: performance testing iptables...
Date: Thu, 11 Feb 2010 11:31:24 -0800
Message-ID: <f08c15d11002111131n53077699v85291cb91fe619a7@mail.gmail.com>
References: <f08c15d11002102346n6dade2dgd00185620dc373e@mail.gmail.com>
	 <1265876134.22782.10.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CsDYVq2XaYCiH0lSlxk6poNx2uhcVaCoiChmvN1LBB8=;
        b=nQ1V6f+eQsYBgKQ1/SSxaky6mL26mUYBCcnHE5vKTFsAicsXh99d51+8T3K+6e+h/v
         fgDKPi5vIf7rvZ/q96A9RWqjSZhCxQi4sBxPnhSESukT0+YRoACORI6sfECLSA5KFVbm
         GQ6odDLGyOKmYxmO7UkKReFhyL0f1Os4hPATM=
In-Reply-To: <1265876134.22782.10.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

Hi Eric,

=46antastic docs, I had not seen the one by Jesper
http://nfws.inl.fr/nfws_userday/Jesper-Brouer_Large-iptables-rulesets.p=
df

Thanks again
Payam



2010/2/11 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le mercredi 10 f=E9vrier 2010 =E0 23:46 -0800, Payam Chychi a =E9crit=
 :
>> Hi Guys,
>>
>> Ive been reading all over the web on performance tests done against
>> iptables and its ability to perform both state and non-state
>> filtering. I am setting up a pretty decent server for some testing a=
nd
>> I was wondering if you guys could give me some ideas on how to fully
>> push iptables to its limits (different type of traffic, different
>> usage, string matching/u32 module and such...)
>>
>> Server consists of:
>> Quad Cor Intel(R) Xeon(R) CPU =A0 =A0 =A0 =A0 =A0 E5420 =A0@ 2.50GHz
>> 32gig Ram
>> 220gig Sata (not worried about this as im trying to keep most things=
 in ram)
>> Intel Gig nics
>>
>> Running:
>> Debian 5.0 + grsec
>>
>> I will later post results and poc online for others to view
>> Any/All ideas are welcome =3D)
>
> There is some interesting read about the topic:
> http://people.netfilter.org/kadlec/nftest.pdf
> http://nfws.inl.fr/nfws_userday/Jesper-Brouer_Large-iptables-rulesets=
=2Epdf
>
> Google on "Netfilter performance" seems to bring some other informati=
on
> sources.
>
> BR,
> --
> =C9ric Leblond <eric@inl.fr>
> EdenWall, http://www.edenwall.com/
> NuFW, http://www.nufw.org
>



--=20
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
