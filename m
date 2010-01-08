From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Fri, 08 Jan 2010 17:40:10 +0100
Message-ID: <4B475FEA.9050601@chello.at>
References: <4B46323E.1050106@gmail.com> <4B4707EA.9010301@chello.at> <4B4758C2.7050607@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4758C2.7050607@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 08.01.2010 17:09, MargoAndTodd wrote:
>>> It is the "--sport $unassgn --dport $unassgn" that is killing me.
>>> How do I restrict the last three to just passive mode ftp?
>>>
> 
> On 01/08/2010 02:24 AM, Mart Frauenlob wrote:
>> use the 'helper' match extension. i.e: -m helper --helper ftp.
>> if you need to distinguish between active and passive, you still can use
>> the port and state matches for that.
> 


> Can you point me to the directions/manual for the
> "-m helper --helper ftp" so I can figure out what
> exactly it is doing and how to install it?
> 
> Many thanks,
> -T

iptables -m helper -h

man iptables

find /lib/modules/ -name '*helper*' -exec modinfo '{}' \;

http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#HELPERMATCH


if your iptables / kernel don't have support for the helper match ->
time to upgrade!?

regards

Mart
