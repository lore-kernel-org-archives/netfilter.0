From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MRTG and IPTABLES
Date: Thu, 8 Jan 2004 09:27:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401080927.05649.Antony@Soft-Solutions.co.uk>
References: <83055D4B014C9E478D2F04624B9E82CFAE9660@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFAE9660@noveldc.novelgmt.mu>
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

On Thursday 08 January 2004 6:47 am, Gilles Yue wrote:

> Dear sir,
>
> Have tried your commands below but when I run my iptables script,
>
> I get "command not found" and it points to the line
>
> $SNMP_POLLER_IP="xxx.xxx.xxx.xxx"

There should be no $ at the beginning of this line.

Shell scripts use $ when referencing a variable, not when defining it or 
assigning to it.   This is different from Perl.

Antony.

-- 
My New Year's resolution is not to make any resolutions I can't keep.

I'm wondering whether I've failed already.

                                                     Please reply to the list;
                                                           please don't CC me.


