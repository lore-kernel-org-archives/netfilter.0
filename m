From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 23:24:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302192324.34042.netfilter@newkirk.us>
References: <HMEBKOCKLOOEJGIOMFAPIEKBFJAA.ian@icreditvision.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEBKOCKLOOEJGIOMFAPIEKBFJAA.ian@icreditvision.com>
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
To: Ian Douglas <ian@icreditvision.com>, netfilter@lists.netfilter.org

Hmmm.  A random neuron-firing leads me to another idea:

Try testing from multiple source IPs simultaneously.  Adding 2-3 alias=20
interfaces on the test client (eth0=3D192.168.1.1,eth0:1=3D192.168.1.2, e=
tc)=20
and distributing your test connections across them could VERY possibly=20
make the difference.  (two separate machines would guarantee a valid=20
test, but I suspect multiple IP's would be sufficient)  Connection=20
tracking may see that all the traffic is between the same two IP's=20
(before the DNAT) and keep it coherent by always DNATting to the same=20
destination.

If that's not it, (and I have a strange feeling it IS) I have two more=20
suggestions:^)

1 - Try the contiguous-IP setup if possible, even if just changing the=20
two servers to a different subnet for the test.  (and changing the IP of=20
the iptables box to match, obviously, or adding a new IP as an alias on=20
the internal interface)

2 - Modify your test approach to transfer a sizeable file on each=20
connection.  Maybe a 1mb file, and try several simultaneous:

wget -q -O - http://server/onemegfile.tmp >/dev/null

Not a tremendous amount of traffic, but certainly enough to ensure=20
several active connections.

j

On Wednesday 19 February 2003 07:55 pm, Ian Douglas wrote:
> > The only reason I can think of (now) that all your traffic went to
> > the first on the list is that there simply wasn't any load to speak
> > of.  How were you testing?
>
> By blasting traffic at the system that's doing the packet forwarding.
> Perhaps I can write some different code on the web servers that will
> hold the connection for a while (ie: call a perl script that does a
> 'sleep 60' or something) and test it that way.
>
> > Multiple simultaneous connections?
>
> Yes. I have a script that cycles through a perl script (I'll call it
> blasticv.pl) that calls another perl script (I'll call it icv.pl) with
> 3 varying parameters... each occurrence of that icv.pl makes a
> connection to the web server to send and retrieve a chunk of data.
> "blasticv.pl" cycles through and calls icv.pl 100 times with each of
> the 3 parameters, and not sleeping at all in the loop. This should
> simulate 300 requests on the web servers that, given the timing to
> complete a single request, would mean we'd have about 200 active
> requests at the peak of activity, yet every single 'hit' on the
> systems landed on 1.1, and not a single hit on 1.12.
>
> > it will simply keep sending traffic to the first
> > on the list, only using the next one if there is more traffic
> > 'currently' (presumably based on the connection-tracking data) on
> > the first destination than on the second.
>
> ... which is what I read, also, yet it seemed that causing a good
> volume of busy traffic didn't forward anything to 1.12
>
> -id


