From: Jason Opperisano <opie@817west.com>
Subject: Re: dnat ouside/inside
Date: Tue, 1 Feb 2005 13:55:15 -0500
Message-ID: <20050201185515.GA29812@bender.817west.com>
References: <20050201183225.GA5042@micron.lacnic.net.uy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050201183225.GA5042@micron.lacnic.net.uy>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Feb 01, 2005 at 04:32:25PM -0200, Pablo Allietti wrote:
> hi all. i have this problem. this dnat rules work perfectly from outside
> networks example . from a cybercafe, my home and all of outside network.
> 
> but when i connect my computer insede the lan 192.168.1.x this rules
> dont working is any way to use this rules in the same network?
> 
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 110  -j DNAT
> --to-destination 192.168.1.143
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
> --dport 110  -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25  -j DNAT
> --to-destination 192.168.1.143
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
> --dport 25  -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 995  -j DNAT
> --to-destination 192.168.1.143
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
> --dport 995  -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 465  -j DNAT
> --to-destination 192.168.1.143
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.143
> --dport 465  -j ACCEPT

i've gotten out of the business of writing this email--my last known
foray is available at:

http://marc.theaimsgroup.com/?l=netfilter&m=110571844432115&w=2

-j

PS - all your nat PREROUTING rules specify "-i eth0" yet all your
     FORWARD rules specify "-i eth1" so they won't ever match the same
     packets...just an observation.

--
"Look, just give me some inner peace, or I'll mop the floor with ya!"
        --The Simpsons

