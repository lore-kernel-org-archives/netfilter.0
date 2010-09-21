From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to log NAT translations
Date: Tue, 21 Sep 2010 11:45:22 +0200
Message-ID: <4C987EB2.4000001@netfilter.org>
References: <4C8FAFDF.9080201@dcc.ufba.br> <alpine.LNX.2.01.1009141953580.23103@obet.zrqbmnf.qr> <4C981789.3070004@dcc.ufba.br> <alpine.LNX.2.01.1009211125320.30840@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009211125320.30840@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Italo Valcy <italo@dcc.ufba.br>, netfilter@vger.kernel.org

On 21/09/10 11:26, Jan Engelhardt wrote:
> On Tuesday 2010-09-21 04:25, Italo Valcy wrote:
> 
>> Actually, I wanna something more simple and specific than the command
>> above. Using 'conntrack -E', I still have to parse the package events
>> NEW, UPDATE and DESTROY if I wanna know the  of a NAT
> 
> So use `conntrack -Ee NEW` to limit the output :)
> If that is still too much overhead, I'm sure you can directly use
> libnetfilter_conntrack's library interface to get at these events.

You can refine this a bit more with:

`conntrack -Ee NEW --any-nat'

It was introduced in conntrack-tools-0.9.15.
