From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 10:58:06 +0300
Message-ID: <1247558286.7214.16.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=wPLndIGFEXq19MS7BHxWJpsGPlxZOHqoSU3Q2yxI/H0=;
        b=Qw+lme7MBwVCy0xxMPDA6bWhLhHY+rKXFwgvQuh6CVJs4P23YFEgqO/VyfaIg5tm6J
         BzOCh+zwpSj9uMKaQfw9YOIxAXlYFjGDBHMXLgs2gxYHncY9a21WzL5wFrBij1wc08VM
         QGER0kBgvHSQZLD+l1GGETuxXsMwUW+5ljgIs=
In-Reply-To: <1247494451.25529.52.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Mon, 2009-07-13 at 16:14 +0200, Thomas Jacob wrote:
> You need DNAT+SNAT for this:
> 
> # Redirect to IP:Port
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 \
> 	 -j DNAT --to-destination 172.20.1.254:25
> 
> # Ensure that the replies come back to us
> iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 25 \
>          -d 172.20.1.254  -j SNAT --to-source 172.20.1.245

Hi Thomas!

I tried these rules but it seems that packets to not pass the first
rule. To test this I put two LOG targets before and after the PREROUTING
rule like this:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j LOG
--log-tcp-options --log-prefix PREROUTING_before:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j DNAT
--to-destination 172.20.1.254:25
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j LOG
--log-tcp-options --log-prefix PREROUTING_after:
iptables -t nat -A POSTROUTING -o eth0 -p tcp -d 172.20.1.254 --dport 25
-j SNAT --to-source 172.20.1.245

As a result I received in the log three messages with
"PREROUTING_before" -- these were SYN packets. And no message with
"PREROUTING_after" :-(

What could be wrong ?

Regards,
Simion.


