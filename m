From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Static Internal to public IP mapping, and ARP difficulties
Date: Tue, 21 Sep 2004 13:12:47 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040921121247.GO3786@metastasis.org.uk>
References: <1095620211.3098.4.camel@jabbera-laptop>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1095620211.3098.4.camel@jabbera-laptop>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Sep 19, 2004 at 06:56:50PM +0000, Michael Barry wrote:
> Sorry for the DUPE, but I forgot a subject line in my last message. I am
> sort of frazled trying to figure this out.

Bah, by the looks of it it's only early evening in your local time, wait
until after midnight :)

> I have a bunch of public IP addresses, for example, in the range
> 192.168.1.100-192.168.1.104. 
> 
> I have a 5 computers on my internal network statically defined from
> 192.168.0.100-192.168.0.104. 
> 
> I am trying to create a rule where each computer will always map to the
> same public ip address. For example I did: iptables -t nat -s
> 192.168.0.100 -j SNAT --to-source 192.168.1.100. 
> 
> The problem is if I try to do a ping from 192.168.0.100 it correctly
> gets translated to 192.168.1.100 and the ping goes out, but when the
> reply comes back there is an ARP request for WHO-HAS 192.168.1.100, and
> since no-one technically holds this address no reply is ever sent, and
> the ping reply gets dropped. Does anyone know a solution to this
> problem?

Yes, the best explanation is from the ubiqutous Jason Opperisano:

http://msgs.securepoint.com/cgi-bin/get/netfilter-0409/31/1.html

Use "ip addr" to set up the alias on your Internet facing interface, as
you're getting the arp requests it looks like everything else - i.e.
routing, is already set up.  So once the aliases are in this *should*
work...

-- 
mors omnia vincit

