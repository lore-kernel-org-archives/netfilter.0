From: Jason Opperisano <opie@817west.com>
Subject: Re: R: Difference between arp proxy and dnat?
Date: Wed, 06 Oct 2004 18:41:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097102510.1716.24.camel@wolfpack.ljm.dom>
References: <414B19D30080BB4A@vsmtp12.tin.it> (added by postmaster@virgilio.it)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <414B19D30080BB4A@vsmtp12.tin.it> (added by
	postmaster@virgilio.it)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-10-06 at 17:21, mlist@libero.it wrote:
> Hi Daniel and John.
> 
> Before all I thank you for this good explanation because I think it will be
> very useful not only for me.
> Unfortunately I still have some things not complitely clear about proxy arp
> and DNAT. Because I'm not a network guru like you, I kindly ask you to
> follow my speech and explain what is wrong in my understanding.
> 
> 1) Actually I have Checkpoint firewall one (4.1) running on NT.
> My firewall is like this:
> 
>                          internet
>                              |
>                              |
>                          (2.2.2.9)
> 192.168.0.x(dmz)---------checkpoint
>      |         |             |
>   public     public          |
>  web srv     ftp srv        lan
> 192.168.0.5  192.168.0.7   172.16.100.x
> 
> I have 16 public ip and, to provide public access to my servers
> (192.168.0.x) in dmz, I use Checkpoint proxy arp future (explained through a
> step by step guide for dummies people like me in this document:
> http://www.giac.org/practical/GSEC/Eugene_Ng_GSEC.pdf)
> Supposing I would map 2.2.2.10 to 192.168.0.5 I must:
> a) modifify c:\winnt\fw1\4.1\state\local.arp adding entry like this:
> IP ADDRESS		MAC ADDRESS OF EXT INTERFACE
> 2.2.2.10		08-00-20-76-ea-77
> this will allow any packets destined for 2.2.2.10 to be "routed" to our
> firewall. The router sees that the firewall's MAC address is listening for
> packets with ip address of both 2.2.2.10 and 2.2.2.9

this is a hack that check point came up with to deal with that fact that
NT 4.0 is incapable of publishing an arp entry.  the linux 2.4+
equivalent would be to add an IP alias to your external interface for
each "Static NAT" IP:

ip address add 2.2.2.10 dev eth0
(where eth0 is your external interface)

> b) reinstall the policy
> c) Once the ip addresses have successfully been routed to the firewall,
> a final change must be made on the firewall itselt. A static route
> will need to be added to pass the request onto an internal ip
> address. In our example, the static route will be:
> route add 2.2.2.10 mask 255.255.255.255 192.168.0.5 -p

again--hack.  don't base your understanding of networking on how check
point tried to overcome windows IP stack limitations, and their own
sub-optimal NAT implementation (they translate destination addresses
post-routing in 4.1).

after adding the IP alias, you will create a DNAT rule that will
translate the external IP to an internal IP:

iptables -t nat -A PREROUTING -i eth0 -d 2.2.2.10 \
  -j DNAT --to-destination 192.168.0.5

...no static route necessary.

if you want communications initiated by 192.168.0.5 to be translated to
2.2.2.10 as well:

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.5 \
  -j SNAT --to-source 2.2.2.10

will make things nice and symmetrical.

> Now....and finally....^_^
> Are corrected the following affirmations? If not PLEASE CORRECT them with a
> brief explanation
> a) Proxy arp is a technique used by most firewall producers and its
> functionality is similar to that explained above (Checkpoint)

proxy arp is an over-used term that means different things when used by
different vendors.  true proxy arp has to do with a bridging a single
layer 3 network back together after segmenting it with a bridging
firewall as has been explained by others in this thread.  the check
point kludge is more accurately called a "published static arp entry."

> b) To map public ip address to private ip address, with LINUX you can use
> DNAT or PROXY ARP while others commercial products, generally offers only
> proxy arp (except those based on linux, like Astaro security linux).
> Technically speaking DNAT and PROXY arp aren't the same, but, in order to
> provide mapping (public to private) the result is the same.

the point of all this is to make the firewall receive the packets at
layer 2 so that layer 3 attributes can be modified and the packet can be
routed on to its final destination.  it's all just a means to an end.

i'd be remiss in my posting if i didn't make my obligatory reference to
the fact that understanding the OSI model makes all this make sense...

-j

-- 
Jason Opperisano <opie@817west.com>


