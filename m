From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: libipq installation
Date: Wed, 12 Feb 2003 15:52:34 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0302121443100.24966-100000@abodh.pesit.deeproot.co.in>
References: <3E498BB5.1070905@qwest.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E498BB5.1070905@qwest.net>
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
To: Sapient2003 <sapient@qwest.net>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

First of all, how have you installed iptables through deb/rpm or thru
source. If deb/rpm check for the package iptables-devel using dpkg -l/rpm
-q .... If you have installed from the source you should install the
development libraries using ... make install-devel  ... please read the
README file in the source directory.

I think this should solve your problem.

Regards,
Narendra.

-------------------------
Narendra Prabhu. B
DeepRoot Linux
http://www.deeproot.co.in

On Tue, 11 Feb 2003, Sapient2003 wrote:

> I am trying to install the perl module IPTables::IPv4::IPQueue. In doing
> so, I get this error: No library found for -lipq. How do I install the
> IPQ libraries that come with iptables? Right now I am using iptables-1.2.7a.
>
>
>
>



