From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NTP
Date: Fri, 2 Jul 2004 12:08:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407021208.16907.Antony@Soft-Solutions.co.uk>
References: <40E53FAE.1070007@4Dllc.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E53FAE.1070007@4Dllc.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 02 July 2004 11:57 am, Steve Comfort wrote:

> Hi all,
>
> Could someone tell me what rules I need in order to enable NTP?

NTP uses UDP port 123.

What rules you need depends on what you're trying to do - run an NTP server 
(allow UDP 123 in the INPUT chain), access an NTP server (allow UDP 123 in 
the OUTPUT chain), or allow clients and servers to talk to each other through 
a router (allow UDP 123 through the FORWARD chain).

If in doubt, add a LOG rule, try using the protocol, and see what gets logged 
- that will tell you what sort of packets you need to ACCEPT instead.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


