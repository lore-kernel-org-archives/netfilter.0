From: Michael Ludvig <mludvig@logix.net.nz>
Subject: Re: ipset hash:ip,port not matching
Date: Tue, 25 Jun 2013 21:05:59 +1200
Message-ID: <51C95D77.9060405@logix.net.nz>
References: <51C9371E.8020305@logix.net.nz> <alpine.DEB.2.00.1306250937500.12575@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1306250937500.12575@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On 25/06/13 19:40, Jozsef Kadlecsik wrote:
> On Tue, 25 Jun 2013, Michael Ludvig wrote:
>
>> ~ # iptables -I INPUT -m set --match-set test-ipport dst -j LOG
>> --log-prefix "IPSET(test-ipport,dst): "
>> ~ # iptables -I INPUT -m set --match-set test-ipport src -j LOG
>> --log-prefix "IPSET(test-ipport,src): "
> In the rules above you specified a single direction flag for a two 
> dimensional set, thus the matching returned "false". If in the first rule 
> the port is the destination, then it should be:
>
> iptables -I INPUT -m set --match-set test-ipport dst,dst -j LOG ...

Thanks! I didn't know I'm supposed to specify the direction for each
dimension of the set. That actually makes it quite flexible.

Is it possible to make iptables fail when there are not enough src's and
dst's in the command? To let users know there's something wrong.

Cheers

Michael
