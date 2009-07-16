From: Simion Onea <simionea@gmail.com>
Subject: Re: state ESTABLISHED, RELATED
Date: Thu, 16 Jul 2009 09:42:40 +0300
Message-ID: <1247726560.15457.77.camel@TestField.intranet.bem.md>
References: <4A5E3B43.4050408@darkarts.no-ip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=27uM8MpLxokZ5SCCsLiyOdQxdrLVdYKQbsbdlq8Ieds=;
        b=EF02Bxr4/roDfEWvWgjQNm01p4k58GefICPxFyeMwe7iRSWh4Khz3ztpgUn/sJE+Rq
         5UWzFrItO7QbvG+8a5wagGS0+nIRiOdGtnkOuUUZJuIGguJ+G+gGHPj2RXVzUm3inSis
         P0+QyL5ktG+YrTH1QZAiB4NYQx8w2Lu74Dfx8=
In-Reply-To: <4A5E3B43.4050408@darkarts.no-ip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Kolt <andrew_kolt@darkarts.no-ip.org>
Cc: netfilter@vger.kernel.org

On Wed, 2009-07-15 at 23:25 +0300, Andrew Kolt wrote:
> As a temp solution i added the following to the INPUT chain, in order to 
> let those replies in:
> 
> -A INPUT -i eth0 -p tcp -s 0/0 -d zzz.zzz.zzz.zzz -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
> 
> Everything works well now, but i'd like to know if there's any other way 
> to go about this and if the line above is "good" practice as far
> as security goes.

Hi Andrew!

In my opinion it is good practice. We have been using such a rule for
some time. In our set of iptables rules we have these in the beginning:

#------------------------------------------------------------------
# Drop invalid packets, unrelated to any connection
iptables -t filter -A INPUT -m state --state INVALID -j DROP

# Block and log several types of network scans that use malformed packets
# FIN / URG / PSH
iptables -t filter -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -m limit --limit 5/minute \
  -j LOG --log-level notice --log-prefix "NMAP-XMAS:"
iptables -t filter -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP

# SYN / RST
iptables -t filter -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -m limit --limit 5/minute \
  -j LOG --log-level notice --log-prefix "SYN/RST:"
iptables -t filter -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

# SYN / FIN -- scan (probably)
iptables -t filter -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 5/minute \
  -j LOG --log-level notice --log-prefix "SYN/FIN:"
iptables -t filter -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# Accept packets related to previously established connections
iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Accept locally generated packets unconditionally
iptables -t filter -A INPUT -i lo -j ACCEPT
#------------------------------------------------------------------

The same rules can also be applied to FORWARD chain.

Regards,
Simion.


