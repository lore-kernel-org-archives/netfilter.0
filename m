From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Active mode FTP
Date: Sat, 7 Sep 2002 12:59:46 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209071256400.2411-100000@laptop1.agatha>
References: <20020906121914.5da2babe.kribba@online.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020906121914.5da2babe.kribba@online.no>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kristian F. Hansen" <kribba@online.no>
Cc: netfilter@lists.netfilter.org

On Fri, 6 Sep 2002, Kristian F. Hansen wrote:

> Some weeks ago i tried to get help here with my problem, but still there
> is no solution to this problem so here i go again.
> 
> I have a NAT/Gateway box connected to the internet. Behind that box i've
> got 3 computers. When i try to use actice mode ftp (client side) behind
> the NAT box it doesn't work, only passive mode seems to work. But, from
> the NAT box i can use client side active ftp. This is quite annyoing and
> i would preciate any help....my iptables script can be found at:

Have you loaded the ip_conntrack_ftp and ip_nat_ftp modules? They are 
necessary for the conntrack engine to be able to understand which 
connections are related or not to the FTP control session.

> 
> folk.uio.no/kristfh/firewallScript.txt
> 
> 
> 
> 
> ------------------
> 
> 
> Mvh
> Kristian F. Hansen
> 
> 
> ------------------
> 
> 
> 

-- 
----
Oskar Andreasson
http://iptables-tutorial.haringstad.com
http://people.unix-fu.org/andreasson/
mailto:blueflux@koffein.net



