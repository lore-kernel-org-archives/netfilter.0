From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: netfitler against Trojans and worms
Date: Mon, 5 Jul 2004 15:59:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407051559.52393.gdh@acentral.co.uk>
References: <1d7da3f40407050659476384b7@mail.gmail.com> <200407051510.06470.gdh@acentral.co.uk> <1d7da3f40407050746589209b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1d7da3f40407050746589209b5@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 05 July 2004 15:46, Saad Faruque wrote:
> I did think of doing  it the other way around, but again i have to
> list all the internet services that are being used which is also
> changing continuously. 

Unless you're running a lot of P2P applications, I can't see the 'need' list 
being very long... 21, 22, 80, 110, 143, 443, 993, 995... maybe a few others 
for remote desktop apps, etc.

> more like a layer 7 filtering. im just trying to find a
> smarter way of doing it, which will be more effective and could be
> updated easily.

This is possible :)

http://l7-filter.sourceforge.net/

It needs kernel 2.6 to be 'easy', if you use 2.4 you can only rate-limit and 
not simply drop packets based on the application type.

gdh

