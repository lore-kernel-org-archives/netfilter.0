From: "TinyApps.Org" <miles@tinyapps.org>
Subject: Re: Question about /etc/iptables.down.rules
Date: Sun, 26 Aug 2007 22:01:21 -1000
Message-ID: <F4B37970-02BE-4A40-B9E3-1BE5B7D5AAEF@tinyapps.org>
References: <1224801D-F4F1-40D1-8C8C-94C14C3C38EC@tinyapps.org>
	<1188201131.13621.3.camel@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1188201131.13621.3.camel@localhost.localdomain>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="koi8-r"; delsp="yes"; format="flowed"
To: casper@meteor.dp.ua
Cc: netfilter@lists.netfilter.org

Thanks for your reply, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF! (I hope that =
is the correct name =20
to use.)
My reply is at the bottom of this message:

>> I understand that it is best to setup a set of rules to be applied
>> when the network interface is down, saving it to:
>>
>>   /etc/iptables.down.rules
>>
>> and applying in /etc/network/interfaces via:
>>
>> post-down iptables-restore < /etc/iptables.down.rules
>>
>> What should this set of rules look like? The exact opposite
>> of /etc/iptables.up.rules ? Or just a simple flush command?
>> Or something else altogether?
>
> You can do a simple flush, but this is not required, since all rules
> will be overwritten by iptables-restore when you bring network =20
> interface
> up next time.

I had stumbled across the following comment:

"But to do this really clean, we need to have a script that removes =20
the rules as well for when the interface goes down. Just to make sure =20=

the rules are never added twice."

on this site:
http://my.opera.com/Jada0007/blog/show.dml/1213354

and therefore wondered if there were ever a case in which
the rules could be applied twice... by creating a /etc/=20
iptables.down.rules
file, I hoped to avoid such a possibility.

Sincerely,

Miles


