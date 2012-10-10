From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [ipset] adding a fqdn and get all A or AAAA registers in the
 set
Date: Wed, 10 Oct 2012 16:42:54 +0200
Message-ID: <5075896E.8030305@ngtech.co.il>
References: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com> <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On 10/10/2012 3:13 PM, Arturo Borrero wrote:
> Hi there!
>
> I've been doing some test, and I'm unable to get all A or AAAA registers of
> a FQDN inside a set (i.e. hash:ip).
>
> Try it yourself:
>
> $ host dl.dropbox.com
> [6 ips]
> # ipset create hash:ip test
> # ipset add test dl.dropbox.com
> # ipset list test
> [just 1 ip]
>
> I took a look at the source of ipset (on git repo), but I was unable to
> determine where in the code the desition of drop (or ignore) additional DNS
> resolutions is being taken. (Yes, i'm a noob programmer)
>
> Any idea?
>
> Best regards.
you can use some script to do the resolving and then add the results to 
the set one by one.

how ipset behave is the same as iptables.

Regards,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
