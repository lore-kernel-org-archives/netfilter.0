From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools: conntrack -L --> Operation failed: Connection
 	refused
Date: Thu, 24 Dec 2009 00:10:36 +0100
Message-ID: <4B32A36C.5090703@netfilter.org>
References: <875a14c20909010630s7500ca60hcb9084641a338211@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <875a14c20909010630s7500ca60hcb9084641a338211@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?windows-1252?Q?Micha=3F_Sewera?= <michal.sewera@gmail.com>
Cc: netfilter@vger.kernel.org

Micha? Sewera wrote:
> Hi,
> 
> I'm using the conntrack-tools Version 0.9.4 and linux kernel version
> 2.6.23. I've installed libnetfilter_conntrack and libnfnetlink, but
> for conntrack -L command I have following error:
> 
> / # conntrack -L
> Operation failed: Connection refused
> 
> For conntrack -E I have:
> 
> / # conntrack -E
> conntrack v0.9.4: Can't open handler
> 
> Does anyone know what could be the issue ?

That version is from the stone age, please upgrade.
