From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 10:51:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084891877.6418.28.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
	 <1084891180.6410.18.camel@localhost>
	 <34002.200.44.170.105.1084891760.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34002.200.44.170.105.1084891760.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 10:49, alucard@kanux.com wrote:
> > [JAS - isn't the packet coming in on 10.73.219.156? In other words, your
> > NAT rule should be:
> > iptables -t nat -A PREREOUTING -d 10.73.219.156 -p 6 --dport 8080 -j
> > DNAT --to-destination 192.168.0.2:80]
> 
> -p 6? I've never seen this before, what is that rule trying to do?
> 
<snip>
Ah, I usually use the protocol numbers directly rather than the names of
the protocols as it saves the lookup to the /etc/protocols file.  6 is
the IP protocol number for TCP.  It is the same as saying -p tcp but a
little faster. The main point was the destination address appears to be
wrong - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


