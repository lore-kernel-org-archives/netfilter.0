From: Jason Opperisano <opie@817west.com>
Subject: Re: destination port rewrite
Date: Fri, 10 Jun 2005 15:11:24 -0400
Message-ID: <20050610191124.GA6497@bender.817west.com>
References: <53625.209.208.196.163.1118337274.squirrel@www.uscitizensalliance.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <53625.209.208.196.163.1118337274.squirrel@www.uscitizensalliance.org>
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

On Thu, Jun 09, 2005 at 01:14:34PM -0400, tech@uscitizensalliance.org wrote:
> Hi Everyone,
> I have a somewhat unusual requirement here. Please let me know if it is
> not clear enough.
> 
> >From inside a firewall connected to the internet on outside, I would like
> for all outgoing packets that their destination ports be rewritten in
> addition to being natted.
> 
> 
> e.g
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 --dport=8080 \
>          -j SNAT -o eth0 --to-source $external_ip --dport=80.

close--mapping the destination port is the job of DNAT, not SNAT:

  # map requests to tcp port 8080 to port 80
  iptables -t nat -A PREROUTING -i $INSIDE_IF -p tcp -s 192.168.0.0/24 \
    --dport 8080 -j DNAT --to :80

  # snat outbound packets
  iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 \
    -j SNAT --to-source $external_ip

-j

--
"Peter: It's OK, Meg. Your mom is full of Christmas cheer and enough
 tranquilizer to take down an elephant."
        --Family Guy

