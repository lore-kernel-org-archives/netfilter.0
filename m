From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables: invalid arguement with kernel 2.6.5
Date: Tue, 4 May 2004 12:33:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405041233.52018.Antony@Soft-Solutions.co.uk>
References: <002e01c431c7$09cfe910$440997cb@GINA>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002e01c431c7$09cfe910$440997cb@GINA>
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
To: netfilter@lists.netfilter.org

On Tuesday 04 May 2004 12:00 pm, Det Buaklee wrote:

> /sbin/iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 8080
>
> or
>
> /sbin/iptables -t mangle -A PREROUTING -m physdev --physdev-in eth0 -p
> tcp --dport 80 -j REDIRECT --to-port 8080
>
> and iptables just return
>
> iptables: invalid argument

REDIRECT should be done in the nat table, not the mangle table.

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


