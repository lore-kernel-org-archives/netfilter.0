From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables rule for ovh
Date: Thu, 29 Jul 2010 11:34:49 +0200
Message-ID: <4C514B39.4050504@plouf.fr.eu.org>
References: <4C51450F.7070906@gmail.com> <AANLkTimj+TLgiE7GEhAnDRLoqZHzkq7Nuk8aC=+nxg8K@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimj+TLgiE7GEhAnDRLoqZHzkq7Nuk8aC=+nxg8K@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Horton <arimus.uk@gmail.com>
Cc: Portedaix <portedaix@gmail.com>, netfilter@vger.kernel.org

Richard Horton a =E9crit :
> On 29 July 2010 10:08, Portedaix <portedaix@gmail.com> wrote:
>>
>> Is there a way to have a rule equivalent to the one below which is
>> for kernel 2.6.14 and above,  with a linux kernel 2.6.9 ?
>> '#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string
>> "Cirpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net=
 -j DROP'
[...]
> The other option would be, depending on the headers etc, use somethin=
g
> like the u32 match to discard them.

The 'u32' match was added in the mainline kernel in version 2.6.23.


