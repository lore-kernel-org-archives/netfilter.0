From: Victor Julien <lists@inliniac.net>
Subject: Re: IPS recommendations?
Date: Wed, 15 Jun 2011 22:56:59 +0200
Message-ID: <4DF91C9B.1040401@inliniac.net>
References: <92A9C99A1E5FF14F8538DDEE14996A520364AF@chp-exg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92A9C99A1E5FF14F8538DDEE14996A520364AF@chp-exg.coxhp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bmcdowell@coxhealthplans.com
Cc: netfilter@vger.kernel.org

You can check Snort[1] (contains inline support), Suricata[2] or
something like fwsnort[3].

Personally I'm "using" Suricata, because I'm developing it ;-)

Cheers,
Victor

[1] http://www.snort.org/
[2] http://openinfosecfoundation.org/
[3] http://www.cipherdyne.org/fwsnort/

On 06/15/2011 09:39 PM, bmcdowell@coxhealthplans.com wrote:
> Is anyone on the list using some form of IPS that integrates well with netfilter-driven firewalls?  I haven't looked into this particular angle since snort-inline in 2003.
> 
> 
> Bob McDowell
> Network/Security Engineer 
> Cox HealthPlans 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
---------------------------------------------
Victor Julien
http://www.inliniac.net/
PGP: http://www.inliniac.net/victorjulien.asc
---------------------------------------------

