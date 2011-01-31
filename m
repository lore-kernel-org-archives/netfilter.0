From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Mon, 31 Jan 2011 03:38:41 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com> <alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr> <AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: JeHo Park <linuxpark@gmail.com>
Cc: netfilter@vger.kernel.org

*sigh* don't strip the Ccs

On Monday 2011-01-31 03:24, JeHo Park wrote:
>On Mon, Jan 31, 2011 at 11:09 AM, Jan Engelhardt <jengelh@medozas.de> =
wrote:
>> On Monday 2011-01-31 02:53, JeHo Park wrote:
>>>
>>>the string match works well in filter table, but it does not work in=
 NAT.
>>
>> Oh it _does_ work in nat.
>>
>> But given that the nat table is an abstract configuration database
>> rather than a filter, not all packets do a lookup.
>
>but i found in runtime with debugging code, there is no TCP data but
>only TCP header in the skbuff of string match.

Good, then this issue is resolved.


>>>i used following iptables rules
>>># =C2=A0iptables -A PREROUTING -t nat -p tcp --dport 80 -m string --=
string
>>>"goole.com" --algo bm -j DNAT --to-destination 10.10.10.125:80

