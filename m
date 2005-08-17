From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting packet from incoming external interface to a
 different external machine.
Date: Wed, 17 Aug 2005 00:03:10 -0500
Message-ID: <4302C50E.7020408@riverviewtech.net>
References: <1374867BD86E3748B9FB02AC5EDE4282C61A73@gimi-fs1.gimi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1374867BD86E3748B9FB02AC5EDE4282C61A73@gimi-fs1.gimi.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i ${ExternalInterface} -d ${ExternalInterfaceIP} -p tcp --dport 21 -j DNAT --to-destination ${DestinationServerIP}:3805
iptables -t nat -A POSTROUTING -o ${ExternalInterface} -d ${DestinationServerIP} -j SNAT --to-source ${ExternalInterfaceIP}
iptables -t filter -A FORWARD -i ${ExternalInterface} -o ${ExternalInterface} -d ${DestinationServerIP} -j ACCEPT
iptables -t filter -A FORWARD -i ${ExternalInterface} -o ${ExternalInterface} -s ${DestinationServerIP} -j ACCEPT

These rules should do exactly what you are wanting.  However I'm betting that because you are talking about port 21 there is a chance that you are dealing with FTP.  If that is indeed the case you will need to be careful what you do with the other ports that FTP opens as they may not pass through the system the same way.



Grant. . . .

Jeffrey Carter wrote:
> Here is what I'm looking to do (And please tell me if I'm crazy as I've
> been beating my head on this for a week)
> 
> I'm looking to take a packet that is incoming on my machine, on port 21
> and redirect it to port 3805 on a completely different external machine.
> Basically, I'm trying to solve how to make the machine a transparent
> proxy on the same external interface.  The packets coming in on port 21
> can be coming from anywhere on the internet, and will be sent to port
> 3805 on the remote machine, which then should come back through my box
> and back to the clients.
> 
> Any ideas on using iptables for this?  I dusted off redir and while it
> worked it had its occasional issues so I'm trying to bring a better
> hammer to beat on the nail.


