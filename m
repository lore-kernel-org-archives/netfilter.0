From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: nat table not working - 'iptables -L nat' (do you need to insmod?)
Date: Tue, 22 Apr 2003 20:02:48 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304222002150.6448-100000@dell>
References: <002301c30926$e310eb90$0100a8c0@yogi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002301c30926$e310eb90$0100a8c0@yogi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Clark <netfilter@spacelink.com.au>
Cc: netfilter@lists.netfilter.org

On Wed, 23 Apr 2003, Stuart Clark wrote:

> Hi
> 
> When I try and add a rule to the nat table it seems to work but when I
> do 'iptables -L nat' I get the error 
> 
> 'iptables: Table does not exist (do you need to insmod?)'
> 
> All the other tables are there when I do 'iptables -L' but no nat table.

# iptables -t nat -L

rday


