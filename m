From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack -E -i not allowed?
Date: Tue, 07 Nov 2006 13:40:48 +0100
Message-ID: <45507ED0.4000709@netfilter.org>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611021111.19134.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611021111.19134.alan.ezust@presinet.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Alan Ezust <alan.ezust@presinet.com>
Cc: netfilter@lists.netfilter.org

Alan Ezust wrote:
>> Is there a trick to getting the ctids to be sent to the output of this?

There is not.

>> conntrack -L -i seems to work, showing me the id. Personally, I think
>> conntrack should always output the id.

No, actually we have plans to remove it soon. Why do you need the id?

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

