From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Question on -L
Date: Fri, 17 Jun 2005 13:09:15 -0400
Message-ID: <1119028154.2084.184.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Hey all,

Hopefully an easy question, but I have not been able to find what I'm
looking for. 

Is there a tool out there that takes the output from 'iptables -L' and
converts it into the actual iptables policy using the correct syntax? I
know the output from something like this may not always be exact (i.e.
values could have been entered as variables, switches used in a
different order, etc.), but it would be a great start.

I'm dealing with a number of appliances that run iptables on the back
end to implement the filter policy. Each vendor has different ideas on
how to load this policy and from where on the file system. It would be
cool if I could take the output from 'iptables -L' and simply convert it
to a similar policy, rather than having to hunt through the drive to
find the policy they are loading. Many times useful tools like grep and
find get removed from the OS, so it can be a real pain.

Thanks in advance for any help,
Chris



