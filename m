From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: choose interface based on port
Date: Sat, 18 Dec 2004 23:18:55 -0500
Message-ID: <1103429935.2031.61.camel@localhost>
References: <200412190132.52221.ssc@earth.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412190132.52221.ssc@earth.com.br>
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
To: Security Support Center <ssc@earth.com.br>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sat, 2004-12-18 at 22:32, Security Support Center wrote:
> Hello All,
> 
> 
> I'm having some problems on creating something that I thought, would not be so 
> dificult.
> 
> I have a firewall that holds 4 interfaces, and 2 of them are links to the 
> internet.
> 
> I want use link 1 for navigation (80 port) and link 2 for all the rest. But I 
> can't get it done.
> 
> I already tried lots of rule types, search internet, googled, etc but got 
> nothing.
> 
> Can anybody give me a light on this
> 
> 
> Tank you all in advance...
> 
> 
> Alberto
Hi, Alberto.  I'm afraid I don't have time to look up the details but I
think you will be able to do what you want to do with iproute2 and
packet marking.  The details will be in a file named ip-cref.ps in the
rules section.  On my RedHat 9.0 distribution it is
/usr/share/doc/iproute-2.4.7/ip-cref.ps.  You can also find a brief
slide show on using it with iptables and *swan in the training section
of the ISCS network security management web page at
http://iscs.sourceforge.net

Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


