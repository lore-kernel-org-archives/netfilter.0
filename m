From: Michael Bellion <mbellion@hipac.org>
Subject: Re: some problems
Date: Fri, 7 Oct 2005 20:19:53 +0200
Message-ID: <200510072019.53854.mbellion@hipac.org>
References: <43466582.7000307@artcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43466582.7000307@artcom.pl>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: =?utf-8?q?Pawe=C5=82_Staszewski?= <pstaszewski@artcom.pl>

Hi

> Hello
> I have linux with hf-hipac v0.9.0 installed on kernel 2.6.13-r3
> and i have 97 vlan interfaces on machine.
> When i try to add:
>
> <fw.sh>
> #!/bin/sh
>
> vlans="999 100 101 102 103 104 105 106 107 108 109 110 111 112 113 300
> 114 450 401 402 301 302 303 304 305 306 307 308 309 310 311 312 313 403
> 314 315 316 317 318 404 405 115 406 116 500 501 319 320 321 322 323 324
> 325 326 327 328 329 330 331 332 333 334 335 336 337 117 118 119 120 121
> 122 407 408 409 451 452 453 454 455 456 457 458 459 461 202 460 462 463
> 464 203 503 504"
>
> nf-hipac -F
> nf-hipac -X
>
> nf-hipac -X permit10-services
> nf-hipac -N permit10-services
>
> nf-hipac -A permit10-services -s 10.0.234.12 -j ACCEPT
> nf-hipac -A permit10-services -s 10.0.230.0/24 -j ACCEPT
> nf-hipac -A permit10-services -s 10.202.40.2 -j ACCEPT
> nf-hipac -A permit10-services -s 10.4.120.195 -p tcp --dport 666 -j ACCEPT
> nf-hipac -A permit10-services -p udp --dport 67:68 -s 10.0.0.0/8 -j ACCEPT
>
> for vlans in $vlans
> do
> nf-hipac -A INPUT -i vlan0$vlans -s 10.0.0.0/8 -j permit10-services
> done
> <fw.sh>
>
> dmesg shows me:
>
> NF_HiPAC: too much interfaces UP at the same time. Please increase
> NF_HIPAC_MAX_UP_INTERFACES in nf_hipac_dev.h and recompile!

Seems like the interface string match support is broken :-(

I am currently at the netfilter workshop in Seville, Spain and I have a lot of 
hardware problems with my notebook :-(
I will fix the interface problem as soon as I return to Germany. Expect a 
patch on http://www.hipac.org on monday.

Thanks for your bug report
        Michael Bellion

