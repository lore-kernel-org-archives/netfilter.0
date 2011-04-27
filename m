From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 08:41:00 -0500
Message-ID: <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	<1303885014.18916.10.camel@andybev-desktop>
	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	<4DB80945.8040304@atc.tcs.com>
	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	<4DB817A5.3020604@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB817A5.3020604@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

Alright. Please let me explain.

I am implementing squid in the school.

Squid box 172.20.0.3
All workstations gateway are 172.20.0.3
All workstations proxy settings are 172.30.0.3:8080

The proxy settings are working fine for blocking content, however, I
am having the following issues:

The school's web server is hosted locally. When the workstations try
to access the site via the public domain name, it fails.
Also, there are several applications the school uses. These
applications range from port 5000-5005.

What would you suggest?

Thank you,
mike

On Wed, Apr 27, 2011 at 8:18 AM, Vigneswaran R <vignesh@atc.tcs.com> wr=
ote:
> On 04/27/2011 06:15 PM, Mike Hendrie wrote:
>>
>> I tried:
>> sudo =A0iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
>> REDIRECT --to- 8080
>> iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -j MASQUERADE
>>
>> And still ended up with the same message
>
> You should not have both rules in place. Basically Andy's suggestion =
and my
> suggestion are based on two different assumptions. Please select one,=
 based
> on your scenario.
>
> Scenario #1 Running Web Proxy
>
> If you are running a web proxy like squid, please ensure that it is
> listening on the correct port (seems, 8080 in your case), and configu=
red
> correctly (to allow your subnet etc).
>
> Also, ensure that the machines on the LAN have the proxy settings in =
place,
> for various applications like web browser, email client etc.
>
> I am not sure why do you need an iptables rule in this scenario. Are =
you
> looking for something like, the machines on the LAN won't have proxy
> settings for different applications, but still have to reach Internet
> through web proxy?
>
> Scenario #2 Configuring server as the Internet Gateway
>
> If you want to configure your server as the Internet Gateway, please =
add the
> following iptables rule to the server,
>
> iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -j MASQUERADE
>
> Also, ensure that all the machines in the LAN should point your serve=
r as
> the default gateway.
>
> ip ro add default via 172.20.1.1
>
> Here, I assume that your server's internal IP is 172.20.1.1.
>
>
> Regards,
> Vignesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
