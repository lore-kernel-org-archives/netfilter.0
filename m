From: Jason Opperisano <opie@817west.com>
Subject: Re: [Fwd: Server machines behind Firewall]
Date: Fri, 7 Jan 2005 10:27:55 -0500
Message-ID: <20050107152755.GA49@bender.817west.com>
References: <41DEA59E.F63D5C97@ita.org.mo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41DEA59E.F63D5C97@ita.org.mo>
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

On Fri, Jan 07, 2005 at 11:07:10PM +0800, edwardspl@ita.org.mo wrote:
> > EXT_IF="eth0"
> > INT_IF="eth1"
> > SRV1="10.1.1.10"
> >
> > iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 \
> > ? -j DNAT --to-destination $SRV1
> 
> I want to know why needn't to define the original IP ( Public IP ) ?
> eg :
> 
> iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -s 202.175.xxx.xxx --dport
> 80 \
> ? -j DNAT --to-destination 192.168.xxx.xxx

you can; if the original, public IP is different from the firewall's
external IP.  if you want specify the original DESTINATION of the
packet, you would use "-d" not "-s" like so:

  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d $PUB_IP \
    --dport 80 -j DNAT --to-destination $SRV1

> Sorry, what useful about the following function ( command line ) ?
> 
> > iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> > ? --dport 80 -j ACCEPT

um--it allows the packet through the FORWARD chain of the filter table.
remember--you're trying to build a firewall here.

> In additional, if I want to setup a NAT ( 192.168.101.0/24 ) with a Server
> machines ( 192.168.100.1 ) behind Firewall...
> So, is there more than one sample ( nat scripts ) for reference ?

go read everything linked from the netfilter home page in the docs
section:

  http://netfilter.org/documentation/index.html

-j

--
"Dear Mr. President, there are too many states nowadays, please
 eliminate three. I am not a crackpot."
        --The Simpsons

