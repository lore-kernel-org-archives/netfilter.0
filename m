From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question about IP_conntrack entry in /proc
Date: Thu, 1 Jan 2004 20:17:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401012017.12647.Antony@Soft-Solutions.co.uk>
References: <1072985943.4290.36.camel@gamux>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072985943.4290.36.camel@gamux>
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

On Thursday 01 January 2004 7:39 pm, Eddahbi Karim wrote:

> Hiya,
>
> I'm writing a documentation about Iptables and I want to know if the
> first src, dst, sport, dport flags are related to the last packet seen
> or to the socket ?
>
> Example : tcp      6 431922 ESTABLISHED src=1.2.3.4 dst=5.6.7.8
> sport=32827 dport=5190
>
> Does the src/dst/sport/dport flags are related to the whole connection
> or just to the last packet seen by the connection tracker ? :)

They relate to the initial packet which created the connection.

Therefore 'source' means the machine which sent the first packet, and 
'destination' means the machine it was sent to.

The data in the conntrack table remains static (except for the timeout) 
throughout the course of the established connection.

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


