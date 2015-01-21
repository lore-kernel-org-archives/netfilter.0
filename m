From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Wed, 21 Jan 2015 04:01:18 +0200
Message-ID: <54BF086E.5080906@ngtech.co.il>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Niggemann <jn@hz6.de>

On 19/01/2015 15:04, Jan Niggemann wrote:
> Machine
> Lenovo T400, Debian 7.8

As in a desktop?
Can you show the lsmod output?
I am not quite sure how the INPUT should be related directly to the GRE 
since the origin of the GRE(if I remember right) is from the client side 
and not the server side.

Eliezer

