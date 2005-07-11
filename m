From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Unable to add rule on Chain with 28 characters
Date: Mon, 11 Jul 2005 06:57:38 -0400
Message-ID: <1121079458.3045.6.camel@localhost>
References: <42CECBA1.7090306@interage.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CECBA1.7090306@interage.com.br>
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
To: Rafael Dreher <rafael@interage.com.br>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-07-08 at 15:53 -0300, Rafael Dreher wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I'm trying do add a rule on a user-defined chain, on the NAT table, with 28 characters.
> 
> The chain have bee added without any problem, but when I add the rule, iptables says that it's unable do find the chain.
> 
> If I reduce the chain to 25 characters, it works. I'm trying to migrate a set of rules form iptables-1.2.11 to 1.3.1,
> and I don't want to rewrite the rules.
> 
> Someone can help me?
<snip>
> 
I don't have a direct solution for you.  From what I recall, the chain
name length is hard-coded at 32 characters.  That bit us on the ISCS
network security management project (http://iscs.sourceforge.net) where
we had very long names due to the hierarchical structure of groups and
the inheritance model.  We switched to automatically generating chain
names based upon incrementing numbers.

I do not know if the size of the name field has changed with subsequent
iptables versions.  Wish I could be of more help - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


