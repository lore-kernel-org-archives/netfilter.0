From: Neal Becker <ndbecker2@gmail.com>
Subject: RE: policy based routing question
Date: Thu, 06 Dec 2007 06:33:03 -0500
Message-ID: <fj8mlf$9ia$1@ger.gmane.org>
References: <fj7m77$n14$1@ger.gmane.org> <BAY119-W11F48CE40651F810C15CBD66F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: fedora-list@redhat.com

Andrew Kraslavsky wrote:

> 
>> I'm interested in implementing policy based routing on a system with
>> multiple interfaces. I'd like to use some kind of classifier to determine
>> the type of traffic associated with a packet. I know iptables/mark + ip
>> route can be used to classify packets by port #, but that isn't always
>> sufficient.
>>
> 
> Perhaps I have misunderstood your question but...all of the matches that
> are valid/meaningful in the mangle table's PREROUTING chain are at your
> disposal!
> 
> For example, assuming you define advanced routing rules that use mark 0x01
> for your primary interface and mark 0x02 for your secondary interface and
> you wanted all outgoing HTTP traffic fron local subnet 192.168.10.0/24 to
> go out your primary interface and you wanted all outgoing HTTP traffic
> from local subnet 192.168.20.0/24 to go out your secondary interface you
> could use:
> 
> iptables -t mangle -A PREROUTING -s 192.168.10.0/24 -p tcp --dport 80 -j
> MARK --set-mark 0x01 iptables -t mangle -A PREROUTING -s 192.168.20.0/24
> -p tcp --dport 80 -j MARK --set-mark 0x02
> 
> The appropriate matches to use would of course depend on what your
> interests are (classify by source IP address? source MAC address? input
> interface? destiantion port? etc...).
> 
> Putting it another way, beyond port number and the examples listed above
> or all that is covered on the iptables man page, what kind of
> classification are you after?
> 

Having done a bit more research, I think what I'm interested in is L7.  Now
what I'm trying to figure out is what is needed for L7 userspace on fedora
f8 kernel.

I have kernel-2.6.23.8-63.fc8.x86_64.  According to
http://l7-filter.sourceforge.net/HOWTO-userspace
I need to figure out if fedora f8 kernel has "Layer 3 Dependent Connection
tracking (OBSOLETE)".  Looking
in /lib/modules/2.6.23.8-63.fc8/build/.config I don't see anything that
obviously corresponds to this.

If I just try anyway, it doesn't seem to work:
sudo /sbin/modprobe -v ip_conntrack_netlink
insmod /lib/modules/2.6.23.8-63.fc8/kernel/net/ipv4/netfilter/nf_nat.ko 
insmod /lib/modules/2.6.23.8-63.fc8/kernel/net/netfilter/nf_conntrack_netlink.ko 
[nbecker@nbecker1 l7-filter-userspace-v0.4]$ /usr/bin/l7-filter --help

                      ***WARNING***
The ip_conntrack_netlink module does not appear to be loaded.
Unless you have it compiled into your kernel, please load it
and run l7-filter again.




