From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [ipset] adding a fqdn and get all A or AAAA registers in the
 set
Date: Fri, 12 Oct 2012 03:46:53 +0200
Message-ID: <5077768D.1060408@ngtech.co.il>
References: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com> <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com> <5075896E.8030305@ngtech.co.il> <CAPfcJasHXPKs8Qo9wrg0qcyiNaRkf+3_VoMFZ-EraadwjpM=Nw@mail.gmail.com> <alpine.DEB.2.00.1210102004160.10737@blackhole.kfki.hu> <CAPfcJatOE8BC4JLGa6_s5+-mTQQ17KMyjVAxbpYpnpUWo-oOzQ@mail.gmail.com> <50769AE9.6010905@ngtech.co.il> <50769C5F.1020706@cica.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50769C5F.1020706@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On 10/11/2012 12:15 PM, Arturo Borrero wrote:
> Yes, I know it.
>
> But having a layer over ipset was not what I was looking for.
>
> Also, I considered this a nice/basic/standar/awsome feature that I 
> didn't know why ipset doesn't implement it. 
it's not really a layer over ipset since it's not constant usage.
it will be only used on adding and others.
In any case something will do the dns naming resolution and will make 
the ipset rules only per resolution so for a more dynamic resolution you 
will need a helper.

Regards,
Eliezer

