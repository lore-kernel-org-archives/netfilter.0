From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 11:34:28 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923103428.GK27327@metastasis.org.uk>
References: <415290B1.5030401@imag.fr>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <415290B1.5030401@imag.fr>
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

On Thu, Sep 23, 2004 at 11:00:33AM +0200, Raphael Jacquot wrote:
> hi,
> I have a setup that looks like :
>  _____                                ____
> [     ] 192.168.0.100                [    ]
> [ DNS ]------------------------------[ FW ]----
> [_____]                192.168.0.254 [____] (isp)
> 
> and I want the DNS to answer to queries from the outside
> what's the proper way of doing this ?

I'm presuming that you want to answer queries from everywhere, rather
than just from specific hosts, in which case:

iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p udp --dport
53 -j DNAT --to-destination 192.168.0.100

iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p tcp --dport
53 -j DNAT --to-destination 192.168.0.100

iptables -A FORWARD --destination 192.168.0.100 -p udp --dport 53 -j
ACCEPT

iptables -A FORWARD --destination 192.168.0.100 -p tcp --dport 53 -j
ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I'd be interested to hear how you get on by the way, I'm not quite sure
that my iptables rulebases are keeping state on DNS requests correctly.

-- 
mors omnia vincit

