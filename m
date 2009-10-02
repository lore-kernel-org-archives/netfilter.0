From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Using iptables with high volume mail
Date: Fri, 02 Oct 2009 17:08:13 +0200
Message-ID: <4AC6175D.4020600@unipex.it>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com>  <1254412984.11386.63.camel@enterprise.ims-firmen.de>  <4AC4DB93.6060707@freemail.hu>  <900981.20015.qm@web53108.mail.re2.yahoo.com> <1254486676.19832.20.camel@enterprise.ims-firmen.de> <150303.95092.qm@web53112.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <150303.95092.qm@web53112.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Little <jlittle_97@yahoo.com>
Cc: Thomas Jacob <jacob@internet24.de>, =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@vger.kernel.org

John Little wrote:
>> What matters most is what happens in each time slice, not so much
>> how many connections you have in the connection hash table (you can
>> tune that table with with
>> /proc/sys/net/ipv4/netfilter/ip_conntrack_max and
>> /sys/module/ip_conntrack/parameters/hashsize).
>> 

Except that if the table fill up you'll see some "table full" kernel
messages and the connections will be refused!

>> However, emails per time should be pretty much the same as
>> connections per time, unless you open several tcp connections over
>> the nat box for each email, and I see no reason why you would need
>> to do that ;)
> 
> We have some stats now:
> Packets per second:  avg 6221 max 41,810
> Connections peak: avg 7263  max 22,981
> 
> New connections per second: avg 102 max 1029

> If I allocate 500 bytes per connection at the max
> connections I would need ~87Mb + machine overhead.  That's not much
> in today's world of servers.


Only for add some real numbers that hope pacify your heart, with the
lnstat tool (lnstat -f ip_conntrack) I have here:

100k entries into ip_conntrack, about 700 new conn/sec, 8k iptables
rules, 0.5/0.8 cpu load, with a xeon 4 cores and 2 gb ram and e1000e
card and no problems at all.
The unique think that I can say you to do with this cards it's to
_update_ the drivers with the last one found on the site because that on
the kernel vanilla aren't so stable and can (who say for sure?) *oops*
your server.

> Thanks, John
> 

Michele
