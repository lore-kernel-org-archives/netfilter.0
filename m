From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hosts.Deny Question??
Date: Thu, 12 Sep 2002 12:53:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209121153.g8CBrDv09974@vulcan.rissington.net>
References: <9AB58396B028D411B2110050040C7AD801910D75@pc213-104.indigo.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9AB58396B028D411B2110050040C7AD801910D75@pc213-104.indigo.ie>
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

On Thursday 12 September 2002 12:38 pm, Niall Murphy wrote:

> Hi All,
> i want to use hosts.deny to block emails and ip's to my email
> server..sounds easy but i cant seem to get it to work
> do i just need to add the emails or ip's to the host.deny and then add a
> rule to my script

Why not do it with netfilter ? (after all, that's what this list is about :-)

iptables -A FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 25 -j DROP

where a.b.c.d is the remote IP address you want to block (repeat this rule 
for as many addresses as you want to exclude) and w.x.y.z is the IP address 
of your mail server.

Make sure this rule comes before any rule which allows general access to your 
mail server from the outside world.

You won't be able to use either netfilter or hosts.deny to block actual email 
addresses - you'd have to do that in your mail server itself.

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

