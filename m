From: "Jambunathan Jambunathan" <kjambunathan@novell.com>
Subject: Re: iptc_* implementation queries
Date: Mon, 02 Feb 2004 21:39:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <s01ec3af.054@prv-mail25.provo.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
Cc: immidi_kiran@yahoo.com

Sorry if I am sounding stupid. Though I could see
the declarations in the 1.2.9 archive I am unable
to find the definition of iptc_* functions themselves.
Can you point me to the file that you are talking of ?

Please can someone give an hint on the user to kernel
space communication.

Regards,
Jambunathan K.

>>> Kiran Kumar <immidi_kiran@yahoo.com> 02/03/04 9:27 AM >>>
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



