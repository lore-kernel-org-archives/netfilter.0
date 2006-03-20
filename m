From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Defining ip range in a rule
Date: Mon, 20 Mar 2006 06:44:57 -0500
Message-ID: <1142855098.2922.2.camel@localhost>
References: <441E907F.4060107@mmcomputer.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <441E907F.4060107@mmcomputer.hu>
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
To: McDouglas <mcdouglas@mmcomputer.hu>
Cc: netfilter@lists.netfilter.org

On Mon, 2006-03-20 at 12:22 +0100, McDouglas wrote:
> Hi,
> 
> I'd like to ask how to define an ip address range in a rule. I don't 
> mean using subnet mask but rather for example making a rule which will 
> block port 110 for the 10.10.2.50-10.10.2.150 ip range.
> 
> Thank you.
The iprange match is in most newer kernels.  If it is missing in yours,
you may need to patch.  You may also need to check to see if it is
included in activated in your kernel.

The man page will have more information but the syntax is:

iptables -A FORWARD -m iprange --[src|dst]-range x.x.x.x-y.y.y.y

Or at least so I recall.  Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


