From: Narendra Choyal <narendrachoyal@gmail.com>
Subject: Re: Force traffic
Date: Tue, 15 Jun 2010 01:21:09 +0530
Message-ID: <AANLkTikmYEJeQVI5icjMK0FuFT8rWNvazsELSxqzi93i@mail.gmail.com>
References: <4C1513F3.5010508@abpni.co.uk>
	<4C162BEE.5010807@uncu.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VxBv0L78L0OOCCZL77A7iFucZ9glmafWlXNtzOcIYfg=;
        b=Ia9xYlLd9j4z1ce5pat4wQWaFQv5a9ROun8Pu8jHvZM+xcHFwYbHdyYCA2Y1vqB7Uj
         Oq+ZW/R7yxKSwNuGgH1e6kZNTDXEirG0jEXzboNnnsN2ZvNsSNluEPfD9/XH6tKIzmm0
         aYqGWxk3jXBKHeRHB0s7JcMVIEgOTdKnA0mnI=
In-Reply-To: <4C162BEE.5010807@uncu.edu.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Federico Alberto Sayd <fsayd@uncu.edu.ar>
Cc: netfilter@vger.kernel.org

What type of virtualization you are using --
 =95 Para virtualization
 =95 Fully virtualization

Different virtualization differs for your answer.

Sol 1.
=3D=3D=3D=3D
You have to apply NATting that will route all routes to a specific
interface(or ip of interface)

Sol 2.
=3D=3D=3D=3D
Use "route" command

and for more detail contact me
Narendra Choyal
narendrachoyal@gmail.com
