From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 13:51:04 -0500
Message-ID: <201501221351.04784.neal.p.murphy@alum.wpi.edu>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54C0CC79.3010001@chello.at> <54C119E4.1050208@ngtech.co.il>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C119E4.1050208@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, January 22, 2015 10:40:20 AM Eliezer Croitoru wrote:
> Hey,
> 
> The way iptables rules are working is "first match" so in the case of an
> ACCEPT rule it will only be ACCEPTED if it matches the rule else it will
> try the next rule.
> Always there was a need to add two rules to match an ESTABLISHED,RELATED.
> 1 - For the NEW state
> 2 - For the ESTABLISHED,RELATED
> 
> As long these rules are there with an ACCEPT target it will always be fine.
> 
> The main consideration is what will be faster to match from the two?
>  From what I have seen until now FW rules usually have an
> ESTABLISHED,RELATED rule first and then the other NEW rules.
> 
> If it's right to "hijack" the thread for this particular case:
> Which is better to be first?

There are far more EST/REL packets than there are NEW. The sooner you deal 
with the former, the fewer CPU cycles you'll waste handling packets you know 
will not and cannot match rules. For example:
----
-A FORWARD -s 192.0.2.0/24 -j tndrop
-A FORWARD -d 192.0.2.0/24 -j tndrop
-A FORWARD -s 198.51.100.0/24 -j tndrop
-A FORWARD -d 198.51.100.0/24 -j tndrop
-A FORWARD -s 203.0.113.0/24 -j tndrop
-A FORWARD -d 203.0.113.0/24 -j tndrop
-A FORWARD -i ppp0 -j ipblock
-A FORWARD -i ippp0 -j ipblock
-A FORWARD -i eth3 -j ipblock
-A FORWARD -j timedaccess
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
 .
 .
 .
----
First deal with packets that are always blocked or may be blocked depending on 
the current time. REL/EST that get past that are accepted. The remainder are 
NEW and can be handled as slowly and excruciatingly as desired. Of course, you 
DROPped INVALID packets very early, in mangle:PREROUTING; it isn't worth 
wasting even one extra CPU cycle to process those since netfilter has no idea 
why it received them and has no idea what to do with them. "Thentuwion! Thwow 
it to the gwound!"
