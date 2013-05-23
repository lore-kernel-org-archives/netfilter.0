From: Jeff Wiegley <jeffw@csun.edu>
Subject: Re: marking/mangling of local packets for altering routes?
Date: Thu, 23 May 2013 10:39:41 -0700
Message-ID: <519E545D.9050500@csun.edu>
References: <519D1CCF.2030707@csun.edu> <FE275ABF-CAB1-4F7B-9287-E781D6684C67@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FE275ABF-CAB1-4F7B-9287-E781D6684C67@me.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bryan Harris <bryanlharris@me.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 5/22/2013 1:22 PM, Bryan Harris wrote:
> On May 22, 2013, at 3:30 PM, Jeff Wiegley <jeffw@csun.edu> wrote:
>
>> I'm trying to do to some service based routing using the "ip rule" and "ip route"
>> by marking packets.
> Is this what you mean?  Sorry if I misunderstood.
>
> echo "2 myGreatTable" >> /etc/iproute2/rt_tables
> iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1
> ip rule add fwmark 1 table myGreatTable
> ip route add default via 192.168.1.1 dev eth1 table myGreatTable
>
> Bryan
>
>

Yes. that is the sort of thing I am trying to do. My confusion was that 
locally generated
packets would not be subjected to the added rule and route because the 
routing decision
was made before the PREROUTING chain of the mangle table is applied.

However, As Jaff Haran pointed out: In Table 6-2 of 
http://www.iptables.info/en/structure-of-iptables.html
there is a second routing decision that is made after the mangle and nat 
PREROUTING chains have
been processed. I missed that line in all my reading. It guarantees that 
if the locally generated
packets are mangled PREROUTING that another routing decision is made for 
them and they will,
as desired, be affected by the sort of marking and rules/route that you 
have kindly provided.

Thank you!

- Jeff

