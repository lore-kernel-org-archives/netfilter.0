From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT changing IP.
Date: Fri, 10 Jun 2005 14:33:12 -0400
Message-ID: <20050610183312.GA6390@bender.817west.com>
References: <20050609160331.95885.qmail@web40425.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050609160331.95885.qmail@web40425.mail.yahoo.com>
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

On Thu, Jun 09, 2005 at 09:03:31AM -0700, Anand Kumar wrote:
> Hi,
> 
> I have used a firewall m/c with the 2 interfaces, 1
> Static Public IP (eth0) & Internal ip (192.168.0.1,
> eth1) & route the packets to mail server with internal
> ip 192.168.0.254 for mail receiving with the following
> rule.
> $IPT -A PREROUTING -t nat -p tcp -i eth1 --dport 25 -j
> DNAT --to 192.168.0.254:25
> 
> No problems in receiving mails.  Problem faced by me
> is the IP Address of the originating mail is changed
> to 192.168.0.1 after the PREROUTING, due to which the
> SPAM filter is not happening & am receiving around
> 1000 Junk mails.  
> 
> Looking for a solution of just moving the packets with
> original IP to my mail server.

fix your nat:POSTROUTING SNAT/MASQ rule so that it only specifies "-o
$EXT_IF."  and next time, post all your rules (iptables-save) so that
the folks that are trying to help don't have to divine answers from the
tea leaves.

-j

--
"Stewie: Careful! You're washing a baby's scalp, not scrubbing
 the vomit out of a Christmas dress, you stupid holiday drunk."
        --Family Guy

