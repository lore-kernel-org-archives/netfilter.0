From: "Jambunathan Jambunathan" <kjambunathan@novell.com>
Subject: iptc_* implementation queries
Date: Mon, 02 Feb 2004 14:28:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <s01e5eb1.078@prv-mail25.provo.novell.com>
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

I am interested in knowing the netfilter infrastructure and I would
like to know how iptables communicates with netfilter ( user to
kernel space communication ) I understand that it happens through
raw sockets through setsockot and getsockopt. Also there are a
good number of iptc_* calls that are declared in libiptc.h which
are used by the iptables user space tool. I would like to know 
where I can see the implementations for these iptc_* calls. 
I am unable to see this either in the kernel code nor in the
iptables bz2 package. I am looking at 2.4.18 code of linux
kernel fyi.

I will appreciate a mini code walk through or example.


Regards,
Jambunathan K.

