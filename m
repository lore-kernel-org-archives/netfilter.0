From: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Subject: Re: Gateway with Iptables
Date: Mon, 29 Oct 2007 16:37:49 +0530
Message-ID: <4725BF05.5000708@liqwidkrystal.com>
References: <472568A2.3040002@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472568A2.3040002@liqwidkrystal.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


> Amos wrote:
> I believe you need to exempt the traffic from squid (local machine 
> IPA) from the REDIRECT about here.
>
> $IPT -A PREROUTING -p tcp -s $SQUID_SERVER --dport 80 -j ACCEPT
>
> ... And use "http port 8080 transparent" in the squid.conf
>
>
> > $IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT 
> --to-port $SQUID_PORT
> > 
> ###############################################################################
but after applying this users are able to connect to the Internet 
directly without enable proxy. what else i have to do to stop direct 
connection , they must use proxy.

-- 
Thanks & Regards,

Tarak Ranjan
___________________________
IS-Team
Liqwid Krystal

T:   +91 80  2509 1790 Ext. 107
E@:  tarak.ranjan@liqwidkrystal.com
IM:  reachtarak@hotmail.com

Online Learning|Certification|Learning Solutions: http://www.liqwidkrystal.com 



