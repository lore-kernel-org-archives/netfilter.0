From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: error with iptables-restore
Date: Wed, 22 Oct 2008 17:05:31 +0300
Message-ID: <op.ujfirhourtqp7s@chiyo.azt>
References: <003301c9344d$29ffb5c0$7dff2140$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003301c9344d$29ffb5c0$7dff2140$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Joey <Joey@web56.net>, IPTables <netfilter@vger.kernel.org>

Hey.

Your CIDR-TURKEY chain is duplicated.
buzer@nanoha:/nanoha-md1/wsc/network$ cat -n TEST-IP-TABLES | grep  
"CIDR-TURKEY - "
   9027  :CIDR-TURKEY - [0:0]
   9945  :CIDR-TURKEY - [0:0]

And I would recomend to have a look on ipset package, your current  
iptables config is very ineffective (it goes thru *all* rules on *all*  
incoming traffic except if it matches at some point. And if it does, it  
will still be going thru everything unitl that point). You should *at  
least* use something like:
:SMTPTRAFFIC - [0:0]
:LOGASIA - [0:0]
-A INPUT -p tcp --dport 25 -m state --state NEW -j SMTPTRAFFIC
-A SMTPTRAFFIC -j CIDR-ASIAN
-A CIDR-ASIAN -s 58.14.0.0/15 -j LOGASIA
-A LOGASIA -j LOG --log-prefix "SPAM-BLOCK-CIDR-ASIAN"
-A LOGASIA -j DROP

And regarding your other email, yes.

-Eljas Alakulppi

On Wed, 22 Oct 2008 16:50:37 +0300, Joey <Joey@web56.net> wrote:

> Hello Everyone,
>
>
> I have been working on getting my ip list to be written to a save file,  
> and
> it looks good, but I get this error when restoring:
>
>
> iptables-restore v1.3.5: error creating chain 'CIDR-TURKEY':File exists
>
> Error occurred at line: 9945
>
>
> No there are 20 other chains that are generated prior to this one in  
> exactly
> the same way, and there are several chains that load PRIOR to this one,  
> so I
> know I don't have a syntax issue.
>
>
> Line 9945 has this:
>
> :CIDR-TURKEY - [0:0]
>
>
> Which looks exactly the same as every other chain creation line.
>
>
> I have linked the entire generated text file ( restore formatted file )  
> here
> <http://web56.net/TEST-IP-TABLES>
>
>
>
> Sorry to be such a newb..
>
>
> Thanks!
>
> Joey
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
