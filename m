From: David Cannings <lists@edeca.net>
Subject: Re: routing using netfilter hooks
Date: Wed, 31 Mar 2004 09:54:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403310954.08149.lists@edeca.net>
References: <200403310802.NAA04204@WS0005.indiatimes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403310802.NAA04204@WS0005.indiatimes.com>
Content-Disposition: inline
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

On Wednesday 31 March 2004 09:30, mtrayudu wrote:
> Hello
> I have a problem i.e i have a system with 2 ethernet cards ,i want to
> capture the packets from one ethernet card process for information and
> send it through the other ethernet card using netfilter hooks. Please
> suggest me the method of doing this

Presuming the datagrams originate on one card and are destined for an 
address/subnet on the other card, enable IP forwarding (`echo 1 
>/proc/sys/net/ipv4/ip_forward`) then add rules to your FORWARD chain 
that define which packets may and may not pass.

If you can be more specific about what sort of information you want to 
process for, how your network is setup and what exactly you are trying to 
achieve we will be able to help more.

David

