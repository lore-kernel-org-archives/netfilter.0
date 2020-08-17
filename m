From: Daniel <tech@tootai.net>
Subject: Re: error using variable for network device name in 'hook ingress
 device $external_interface'
Date: Mon, 17 Aug 2020 11:21:45 +0200
Message-ID: <012b6ca5-16e4-3bb4-5cf8-2f9a8d3ec556@tootai.net>
References: <f05dedbd-3c4c-e31c-80ec-0383e7da1518@gc9.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597656110; bh=S47j4Aql2oCtGQ58riDiHASbH9fb90xpL0LimURA550=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=W8V2GAHIfcQa6PqmibAINQFytbNREkzFLLPOxqDF5NmJxTPuvRKbpIsCwAn/wYgKv
         F6xlI6nrRuHI0Rn8sLDwLaPJxNSo+cXj4qSbLNLRZsT6NirgR8Xm1pqkL+BAgo35uU
         eGiX00CC0azsHFOSFrSVQne05cQNw9ikfKcRedjA=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1597656109; bh=S47j4Aql2oCtGQ58riDiHASbH9fb90xpL0LimURA550=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=PMjBap9hYnGcyCfWmWhEVudl3l4lnmCqyteLyJKcj3QdatmmJi94S2i92GugpbALw
         y/q4Z3iw7uzsN4E5sYq5O+NOnd9LkvMfSclExBu64M0B1be95SBWafQesvoSt2Cqht
         nh2pPIXWYxpikiKJt6yOsiG1KHDkxc6rKzljP4SE=
In-Reply-To: <f05dedbd-3c4c-e31c-80ec-0383e7da1518@gc9.org>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello

Le 17/08/2020 à 02:23, Grant C a écrit :
> Hello,
>
> Is there special syntax required to use a variable name instead of 
> hard-coding the interface name in a declaration like the following?
>
> chain blackhole {
>   type filter hook ingress device $external_interface priority -500; 
> policy accept
>
> Error: syntax error, unexpected '$', expecting string or quoted string 
> or string with a trailing asterisk
>                 type filter hook ingress device $external_interface 
> priority -500; policy accept
>
> using the interface name directly instead of the variable works.
Try chain blackhole "{
   type filter hook ingress device $external_interface priority -500; 
policy accept }"

>
> Trying the new syntax that allows using a list, 'ingress devices = { 
> }' also fails when using a variable either inside an anonymous list, 
> or as the name of a named list.
>
>
> I am using nftables 9.3 from Debian Buster backports.

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
