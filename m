From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: [Re: [FTP large file problem]]
Date: Fri, 18 Jul 2003 10:52:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030718145228.GC880@cannon.eng.us.uu.net>
References: <993HgRoIe8480S06.1058538844@cmsweb06.cms.usa.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <993HgRoIe8480S06.1058538844@cmsweb06.cms.usa.net>
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
Content-Transfer-Encoding: 7bit
To: Curtis Call <curtiscall@usa.net>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Marcel de Boer <marceldb@luon.net>, netfilter@lists.netfilter.org

Thanks but there I could find:

-----
If you are doing connection tracking or NAT, then all fragments will get merged back together before they reach the packet filtering code, so you need never worry about fragments.
-----

And I guess by default everybody is using "connection tracking" with netfilter.

Ramin


On Fri, Jul 18, 2003 at 08:34:04AM -0600, Curtis Call wrote:

> See:
> 
> http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html#ss7.3
> 
> Scroll down to 'Specifying fragments'.  Looks like whether it is reassembled
> prior to the filter depends on a few different factors...
> 
> Anyway, I was having problems with a local firewall filter stalling my large
> IMAP downloads.  Permitting fragments did the trick...

