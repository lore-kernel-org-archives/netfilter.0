From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack -E problem
Date: Tue, 21 Apr 2009 12:56:56 +0200
Message-ID: <49EDA678.2010907@netfilter.org>
References: <3e67fcb10904200801g76ccdea8jde758f5f5c3a6276@mail.gmail.com>	 <49EC92AB.6060807@freemail.hu> <3e67fcb10904200915y6d2cdf0dw9c634d7fc31b1a6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e67fcb10904200915y6d2cdf0dw9c634d7fc31b1a6d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paddie O'Brien <paddieobrien@gmail.com>
Cc: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@vger.kernel.org

Paddie O'Brien wrote:
>> Just a question:
>> Why would you track unsuccessful connections?
>> If a connection ATTEMPT is unsuccessful then there is no CONNECTION -> so
>> there is nothing to track about....
> 
> I want to know who on our wireless network at work
> is attempting to connect to my machine.
> 
> My (shaky) understanding was that with conntrack I would
> get a NEW event for any inbound first packet irrespective
> of whether it led to the creation of an ESTABLISHED
> connection or not.

No, at least the first packet must succesfully go through the whole
firewall code, otherwise it is not logged by the conntrack code.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
