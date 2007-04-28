From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: [Fwd: Re: Wireless Login Page]
Date: Sat, 28 Apr 2007 19:45:41 +0200
Message-ID: <46338845.1020605@lopsch.com>
References: <1177772620.3828.176.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1177772620.3828.176.camel@ws1.walco02.com>
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

Kirk Wallace schrieb:
> (This may be a duplicate message, KW)
> 
> Thank you for the replies Alex and Jan.
> 
> I set up a test system with two PC's. PC one has Apache httpd running on
> it with iptables flushed, defaults set to accept all packets and is at
> 192.168.21.1 . PC two is simply a workstation at 192.168.21.10 . I can
> get my default webpage by pointing the workstation's browser to
> 192.168.21.1 . I invoked "iptables -t nat -A PREROUTING -p TCP --dport
> 80 -j REDIRECT" on the http host. At this point I was expecting to point
> the workstation's browser to 192.168.21.2 and get the default webpage,
> but this returned "Unable to Connect".
> 

Hi,

I don't really understand what you are trying. When your browser 
connects to 192.168.21.2 and there is no webserver running it will not 
be able to connect logically. Do you want to redirect traffic destined 
to 192.168.21.1 to 192.168.21.2 then -j DNAT --to-destination 
192.168.21.2 is your friend not -j REDIRECT. This will redirect all 
traffic to the local machine.

