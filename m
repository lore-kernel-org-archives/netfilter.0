From: "Ian Douglas" <ian@icreditvision.com>
Subject: RE: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 16:55:22 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPIEKBFJAA.ian@icreditvision.com>
References: <200302191930.05271.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200302191930.05271.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

> The only reason I can think of (now) that all your traffic went to the
> first on the list is that there simply wasn't any load to speak of.  How
> were you testing?

By blasting traffic at the system that's doing the packet forwarding. Perhaps I
can write some different code on the web servers that will hold the connection
for a while (ie: call a perl script that does a 'sleep 60' or something) and
test it that way.

> Multiple simultaneous connections?

Yes. I have a script that cycles through a perl script (I'll call it
blasticv.pl) that calls another perl script (I'll call it icv.pl) with 3 varying
parameters... each occurrence of that icv.pl makes a connection to the web
server to send and retrieve a chunk of data. "blasticv.pl" cycles through and
calls icv.pl 100 times with each of the 3 parameters, and not sleeping at all in
the loop. This should simulate 300 requests on the web servers that, given the
timing to complete a single request, would mean we'd have about 200 active
requests at the peak of activity, yet every single 'hit' on the systems landed
on 1.1, and not a single hit on 1.12.

> it will simply keep sending traffic to the first
> on the list, only using the next one if there is more traffic
> 'currently' (presumably based on the connection-tracking data) on the
> first destination than on the second.

... which is what I read, also, yet it seemed that causing a good volume of busy
traffic didn't forward anything to 1.12

-id


