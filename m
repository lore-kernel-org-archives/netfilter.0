From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: Display active NAT connections?
Date: Sun, 8 Sep 2002 21:41:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c257a2$157bab60$d201a8c0@hornet>
References: <Pine.LNX.4.44.0209082047060.26706-100000@triton.neptune.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209082047060.26706-100000@triton.neptune.on.ca>
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
To: 'Netfilters Mailing List' <netfilter@lists.netfilter.org>
Cc: 'Steve Mickeler' <steve@neptune.ca>

> They are listed in /proc/net/ip_conntrack. Use your favorite 
> parsing utils to get the desired results.
> You might also want to check out the iptstate util available 
> at http://home.earthlink.net/~jaymzh666/iptstate

Thank you Steve! That program was *exactly* what I was looking for!

/*Raj*/


