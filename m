From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: iptc_* implementation queries
Date: Mon, 2 Feb 2004 19:57:45 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040203035745.34657.qmail@web14005.mail.yahoo.com>
References: <s01e5eb1.078@prv-mail25.provo.novell.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s01e5eb1.078@prv-mail25.provo.novell.com>
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
To: Jambunathan Jambunathan <kjambunathan@novell.com>, netfilter@lists.netfilter.org

--- Jambunathan Jambunathan <kjambunathan@novell.com>
wrote:
> I am interested in knowing the netfilter
> infrastructure and I would
> like to know how iptables communicates with
> netfilter ( user to
> kernel space communication ) I understand that it
> happens through
> raw sockets through setsockot and getsockopt. Also
> there are a
> good number of iptc_* calls that are declared in
> libiptc.h which
> are used by the iptables user space tool. I would
> like to know 
> where I can see the implementations for these iptc_*
> calls. 

  These are in the libiptc directory of the iptables
module of cvs.


=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

