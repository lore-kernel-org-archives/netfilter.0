From: Tim Perton <grpanosgr@yahoo.com>
Subject: Re: iptables: hide the real web server from users
Date: Wed, 14 Feb 2007 08:36:40 -0800 (PST)
Message-ID: <533163.22377.qm@web33303.mail.mud.yahoo.com>
References: <45D32DD7.80006@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D32DD7.80006@riverviewtech.net>
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
To: netfilter@lists.netfilter.org
Cc: gtaylor@riverviewtech.net

Dear Grant,
thank you very much for your quick reply.

I agree to the 3 conditions/caveats in your previous
email. I have already tried an example on this.
Let's say I want to connect to www.google.com
(216.239.59.103) so System B is www.google.com

According to your example I issue the following
commands (after stop/start iptables to be fresh):

iptables -A INPUT -p tcp -m tcp --dport 1099 -j ACCEPT

iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p
tcp --dport 1099 -j DNAT --to-destination
216.239.59.103:80

iptables -t nat -A POSTROUTING -o eth0 -d
216.239.59.103 -p tcp --dport 1099 -j SNAT --to-source
a.b.c.d

I am trying http://a.b.c.d:1099  or with telnet
a.b.c.d 1099 (Trying a.b.c.d... telnet: Unable to
connect to remote host: Connection refused)

My regards,
Tim

--- Grant Taylor <gtaylor@riverviewtech.net> wrote:

> Tim Perton wrote:
> > I want my users to do a request like
> > http://a.b.c.d/1.php and then machine A to make
> the
> > same request to System B, get the results and send
> > them back to the user transparently.
> 
> Technically you can do what you are wanting to do. 
> However there are a 
> few caveats that you need to be aware of when doing
> such.
> 
> 1)  System B will see System A as the connecting
> host, not the real client.
> 2)  If System B is not ""behind System A (as you
> have described it to 
> not be) it will have to send the traffic back to
> System A which will 
> then send the traffic back to the client. 
> Translation, System B can not 
> send the traffic directly to the client with out
> breaking the TCP 
> connection state on the client.
> 3)  System A will be using more bandwidth by doing
> this.
> 
> If all the above are ok with you, consider doing the
> following on system A.
> 
> # Port forward web traffic originally to System A
> over to System B.
> iptables -t nat -A PREROUTING -i $INet -d
> $SystemA_IP -p tcp --dport 80 
> -j DNAT --to-destination $SystemB_IP:$SystemB_Port
> # SNAT traffic to System B's web server to appear to
> be from System A.
> iptables -t nat -A POSTROUTING -o $INet -d
> $SystemB_IP -p tcp --dport 
> $SystemB_Port -j SNAT --to-source $SystemA_IP
> 
> If you have any questions, ask.
> 
> 
> 
> Grant. . . .
> 
> 



 
____________________________________________________________________________________
Looking for earth-friendly autos? 
Browse Top Cars by "Green Rating" at Yahoo! Autos' Green Center.
http://autos.yahoo.com/green_center/

