From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: IPSET persistence on Ubuntu 16.04
Date: Mon, 15 Jan 2018 10:36:38 +0200
Message-ID: <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
References: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver O'Boyle <oliver.oboyle@gmail.com>, netfilter@vger.kernel.org


On 12/01/2018 23:20, Oliver O'Boyle wrote:
> Hello,
> 
> Just started using IPSet on Ubuntu 16.04. After reboot, my set
> disappeared and my ip6tables config vanished, leaving my fw wide open
> with default rules. OUCH.
> 
> What's the proper way to do IPSet persistence on Ubuntu 16.04?
> 
> Oliver
> 

either create a script that you call from /etc/network/interfaces ie

up /full/path/script

that has your ipset commands

or just put the ipset stuff into interfaces file

auto eth0
iface eth0 inet static
	address x.x.x.x
	netmask x.x.x.x
	up ipset xxxxxx
	up ipset xxxxxx


-- 
Thank you,

Mark Adrian Coetser
mark@pkfnet.co.za

What causes the mysterious death of everyone?
