From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: iptables rule for more than one target
Date: Fri, 27 Jan 2012 09:08:31 +0100
Message-ID: <1506397.Ja1Gdm6TYs@alaris>
References: <CAMTjHrzUgXbHviHAYmaBZyTzV-pwXJYpOR4puWxgQ1WCf2TDYQ@mail.gmail.com>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrzUgXbHviHAYmaBZyTzV-pwXJYpOR4puWxgQ1WCf2TDYQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>

On Thursday 26 of January 2012 18:12EN, Usu=E1rio do Sistema wrote:
> /sbin/iptables -t mangle -I PREROUTING -s 10.10.10.10 -d !
> 192.100.100.8 10.254.253.1 172.16.0.1  -j MARK --set-mark 5
=2E..
> I need add some "-d ! x y z ..."

You can do

iptables -t mangle -N mark5
for a in 192.100.100.8 10.254.253.1 172.16.0.1; do
    iptables -t mangle -A mark5 -d $a -j RETURN
done
iptables -t mangle -A mark5 -j MARK --set-mark 5
iptables -t mangle -I PREROUTING -s 10.10.10.10 -j mark5

Or maybe it will suffice to first mark all packets from 10.10.10.10 wit=
h=20
mark 5 and then remark packets with those three destinations back to 0=20
(or anything else).

                                                    Michal Kube=E8ek

