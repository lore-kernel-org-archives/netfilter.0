From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables problem
Date: Mon, 24 Jun 2002 15:26:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241426.PAA16244@slate.rockstone.co.uk>
References: <CC845BB8BC74D6119934000347DD23E87C0C07@jhbmail.autopage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <CC845BB8BC74D6119934000347DD23E87C0C07@jhbmail.autopage.co.za>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

On Monday 24 June 2002 3:12 pm, Paulo Andre wrote:

> My problem is this...
> A http request comes in on fw2 ip 196.25.31.195 DNAT's to server on lan
> 172.1.1.1
> I can pick up the packet all the way to server and back until it comes to
> fw1 ip 196.41.197.34, src=172.17.1.1 dst="pc requesting".
> But the people on the outside can not see the web page.
> Will the requesting pc have a problem if it requests a page from one ip and
> gets a reply from another...????

Yes, it definitely will.

I think your problem is that you have two firewalls, and you are DNATting 
packets on one of them, and then sending the replies back out through the 
other one, which of course does not do the corresponding "reverse" SNAT on 
the reply.

You need to make sure that your route to the Internet (from the web server) 
points to the machine which accepts the incoming requests (ie the one with 
the public address on it).

 

Antony.

