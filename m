From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: How to list connections and its state PER CHAIN? Possible?
Date: Fri, 15 Jun 2012 15:20:33 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206151519570.12865@frira.zrqbmnf.qr>
References: <20120614163818.k1vfdtxr40sokwk0@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120614163818.k1vfdtxr40sokwk0@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Jos=C3=A9_Pablo_P=C3=A9rez?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

On Friday 2012-06-15 00:38, Jos=C3=A9 Pablo P=C3=A9rez wrote:

>What would be the best way to list the amount of connections, and its=20
>current state that are passing through a chain? The idea is to later=20
>parse these with a script.

There is xt_LOGMARK in xtables-addons. Or, you just use `conntrack -L`=20
if you need it decoupled from the ruleset.

