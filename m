From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Too many ARP entries and Re: sendto: No buffer space available
Date: Tue, 3 Dec 2002 17:54:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021203175451.J14289@funkyjesus.org>
References: <571705138.20021202111645@pobox.com> <14127620470.20021202182836@pobox.com> <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net> <875890239.20021203122724@pobox.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <875890239.20021203122724@pobox.com>; from andre.correa@pobox.com on Tue, Dec 03, 2002 at 12:27:24PM -0200
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Dec 03, 2002 at 12:27:24PM -0200, andre.correa@pobox.com wrote:

> root@linuxbox:~# tcpdump -i eth1 | grep arp
> tcpdump: listening on eth1
> Dec  3 11:16:52 linuxbox kernel: device eth1 entered promiscuous mode

<snip>

> 11:17:10.390134 arp reply 204.152.184.64 is-at 0:2:b9:1d:db:41
> 11:17:10.640043 arp who-has 200.225.157.104 tell linuxbox
> 11:17:10.640967 arp reply 200.225.157.104 is-at 0:2:b9:1d:db:41
> 11:17:10.689240 arp who-has 200.225.157.165 tell linuxbox
> 11:17:10.690768 arp reply 200.225.157.165 is-at 0:2:b9:1d:db:41
> 11:17:10.893170 arp who-has 200.225.157.163 tell linuxbox
> 11:17:10.894088 arp reply 200.225.157.163 is-at 0:2:b9:1d:db:41
> 11:17:10.980746 arp who-has 200.225.157.167 tell linuxbox
> 11:17:10.981714 arp reply 200.225.157.167 is-at 0:2:b9:1d:db:41
> 11:17:11.504255 arp who-has a.gtld-servers.net tell linuxbox
> 11:17:11.505926 arp reply a.gtld-servers.net is-at 0:2:b9:1d:db:41
> 
> 2183 packets received by filter
> 0 packets dropped by kernel
> 
> We   see   my   linux  box  asking  for MAC addresses of hosts outside
> its "local" network and my gateway, a Cisco 2621 answering those
> broadcasts with its own MAC address.

Yes, very peculiar.  Your linuxbox appears to think the Internet is one big
switched network :)

What does 

netstat -rn give you?

> For  what  I know, both are doing wrong. My box is not supposed to ask
> for those MACs and the Cisco is not supposed to answer.

Yes.  Weren't you using PPPoE or similar?  Not familiar with that at all but
that might be related.

> Does anybody have seen these before or have any ideas what would cause
> it?

Out of interest, where have you looked for answered to this problem? 
Looking for overflowing arp tables via www.google.com or similar might give
you the answers you need.

-- 
FunkyJesus System Administration Team


