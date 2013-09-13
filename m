From: Alexis Salinas <alexis.salinas@inmotiontechnology.com>
Subject: RE: clarification on the use of --state parameter within  conntrack
 command
Date: Fri, 13 Sep 2013 17:55:09 +0000
Message-ID: <FC9EDC96CA021943AB23AE4C96151F620DC517@van-mail14-n4.exchange.electric.net>
References: <FC9EDC96CA021943AB23AE4C96151F620DC4D5@van-mail14-n4.exchange.electric.net>,<20130913174546.GA903@linuxace.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130913174546.GA903@linuxace.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Phil Oester <kernel@linuxace.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks Phil, that works.
And to your knowledge is there a way to do something similar with UDP. Like to filter the entries in UNREPLIED state?

Alexis.
________________________________________
From: Phil Oester [kernel@linuxace.com]
Sent: September 13, 2013 10:45
To: Alexis Salinas
Cc: netfilter@vger.kernel.org
Subject: Re: clarification on the use of --state parameter within  conntrack command

On Fri, Sep 13, 2013 at 05:00:17PM +0000, Alexis Salinas wrote:
> Hi All,
> Could someone help me understand the correct use of the protocol filter parameter "--state". I figure it would be something like this " conntrack -L -p TCP --state ESTABLISHED" but 2 different versions of conntrack-tools give the same error (conntrack v1.2.1 (conntrack-tools): unknown option `--state'
> Try `conntrack -h' or 'conntrack --help' for more information.)

Don't capitalize the protocol.

    conntrack -L -p tcp --state SYN_SENT

Phil
