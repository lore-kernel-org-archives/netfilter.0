From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Re: (NOT RESOLVED YET) How to list connections and its state PER
	CHAIN? Possible?
Date: Sat, 16 Jun 2012 09:50:25 -0600
Message-ID: <20120616095025.ga90dzk0lcg08wg4@correo.co.cr>
References: <20120614163818.k1vfdtxr40sokwk0@correo.co.cr>
	<alpine.LNX.2.01.1206151519570.12865@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1206151519570.12865@frira.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

Jan,

Thanks but.. according to our reading:


LOGMARK
The LOGMARK target will log packet and connection marks to syslog.

AND ...you only can follow via -J MARK, but MARK is work for table =20
mangle -> PRE and POSTROUTING

Any other option? :(

Jan Engelhardt <jengelh@inai.de> ha escrito:

> On Friday 2012-06-15 00:38, Jos=E9 Pablo P=E9rez wrote:
>
>> What would be the best way to list the amount of connections, and it=
s
>> current state that are passing through a chain? The idea is to later
>> parse these with a script.
>
> There is xt_LOGMARK in xtables-addons. Or, you just use `conntrack -L=
`
> if you need it decoupled from the ruleset.
>
>



