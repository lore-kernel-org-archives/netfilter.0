From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack and ipt_conntrack
Date: Fri, 23 Jan 2004 08:46:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401230846.02635.Antony@Soft-Solutions.co.uk>
References: <BAY10-F125rCrg6XkGd0006c413@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F125rCrg6XkGd0006c413@hotmail.com>
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

On Friday 23 January 2004 2:22 am, Rodre Ghorashi-Zadeh wrote:

> Hello,
>
> I was hoping that someone could tell me the difference between these two
> modules and what they are each used for. Thanks in advance.

ip_conntrack does connection tracking for various protocols, placing entries 
in the conntrack table and recognising "related" packets etc.

ipt_conntrack is the connection tracking state match, which allows you to 
write rules matching the state of a connection, eg:

iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


