From: Simon <greminn@gmail.com>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Mon, 10 Nov 2008 12:14:20 +1300
Message-ID: <5bdb1aa70811091514t506c9f7dib2d40ac26bba02b0@mail.gmail.com>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
	 <49149060.70100@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=eJ7hqg7zGw0rTIwOmUtxoHfUPNUV/TpIb17YLVZdilE=;
        b=W4OiCuImdZK24nkZqcgeYt0oCMKurUNvPzVStJvweSI10b0YhYY/W5h4bgj8qdA29R
         ajqJ3lEdMGM5Li6JQ2Ersng4+fD9CWVcr4S4V1LHrThZC+rtmGUc1Z1HSR1EUyjJNOGm
         xBPB9DGmPqXShLC7RpTBlsemdnN7xdAH1KIuM=
In-Reply-To: <49149060.70100@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sat, Nov 8, 2008 at 8:00 AM, Grant Taylor <gtaylor@riverviewtech.net> wrote:

> Try the above and see if things work.

Thanks for the replies todate!

I had a look thru the firewall rules that are created by the web
interface and have this in the /etc/firewall/portfw/iptablesportfw
file:

iptables -t nat -F PORTFW
iptables -t nat -F POSTPORTFW
iptables -F PORTFWACCESS
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 80
--to-destination 192.168.1.241:80
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.241 -p tcp
--dport 80 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 443
--to-destination 192.168.1.250:443
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.250 -p tcp
--dport 443 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 2222
--to-destination 192.168.1.241:22
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.241 -p tcp
--dport 22 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 2525
--to-destination 192.168.1.250:25
iptables -t filter -A PORTFWACCESS -s 210.xx.xx.xxx -d 192.168.1.250
-p tcp --dport 25 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 4125
--to-destination 192.168.1.250:4125
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.250 -p tcp
--dport 4125 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 20
--to-destination 192.168.1.241:20
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.241 -p tcp
--dport 20 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p tcp --dport 21
--to-destination 192.168.1.241:21
iptables -t filter -A PORTFWACCESS -s 0/0 -d 192.168.1.241 -p tcp
--dport 21 -j ALLOW
iptables -t nat -A PORTFW -d 192.168.2.2 -j DNAT -p udp --dport 4569
--to-destination 192.168.1.247:4569
iptables -t filter -A PORTFWACCESS -s 202.xx.xx.xxx -d 192.168.1.247
-p udp --dport 4569 -j ALLOW

Which is close, but not the same as your example above... have i got
the right section here?

Simon
