From: Jason Opperisano <opie@817west.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 15:44:33 -0500
Message-ID: <20050107204433.GA1112@bender.817west.com>
References: <7C9884991ADAE0479C14F10C858BCDF5679643@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5679643@alderaan.smgtec.com>
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

On Fri, Jan 07, 2005 at 12:42:27PM -0800, Daniel Chemko wrote:
> Becomes
> 
> /usr/local/sbin/iptables -P FORWARD DROP
> /usr/local/sbin/iptables -A FORWARD -j LOG
> /usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j
> QUEUE
> /usr/local/sbin/iptables -A FORWARD -p tcp -m state --state
> RELATED,ESTABLISHED -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE
> /usr/local/sbin/iptables -A FORWARD -j LOG

minor edit, for clarity sake:

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix "PRE QUEUE: "
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix "POST QUEUE: "

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
        --The Simpsons

