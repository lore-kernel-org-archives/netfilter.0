From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: hostname forwarding
Date: Wed, 11 Dec 2002 16:43:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019A45@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B3215619EA@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3215619EA@hslex01.hslbz.local>
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
To: 'bernard' <bernard@gers.net>, netfilter@lists.netfilter.org

> Now I want to redirect on a hostname basis on different private ip's 
> like this :
> 
> 	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
> 	hostname B:80 -> public ip -> iptables -> 192.168.1.2:80
> 
> Does anyone know a solution ?

Iptables will only forward (resolved) IP adresses (and/or ports).
If Host-A has the same IP address as Host-B, then packets will be
forwarded to one and the same internet IP address.
You could accept http traffic on, let's say, port 81 and redirect
traffic for Host-B:81 to 192.168.1.2:80, but I don't think that's what
you want : people would have to type http://Host-B:81 to enter the site.


Rob


