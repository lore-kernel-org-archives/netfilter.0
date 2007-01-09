From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Different routes
Date: Mon, 08 Jan 2007 20:42:34 -0600
Message-ID: <45A3011A.4060100@riverviewtech.net>
References: <459D6107.6030007@bluechip.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <459D6107.6030007@bluechip.ro>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/04/07 14:18, Arthur Kerpician wrote:
> Hi,
> The server I'm using is doing SNAT for the local network and has 2 NICs 
> for 2 different ISPs and 1 NIC for the LAN. One of the ISPs is the 
> backup one and the default gateway on the server is switched to this one 
> if the primary one is down.
> Now, how can I route several LAN clients (not all) through the backup 
> connection, instead of the default one?

Look in to the "Linux Advanced Routing and Traffic Control" (LARTC) 
documentation on using multiple internet connections.  You want to have 
your multiple routing tables set up and selectively tell the kernel to 
route some (FWMark / Source / Destination / etc) traffic out the backup 
link.



Grant. . . .

