From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 10:34:49 -0500
Message-ID: <428E0399.6020703@riverviewtech.net>
References: <fad9d484050519150730dbc53d@mail.gmail.com>	<20050519232314.GA9369@bender.817west.com>	<20050519233347.GA9462@bender.817west.com>	<428D8638.4040301@riverviewtech.net>	<428D954E.1010105@riverviewtech.net>
	<20050520152021.GA11737@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050520152021.GA11737@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> please do this in -t mangle PREROUTING and not -t nat.  filtering in
> -t nat is poor form, and i know lots of people are probably emulating
> your scripts.

No problem.

You heard him people, the mangle table is a better place to do this, so here is an updated script:

iptables -t mangle -A PREROUTING -i $LAN -p udp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t mangle -A PREROUTING -i $LAN -p udp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
iptables -t mangle -A PREROUTING -i $LAN -p icmp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t mangle -A PREROUTING -i $LAN -p icmp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP

I have just tested this and found it to be fully functional on my home router too.  Have fun.  :)



Grant. . . .

