From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: unknown data
Date: Sun, 16 May 2004 14:59:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161459.04374.Antony@Soft-Solutions.co.uk>
References: <BAY15-F39ORIKg9qZBT00067c7d@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F39ORIKg9qZBT00067c7d@hotmail.com>
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

On Sunday 16 May 2004 12:01 pm, azeem ahmad wrote:

> hi all
> a machine (192.168.0.106) from my LAN is continously sending this data to
> server (192.168.0.100) as shown below in the output of tcpdump. althought
> the data isnt too much but i m wondering what this data is for
> ---------------------------------------------------------------------------
> 15:38:36.412035 arp who-has 192.168.0.106 tell 192.168.0.100
> 15:38:36.412269 arp reply 192.168.0.106 is-at 0:8:c7:99:b6:75
> 15:49:26.543540 192.168.0.106.35847 > 192.168.0.100.1900 udp 132 [ttl 1]

USP port 1900 is M$ PnP service.   I suggest you disable this on machine 
192.168.0.106

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


