From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Could someone tell me the rules of port translation in SNAT ?
Date: Mon, 5 Jan 2004 11:14:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401051114.24879.Antony@Soft-Solutions.co.uk>
References: <BAY10-F80mi4Ho8YZ4n00031d23@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F80mi4Ho8YZ4n00031d23@hotmail.com>
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

On Monday 05 January 2004 6:22 am, ding dang wrote:

> When using SNAT of Netfilter as an NAPT, how will Netfilter assign the
> public UDP port for a UDP request from the private network to Internet?

With both TCP and UDP, netfilter will use the source port contained in the 
original packet if it can (ie: if that source port is not being used for 
something else by the netfilter machine).   If this is not possible, then 
another port is chosen at random using the standard socket-binding mechanism 
used for any network connection.

> Could someone detail it to me when the UDP request is
> NEW/ESTABLISHED/RELATED/REPLIED/UNREPLIED?

This makes no difference.

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


