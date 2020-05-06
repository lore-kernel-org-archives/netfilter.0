From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: Firewall sometimes leaking
Date: Wed, 6 May 2020 16:22:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.2005061619330.4108@blackhole.kfki.hu>
References: <20200506112449.GD14154@acrasis.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1588774966; x=1590589367; bh=YYlZEnOZcu
        mq6JBCJHgrbTuZzAMdyfT6TvN1KUKXK4k=; b=sV+VdnnIMgYuKKbLxmp0EJ1Nkp
        MCLH4lRyM9deUy6u8D8K81/L0Lsx6zz7HcmVLQyMM8F8dHUQA3gQlmYWI3keLHwb
        KOmFKX318M/WqQKLiTL8WXcmCQC6QmvW6bbpQid13I3UAR3sCo2formK2awLarw7
        iyshbGs8bHuICRYmw=
In-Reply-To: <20200506112449.GD14154@acrasis.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick <netfilter@acrasis.net>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, 6 May 2020, Nick wrote:

> My firewall leaks, sometimes.  I saw this behaviour with FireHOL and
> tried Shorewall instead but it continues.  Advice in #shorewall on
> freenode was that my shorewall configuration is valid.
> 
> The firewall has a rule to drop HTTP traffic if the source address is
> in an ipset.  The ipset is maintained by fail2ban and created by
> /etc/shorewall/init:
> 
>    ipset create f2b-http4 hash:ip family inet  comment timeout 2147483 -exist
> 
> This is on debian stable, uname -v prints "#1 SMP Debian
> 4.19.98-1+deb10u1 (2020-04-27)".  In debian's "alternatives" system,
> iptables is symlinked to /usr/sbin/iptables-nft.
> 
> The rule is on line 66 in the attached 'iptables-save -c' output.  The
> rule usually works but sometimes it doesn't.  An example occurrence
> follows (times are in BST).

Maybe the fail2ban rule is applied both for http and https, while 
the rule with the ipset matching is http only?

Best regards,
Jozsef 

> 2020-05-02 16:23 last reboot.
> 2020-05-04 21:03 shorewall last restarted.
> 2020-05-04 21:13 fail2ban last restarted.
> 2020-05-05 10:02 I saved the contents of the ipset f2b-http4 to a file.
> 2020-05-06 04:22 the webserver logged a request from 193.118.53.194.
> 2020-05-06 04:22 fail2ban warned "193.118.53.194 already banned".
> 
> The address was in my saved file, before the request:
> 
>   # grep '193\.118\.53\.194' ~/f2b-http4-2020-05-05T10:02+01:00.txt 
>   193.118.53.194 timeout 2101355 comment "wronghost"
> 
> The address was still in the ipset after the request:
> 
>   # date +%s && grep '193\.118\.53\.194' <(ipset list f2b-http4)
>   1588750964
>   193.118.53.194 timeout 2019727 comment "wronghost"
> 
> The decrement in the timeout (from 2101355 to 2019727) matches the
> time elapsed from saving the file to checking the ipset:
> 
>   # date +%s --date="2020-05-05T10:02+01:00"
>   1588669320
>   # echo $((1588669320 + (2101355 - 2019727)))
>   1588750948
>   # echo $((1588750964 - 1588750948))
>   16
> 
> i.e. they match to within 16s (my file timestamp has minute resolution).
> 
> I think the ip address was in the ipset f2b-http4 continuously before,
> during and after the time of the http request.  Yet the address was
> able to reach port 80 at 04:22 today.  How?
> 
> Thanks,
> -- 
> Nick
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
