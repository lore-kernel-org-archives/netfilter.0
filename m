From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: change reply message of icmp request
Date: Mon, 18 Jun 2007 07:55:29 +0000 (UTC)
Message-ID: <slrnf7cejh.5vt.petr.pisar@album.ics.muni.cz>
References: <10928.154763724$1182148430@news.gmane.org>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007-06-18, Krishantha Dinesh <krishantha@krishantha.com> wrote:
> Eg;- if my firewall got ping request I need  send massage as "Ping request
> not ALLOWED by this IP" or something like this.
> I am going to reject icmp like this
>
> Iptables -A INPUT -p icmp -j REJECT
>
The match filter is wrong, because it blocks all ICMP messages. Even
responses from remote hosts.

Try this:

iptatbles -A INPUT -p icmp --icmp-type echo-request \
    -j REJECT --reject-with=icmp-host-prohibited

-- Petr



