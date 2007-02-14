From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables: hide the real web server from users
Date: Wed, 14 Feb 2007 09:42:15 -0600
Message-ID: <45D32DD7.80006@riverviewtech.net>
References: <354862.54159.qm@web33304.mail.mud.yahoo.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <354862.54159.qm@web33304.mail.mud.yahoo.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Tim Perton wrote:
> I want my users to do a request like
> http://a.b.c.d/1.php and then machine A to make the
> same request to System B, get the results and send
> them back to the user transparently.

Technically you can do what you are wanting to do.  However there are a 
few caveats that you need to be aware of when doing such.

1)  System B will see System A as the connecting host, not the real client.
2)  If System B is not ""behind System A (as you have described it to 
not be) it will have to send the traffic back to System A which will 
then send the traffic back to the client.  Translation, System B can not 
send the traffic directly to the client with out breaking the TCP 
connection state on the client.
3)  System A will be using more bandwidth by doing this.

If all the above are ok with you, consider doing the following on system A.

# Port forward web traffic originally to System A over to System B.
iptables -t nat -A PREROUTING -i $INet -d $SystemA_IP -p tcp --dport 80 
-j DNAT --to-destination $SystemB_IP:$SystemB_Port
# SNAT traffic to System B's web server to appear to be from System A.
iptables -t nat -A POSTROUTING -o $INet -d $SystemB_IP -p tcp --dport 
$SystemB_Port -j SNAT --to-source $SystemA_IP

If you have any questions, ask.



Grant. . . .

