From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: how to discard a netfilter rule
Date: Thu, 28 Feb 2013 15:37:55 +0100
Message-ID: <512F6BC3.3000307@sterenborg.info>
References: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Donghua Liu <liudonghua123@gmail.com>
Cc: netfilter@vger.kernel.org

On 02/28/2013 07:26 AM, Donghua Liu wrote:
> Hi,
>
> Say if I set a netfilter rule by "iptables -t nat -A custom_chain -p
> tcp -dport 80 -j DNAT --to-destination 127.0.0.1:1234" for some
> requirement.
>
> I also have a LKM which will check the availablity of service
> "127.0.0.1:1234" and how can I cancel the rule's operation(Do NOT
> delete this rule), let the packet go as usual ignore the nat.

man iptables says there is a -R command to replace rules:

----
        -R, --replace chain rulenum rule-specification
               Replace a rule in the selected chain.  If the source 
and/or destination names resolve to multiple addresses, the command will 
fail.  Rules are numbered starting at 1.
----

Assuming you know which rulenum must be changed, you can do this:

iptables -t nat -R custom_chain 1 -p tcp -dport 80

IOW, lose the -j parameter from the rule, keeping the others. The result 
is that the rule will still be there, but effectively won't do anything 
except for matching and updating packet/byte counting.


--
Rob

