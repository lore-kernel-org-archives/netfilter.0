From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: CISCO VPN clients behind firewall
Date: Wed, 05 May 2004 01:10:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4098774D.6070604@isoar.ca>
References: <00f101c43236$e54f0380$0300a8c0@indoakses2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f101c43236$e54f0380$0300a8c0@indoakses2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

bino_oetomo wrote:
> Hi All
> 
> Is there any clue/docs on hoe to let multiple clients behind firewall =
> connecting to CISCO vpn concentrator ?
> 
> Sincerely
> -bino-

[This might be a dupe, as my addressbook had the wrong address]

I just finished Intel Centrino Certification testing on the
PPTP patch (2004-04-16 cvs snapshot) and Fedora's 2.4.22-1.nptl
last week.  Passed with XP/2000 using Intel, Microsoft, Cisco,
and Checkpoint VPN clients.

You can browse the PPTP patch in CVS:
http://cvs.netfilter.org/cgi-bin/viewcvs.cgi/netfilter/patch-o-matic/extra/
and check it out from a similar path.

-- 
Andrew E. Mileski



