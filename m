From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Re: problems with h323 helpers
Date: Tue, 16 Oct 2012 11:12:39 +0300
Message-ID: <CAAo+KFmTfWLkcHr_7jXTj6iGrPeDNMMpXfKzhtodteweqnvR8A@mail.gmail.com>
References: <CAAo+KFn=iGm0wruYkR1udwx_+RTrDmWBeh4MdX2zSTbGHgdZnA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=gBA0EMYWAF2b2YIB95C9mu8ydkAsufPFoGAbwupesW8=;
        b=0n7I+KpXBD0MzZm6q4MQB1OyI6Ih9G/PS19wDBZDAySohQnlvAhPN9g/cy7NpGsCNd
         HoiQm7SWh4xpOT9eUzWLUVXoFEMG4R01viqE1rdNbY2pKJW9argKZ/5itPNLN/x5Elyr
         cr7KWKDkxvP89RHIM0G5w0Ztpb/QafN7sIIzVgjLLAFbbFxZti5ySpBeEse2VQX4yp+e
         txqubRAfX4S2mKuZXoe0vURtLh0HNhUeFhKFTQYoVsTXDyxfpPyRL6oizBMAV7gzi+hb
         43k/Q7l4KZLGKn9bAGiYYmt75bvnf1Ft/z5T5Y5GdU+hDugxH4kcfyO0UTtXBSXI/O/e
         OmeQ==
In-Reply-To: <CAAo+KFn=iGm0wruYkR1udwx_+RTrDmWBeh4MdX2zSTbGHgdZnA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Kernel is 3.5.3

--
Oguz YILMAZ


On Tue, Oct 16, 2012 at 11:03 AM, Oguz Yilmaz <oguzyilmazlist@gmail.com> wrote:
> Hello
>
> In my system There is a Polycom HDC7000 video conferencing device and
> a VVX1500 ip phone.
>
> Incoming connection:
>
> Src:Any - Dst:ExtIP1 - Srv:Any -> DNAT to-destination IntIP7000
> Src:Any - Dst:ExtIP2 - Srv:Any -> DNAT to-destination IntIP1500
> Src:IntP7000 - Dst:Any - Srv:Any -> SNAT to-source ExtIP1
> Src:IntP1500 - Dst:Any - Srv:Any -> SNAT to-source ExtIP2
>
>
> When I have loaded nf_nat_h323 and nf_conntrack_h323, HDX7000 can not
> call outside, VVX1500 works correctly. When I have disabled those
> modules, HDX7000 works and VVX1500 stops working.
>
> I can enable module for a specifi connection. (see my previous post).
> What can be the problem is? What do you suggest me?
>
> Regards,
>
>
>
>
> --
> Oguz YILMAZ
