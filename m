From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: -m owner & -j MARK problem
Date: Fri, 9 Jan 2004 16:05:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401091605.24970.Antony@Soft-Solutions.co.uk>
References: <1073657669.1103.1.camel@bubursuc.celuloza.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073657669.1103.1.camel@bubursuc.celuloza.ro>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Friday 09 January 2004 2:14 pm, Radu Anghel wrote:

> what's wrong with the following command?
>
> [root:pts/5][~]# iptables -t mangle -A PREROUTING -i eth0 -m owner
> --gid-owner 101 -j MARK --set-mark 101
> iptables: Invalid argument

According to 
http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html#ss7.3 
the owner match is only valid in the OUTPUT chain?

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


