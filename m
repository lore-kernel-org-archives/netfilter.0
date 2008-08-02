From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Setting up a proxy with iptables
Date: Sat, 02 Aug 2008 10:04:22 +0200
Message-ID: <48941506.6080409@unipex.it>
References: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linuxmc@libero.it" <linuxmc@libero.it>
Cc: sargon97 <sargon97@gmail.com>, netfilter <netfilter@vger.kernel.org>

linuxmc@libero.it wrote:
> Hi, have you try with a rule like
> 
> $IPTABLES -t nat -A PREROUTING  -p tcp -m tcp   --dport 80 -j DNAT
> --to-destination 82.109.120.222:8080
> 
> ?
> 
> Best regards ! Marco
> 

Should be better the redirect target:

$IPTABLES -t nat -A PREROUTING -i $INTERNAL -p tcp --dport 80 -j 
REDIRECT --to-ports $PROXY_PORT
$IPTABLES -t nat -A PREROUTING -i $INTERNAL -p tcp --dport 443 -j 
REDIRECT --to-ports $PROXY_PORT


Ciao,
MIchele
