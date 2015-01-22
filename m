From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 17:40:20 +0200
Message-ID: <54C119E4.1050208@ngtech.co.il>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54BF086E.5080906@ngtech.co.il> <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de> <54BFB8A3.7090504@chello.at> <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de> <54C03496.30504@plouf.fr.eu.org> <20150122085533.Horde.1veF0V8pZQJDW8PLl5XdsA9@htjn.suhail.uberspace.de> <54C0CC79.3010001@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <54C0CC79.3010001@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hey,

The way iptables rules are working is "first match" so in the case of an 
ACCEPT rule it will only be ACCEPTED if it matches the rule else it will 
try the next rule.
Always there was a need to add two rules to match an ESTABLISHED,RELATED.
1 - For the NEW state
2 - For the ESTABLISHED,RELATED

As long these rules are there with an ACCEPT target it will always be fine.

The main consideration is what will be faster to match from the two?
 From what I have seen until now FW rules usually have an 
ESTABLISHED,RELATED rule first and then the other NEW rules.

If it's right to "hijack" the thread for this particular case:
Which is better to be first?

Eliezer

On 22/01/2015 12:10, Mart Frauenlob wrote:
> Hello,
>
> the way I understand the change is:
> you need to add an according iptables rule for the first state NEW
> packet, which will then load the according conntrack helper
> automatically. So further packets are classified as ESTABLISHED or RELATED.
> There is no mechanism of unloading a module once it has been loaded afaik.


