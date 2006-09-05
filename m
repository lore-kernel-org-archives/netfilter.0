From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: matching -d to a given interface without specifying ip address
Date: Tue, 5 Sep 2006 06:43:37 +0200
Message-ID: <000601c6d0a5$da2c37b0$0101000a@tanjian>
References: <44FD003D.7080509@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FD003D.7080509@nth.ca>
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

>> What is it exactly what you want to accomplish?
> 
> Maybe this is contrived and not a good method..
> 
> I want the above-described kind of option, to pick out and DNAT
> connections on a certain port (say, http) directed at the
> box, but not
> those on the same port but directed elsewhere (like google being
> accessed through the box being the gateway). Purpose - to
> DNAT-encapsulate some service by the box.

Yes, but there is a difference:
Here you are talking about packets that come from your client that are
sent to Google. These do not have the destination IP of the firewall box
but pass through the firewall because you have set your gateway
according. Besides, that would be SNAT which is something else.

> (It doesn't matter from which direction it came, on which
> interface, its contents, etc. - only the destination ip.)

If you have a server in your LAN (I actually don't know what your setup
is) you want to forward to and perform NAT, you are probably using a
private IP (192.168... etc) for that box. A client from the internet can
only point to your public IP and there are, in this case, only 2
dependencies that matter: destination IP and destination port. Since you
have only 1 public IP, you can specify only 1 destination port, eg 80.
Using these 2 you can either decide it's for the local server on the
firewall or for the internal server in your LAN.

> If i say "-d <ip.of.the.box> --dport 80 -j DNAT ..", that
> works, but it introduces the unwanted dependency on the actual
> IP value.
> 
> If i say "-i <interface> --dport 80..." for an internal
> interface, that catches anything, whether it was meant for
> the box or google.

Perhaps you're confusing DNAT with SNAT?
When packets for Google pass through it's (initial) direction is from
your LAN to the internet and packets are SNAT-ed. This is the opposite
of what you want above.


Gr,
Rob


