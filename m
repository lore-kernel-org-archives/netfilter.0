From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 13:46:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141346.09095.Antony@Soft-Solutions.co.uk>
References: <BAY15-F29OTHXMm9VWL0005acdf@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F29OTHXMm9VWL0005acdf@hotmail.com>
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

On Friday 14 May 2004 12:17 pm, azeem ahmad wrote:

> hi all
> i m havingg a continous upload on port 25 but i m unable to know which ip
> from my network is uploading on port 25. i saw on iptraf that some one is
> continously uploading on 25. the hardware addresss that iptraf is showing
> isnt really on my LAN but the traffic is coming from my LAN
> how can i find out the real hardware address or ip of the machine uploading

Plug a packet sniffer (eg: ethereal) into the link using a hub?

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


