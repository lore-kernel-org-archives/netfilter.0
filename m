From: ha do <haloha201@yahoo.com>
Subject: Re: Help!!! iptables hashlimit
Date: Wed, 14 Jul 2010 02:39:37 -0700 (PDT)
Message-ID: <117508.97487.qm@web32407.mail.mud.yahoo.com>
References: <4694.23493.qm@web32402.mail.mud.yahoo.com> <AANLkTilFi9WmIWoRQ16N-iG34klTw_IF76hGafpaHTe3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1279100378; bh=anGXWhiG8fqFYpU4y+WAQsLb0c+x89Kcy21uVoaiJz4=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type; b=1pGDxjWo29Zp/jQiYz2BcZzmDBrbxwHcngjrBX86sAl9sTAs6NJWAyc3SgshktuoacSy6gnxFI4u3fXG9bD4lotAh5+/cJm/X4NqhMkJX+E+nTdqxK/SgPRRobFmOD6tG+pnaShYLGSHVCfaCIZBtVj78/9PLiF/9Ur5U4v+Qso=
In-Reply-To: <AANLkTilFi9WmIWoRQ16N-iG34klTw_IF76hGafpaHTe3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

Hi Curby

thank you for your reply
SIP server and sip endpoint is in the same LAN so what do you think about 
network lantency

do i test with this:
-A INPUT -p udp -i eth0 --dport 5060 -m hashlimit --hashlimit 70/minute 
--hashlimit-burst 10  --hashlimit-mode srcip,srcport --hashlimit-name "cucku" -m 
string --string "REGISTER sip:" --algo bm --to 80 -j ACCEPT


the iptables still drop packet

i checked again the man page and see : 
[--hashlimit-htable-gcinterval] interval between garbage collection runs

could you guide me how to use it

Thank you
Ha`

----- Original Message ----
From: Curby <curby@cur.by>
To: ha do <haloha201@yahoo.com>
Cc: netfilter@vger.kernel.org
Sent: Wed, July 14, 2010 3:39:51 PM
Subject: Re: Help!!! iptables hashlimit

On Wed, Jul 14, 2010 at 2:03 AM, ha do <haloha201@yahoo.com> wrote:
> i just setup the hashlimit for SIP REGISTER on iptables and the rule is:
> -A  INPUT -p udp -i eth0 --dport 5060 -m hashlimit --hashlimit 1/minute
> --hashlimit-burst 2 --hashlimit-mode srcip,srcport  --hashlimit-name  "cucku" 
>-m
> string --string "REGISTER sip:" --algo bm --to 80 -j ACCEPT

> i want the iptables just to  accept 2 REGISTER packets per minute on per IP
> address:port

There might be other issues, but you need hashlimit 2/minute to accept
2 packets per minute.  Having a burst of 2 by itself is not
sufficient.

Sometimes, due to network latency or other timing issues, you need to
be even more accepting.  For example, I've found that accepting
"well-behaved" pings requires a minimum hashlimit of 61/min with burst
of 2.  When I lower either setting, iptables starts dropping the
occasional ping packet.

--Mike



      
