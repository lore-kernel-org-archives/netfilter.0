From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: Inserting rules is extremly slow :((
Date: 12 Dec 2002 13:25:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039695920.475.42.camel@xbox>
References: <3df87716.1a99.0@unacs.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3df87716.1a99.0@unacs.bg>
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
To: nedco@unacs.bg
Cc: netfilter@lists.netfilter.org

On Thu, 2002-12-12 at 12:46, nedco@unacs.bg wrote:
> 
> Hi,
>  How to insert fast about 20000 rules in iptables.
>  If some document will be help , please let me know  :)
> 
Hi,

man iptables-save 
man iptables-restore

That's the only solution to your performance problem at this moment...

Regards,
Filip



