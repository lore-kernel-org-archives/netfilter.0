From: Jason Opperisano <opie@817west.com>
Subject: Re: no nat please
Date: Thu, 04 Nov 2004 12:13:40 -0500
Message-ID: <1099588420.3027.11.camel@hubcap.ljm.dom>
References: <20041104170731.GA10260@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041104170731.GA10260@tranquility.scriptkitchen.com>
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

On Thu, 2004-11-04 at 12:07, Payal Rathod wrote:
> Hi,
> I use simple masquerading to allow my windows clients to browse the
> net. But for one particular machine I need to connect it to VPN of
> my client abroad. Now, the tech people at their end told me not
> to nat that machine as nating would destroy the VPN part. How do I do that?
> The machine IP address is 192.168.10.15.
> 
> With warm regards,
> -Payal

insert a rule BEFORE your outbound MASQ rule

  iptables -t nat -A POSTROUTING -o $EXT_IF -j MASQUERADE

that says:

  iptables -t nat -A POSTROUTING -o $EXT_IF \
    -s 192.168.10.15 -d $REMOTE_VPN_NET -j ACCEPT

is this a site-to-site VPN between your firewall and their firewall?  if
not--ignore the above statements.

-j

--
"'Nuke the whales?' You don't really believe that, do you?
 I dunno. Gotta nuke something."
	--The Simpsons


