From: Patrick McHardy <kaber@trash.net>
Subject: Re: SNAT with ipsec => return packets not de-natted
Date: Wed, 04 Nov 2009 13:27:21 +0100
Message-ID: <4AF17329.7010506@trash.net>
References: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>	 <a906663d0911022254w6642c66aw17b9609624086a36@mail.gmail.com> <a906663d0911031105g1f8a8a27o67cf77ab5fe73e54@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a906663d0911031105g1f8a8a27o67cf77ab5fe73e54@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jari Laurila <jari.laurila@gmail.com>
Cc: netfilter@vger.kernel.org

Jari Laurila wrote:
> On Tue, Nov 3, 2009 at 8:54 AM, Jari Laurila <jari.laurila@gmail.com> wrote:
>> Don't anyone have any clues for the problem I sent to the list on sunday?
>>
>> I find it really strange that decrypted packets coming from ipsec
>> tunnel with destination address xx.xx.xx.42 are sent through interface
>> ext1 even though ip -s route get xx.xx.xx.42 says that packet should
>> go through interface ext0b. Ipsec tunnel itself is going through
>> inteface ext1 but shouldn't packets get routed after they come from
>> tunnel? I even tried to look at kernel code to figure out why this
>> happens but I don't know enough about kernel and my c skills are a bit
>> lacking, so I couldn't find the cause.
>>
> 
> Update Netfilter sees packet at mangle table in PREROUTING chain (I
> added LOG rule), but nat table does not see the packet.
> 
> I also have fwd policy defined for the connection in question:
> 
> src srcip.srcip.srcip.secip/32 dst dstip.dstip.dstip.42/32
>         dir fwd priority 0
>         tmpl src gwip.gwip.gwip.gwip dst remgw.remgw.remgw.remgw
>                 proto esp reqid 0 mode tunnel

Try adding a TRACE rule to see how the packet traverses the netfilter
hooks.
