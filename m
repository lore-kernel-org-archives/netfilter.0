From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: web surfing
Date: Thu, 1 Apr 2004 23:43:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404012343.35327.Antony@Soft-Solutions.co.uk>
References: <20040401222922.31D603CA2F@smtp.latinmail.com>
Reply-To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401222922.31D603CA2F@smtp.latinmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thursday 01 April 2004 11:29 pm, Jorge Garcia wrote:

> iptables its on my computer but not only me uses it.
> so, i want a set of rules for allowing my computer only to access to web
> pages how can i do this??

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Obviously you may need to add extra rules to the OUTPUT chain if you want to 
allow access to ports other than 80 - 8000 and 8080 are not too uncommon, for 
example.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


