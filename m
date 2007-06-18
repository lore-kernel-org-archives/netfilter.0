From: Jason Neurohr <Jason.Neurohr@uniqueworld.net>
Subject: RE: change reply message of icmp request
Date: Mon, 18 Jun 2007 17:00:39 +1000
Message-ID: <24FD1C211AC69E4D8A87F622688FE565014C019578@sydsrvprod0009.sydney.uw.local>
References: <68d40817-15a7-4d11-80f6-1752c265471f>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <68d40817-15a7-4d11-80f6-1752c265471f>
Content-Language: en-US
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
To: Krishantha Dinesh <krishantha@krishantha.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I think it would be better to drop icmp on the firewall, by doing some kind=
 of reject message, your letting people know that a host exists there.

Jason

http://forum.networkfu.org

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lists=
.netfilter.org] On Behalf Of Krishantha Dinesh
Sent: Monday, 18 June 2007 4:46 PM
To: netfilter@lists.netfilter.org
Subject: change reply message of icmp request

Hi guys
I am petty new for linux firewall. Now I want to change the reply massage o=
f
REJECT icmp request.
Eg;- if my firewall got ping request I need  send massage as "Ping request
not ALLOWED by this IP" or something like this.
I am going to reject icmp like this

Iptables -A INPUT -p icmp -j REJECT

If any body know this please help me.
Krisha




