From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: measure traffic
Date: Tue, 8 Oct 2002 09:39:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210080939.31003.mklingens@ism.nl>
References: <200210080025.26576@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210080025.26576@.>
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

On Monday 07 October 2002 20:58, PayalR wrote:
> I have a small urgent problem. As I told you all before, I have my single 
> Linux box at a server farm where I have to pay per Mb of data transmitted.
> I have a doubt that those guys there are cheating me. They are taking more 
> money than actual data transmitted. Can I use iptables to log all incoming 
> and outgoing data and see total incoming/outgoing data in a day/week/month?
> What do i have to do? Is there any specific package available for it?

Use ipac-ng (http://sourceforge.net/projects/ipac-ng/).

-- 
Martijn


