From: Jason Opperisano <opie@817west.com>
Subject: Re: Server machines behind Firewall
Date: Thu, 6 Jan 2005 11:35:55 -0500
Message-ID: <20050106163555.GA28547@bender.817west.com>
References: <41DC1258.78D37B1D@ita.org.mo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41DC1258.78D37B1D@ita.org.mo>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thu, Jan 06, 2005 at 12:14:16AM +0800, edwardspl@ita.org.mo wrote:
> Dear All,
> 
> Is there a sample ( nat scripts ) for the title ?

EXT_IF="eth0"
INT_IF="eth1"
SRV1="10.1.1.10"

iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 \
  -j DNAT --to-destination $SRV1

iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
  --dport 80 -j ACCEPT

rinse, repeat.

-j

--
"Ooh, they used nylon rope this time. It feels smooth against my skin,
 almost sensuous."
        --The Simpsons

