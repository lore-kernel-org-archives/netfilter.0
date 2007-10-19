From: "Khoa Nguyen" <khoa.coffee@gmail.com>
Subject: Re: libipq and destination IP address
Date: Fri, 19 Oct 2007 09:29:09 -0400
Message-ID: <3d00e6dc0710190629s37aad5c3jed14808287dc2cd8@mail.gmail.com>
References: <mailman.21644.1192545951.25258.netfilter@lists.netfilter.org>
	 <3d00e6dc0710160744ia8edebbn8dafb76d709622dc@mail.gmail.com>
	 <1192786783.29962.126.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=6d9hkOowF5a9de9k8EPNcqtIcNLOqNb8bMG9eE5/9Xw=;
        b=OkAt+qsBAmn5Jd4Kh7fsHDggEQALQAeate+yPFHWDm/IIoJC1fXtnNcGDxIFv/aEqf+uDkAlQpbOUrAnTSV9R1XxMMqUetD2qO3TolCA4jULV/PcInl3XMGSF105fH5KlNA9FmT68Aja5y/qT/ZAzLSwJslXUb5gvZjHIdJwNYc=
In-Reply-To: <1192786783.29962.126.camel@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

Hi,

Thanks for your response. Actually, the problem is inet_ntoa()
function -- I should have printed out the IP address right away before
calling the function again

Thanks,
Khoa

On 10/19/07, Eric Leblond <eric@inl.fr> wrote:
> Hi,
>
> Le mardi 16 octobre 2007 =E0 10:44 -0400, Khoa Nguyen a =E9crit :
> > Hi,
> >
> > I am writing a small libipq program to extract packet info. I "queu=
ed"
> > all packets in the OUTPUT chain. It looks like the packet has the s=
ame
> > source and destination packet ( =3D host interface address). Why is
> > that? Is there a way in libipq to extract the REAL destination
> > address?
>
> First of all: switch to libnetfilter_queue
>
> For your question, libipq sends to userspace the whole content of the
> packet. Thus there is no potential problem of address rewriting. You =
can
> have a look at the following code extract from NuFW:
> http://docs.nufw.org/doxygen/trunk/html/packetsrv_8c-source.html#l002=
92
>
> BR,
> --
> =C9ric Leblond, eleblond@inl.fr
> T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
> INL, http://www.inl.fr
>
>
