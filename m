From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 00:25:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401110025.25675.Antony@Soft-Solutions.co.uk>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com> <003801c3d7d7$ba8ed850$0d04460a@orion>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003801c3d7d7$ba8ed850$0d04460a@orion>
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

On Sunday 11 January 2004 12:13 am, Pawel Staszewski wrote:

> Hello
>
> Maybe try to block broadcast to the "blocked" client....
> "-m pkttype --pkttype broadcast ........."
>
> I use it and this work fine...

You can use a rule with this match in it to stop your DHCP server giving out 
addresses?

I thought DHCPD caught the packets before they ever got to netfilter, 
therefore you couldn't block the traffic with any sort of rule.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


