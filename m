From: Shaun Crampton <shaun@cantab.net>
Subject: ipset hash:net performance
Date: Mon, 18 May 2015 22:39:15 -0700
Message-ID: <CAB3ewxNnOq0GUaP79cWkqLGb=TD0eNspJXMTSrUakwRRSV_pcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=D529ATYJy3+eBsCCV1+kBlx5Pt/1sMWIY1iU5/achWk=;
        b=NVaZ1Wp8nGQI8lXv/GxmIz0PDSg9lR3HCOz5Xis3zwSr/uRMQgqbW5evyar8rzWcg7
         fM2ioqRsaKROpCGjcRHnx4s13uqw1gODfeIY/V0Ld/48At3ay9KbBtDV1jUEg/bVi9bM
         pEgdEwFRE5tax7TmsstgsWgRGVbPAkFkzOk00N+188Er5emH1fD0yd/Kw1GSXNnfI1/b
         Rg6O+o3dDxUxFMnyNSnBSUT+OB6M82EV3UKixGiOlgWMd+j5mMFWbO2iACQuUiXqFc+N
         83imdrW/1ssT6PINi3O3J7AV3I7Fi3GDv1bO6jXPiotAKbwALG1gv28+ShLasPXBwGlb
         ZeOA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

The manpage for ipset's hash:net type says that "The lookup time grows
linearly with the number of the different prefix values added to the
set.".  Just wanted to check whether "prefix value" means the "prefix
length" or whether it means "the value of the prefix as whole".

As an example: if I have 10.0.0.0/8, 11.0.0.0/8 in my hash:net ipset
then is that one "prefix value" (because they share "/8") or two
(because they have two addresses)?

Thanks!
