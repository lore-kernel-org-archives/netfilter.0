From: "plugthebox.net /dev/null" <devnull@plugthebox.net>
Subject: RE: INPUT and PORTS
Date: Wed, 01 Nov 2006 15:41:22 +0200
Message-ID: <1162388483.17873.33.camel@localhost>
References: <!&!AAAAAAAAAAAuAAAAAAAAAKTyXRN5/+lGvU59a+P7CFMBAN6gY+ZG84BMpVQcAbDh1IQAAAATbSgAABAAAABaalp1/Z/jRK7sKuE7ceDgAQAAAAA=@iname.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAKTyXRN5/+lGvU59a+P7CFMBAN6gY+ZG84BMpVQcAbDh1IQAAAATbSgAABAAAABaalp1/Z/jRK7sKuE7ceDgAQAAAAA=@iname.com>
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
To: frnkblk@iname.com
Cc: netfilter@lists.netfilter.org

Hello,
But i still have other users that only need to access 80 and 22.

Let me clarify my setup.

I have 3 users (they're around 2000 but lets use 3 for now), i want them
all to be able to connect INPUT to ports 80 and 22, sometimes, i want to
block some users, by not including them in the INPUT -s -j ACCEPT, but i
want to keep the other users INPUT -s -j ACCEPT to use 80 and 22

thanks

On Wed, 2006-11-01 at 06:51 -0600, Frank Bulk wrote:
> That's because you still have a rule that matches, specifically:
> 	/sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j
> ACCEPT
> 	/sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT
> 
> Frank
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of plugthebox.net
> /dev/null
> Sent: Wednesday, November 01, 2006 6:49 AM
> To: netfilter
> Subject: INPUT and PORTS
> 
> Hello,
> I want to do the following, accept in comings from 10.2.2.115 only
> restricting to port 80,22
> 
> is this correct? 
> 
> -P rules ...
> -F rules ...
> /sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
> /sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
> /sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
> /sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j ACCEPT
> /sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT
> 
> Eventhough i saw this setup in many tutorials/howtos,  when ever i want
> to block 10.2.2.115 (by not listing him in the INPUT -j ACCEPT), that ip
> can still connect to port 80 and 22.
> 
> 
> 
> Thanks
> Sincerely,
> 
> 
> 


