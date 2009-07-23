From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: MASQUERADE MAIL SERVER
Date: Thu, 23 Jul 2009 20:34:43 +0200
Message-ID: <4A68AD43.8010100@unipex.it>
References: <4A6897BD.8000805@ideay.net.ni> <bf0e93a30907231040r11b3256dr74da9c2e0c91911c@mail.gmail.com> <4A68A8D7.1090607@ideay.net.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A68A8D7.1090607@ideay.net.ni>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Wilbert J. Rojas O." <sysadmin@ideay.net.ni>
Cc: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>, netfilter@vger.kernel.org

Wilbert J. Rojas O. wrote:
> Thanks but i have only one internet provider. I  was trying with SNAT 
> and DNAT but i failed with this rules:
> 
> iptables -t nat -A PREROUTING -p all -d 200.9.190.25 -i eth0 -j DNAT 
> --to 10.24.54.96

#so also you lan clients can talk with pubblic ip
$IPT -t nat -A PREROUTING -d 200.9.190.25 -j DNAT --to 10.24.54.96

> iptables -t nat -A POSTROUTING -p all -d 10.24.54.96 -o eth0 -j SNAT 
> --to 200.9.190.25

$IPT -t nat -A POSTROUTING -s 10.24.54.96 -o eth0 -j SNAT
--to 200.9.190.25

Michele
