From: Jason Opperisano <opie@817west.com>
Subject: Re: A DNAT question.
Date: Sun, 06 Feb 2005 14:08:33 -0500
Message-ID: <1107716913.4679.7.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.58.0502051918500.6532@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0502051918500.6532@linux>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 2005-02-05 at 18:22, Ted Gervais wrote:
> I am new to this list and to iptables generally.
> 
> I have a line I am trying to translate into a current iptables line that
> will work in my firewall.
> 
> ' DNAT net loc:192.168.0.147 udp 5198,5199 '

if can you tell us in english what that line does, we can probably
translate it into an iptables rule for you.

> If anyone could venture a thought as to how that might be translated into
> a current iptables statement I would really appreicate it.
> 
> I have tried - iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp
> --dport 5198:5199 -j DNAT --to 192.168.0.147

that line says, packets arriving inbound to eth0 with destination IP
192.168.0.1 and destination TCP port 5198-5199 will have their
destination IP translated to 192.168.0.147 and the destination port will
not be translated.

after writing that out--your rule that you're trying to translate
specified protocol UDP; whereas your iptables rule uses TCP--maybe
that's the problem?

> That doesn't appear to work so obviously I have not interpreted that line
> correctly..

keep in mind that once the packet is translated in the nat table, it
still passes through the filter table, and will require a rule in filter
to allow it through.

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
	--The Simpsons


