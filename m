From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Getting rid of the masses of ip_conntrack messages
Date: Sun, 1 Dec 2002 21:33:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c29978$f3221ea0$0401000a@robbysan.org>
References: <20021201100429.GB18712@davinci>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021201100429.GB18712@davinci>
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

> So far i googled a bit but just found that someone else had that
> as well, but didn't find an answer :(. Answers are greatly
> appreciated.

Found with google, from :
http://lists.netfilter.org/pipermail/netfilter-devel/2002-March/007320
.html

----
Such message may appear when the FTP client requests a new data
channel without opening the previously requested one.

There is one case, when it happens quite naturally: client sends an
active FTP request, but the server refuses it. Then the client reverts
to passive FTP and repeats the data channel request.

A tcpdump of the FTP command session could help to find out where's
the problem.
----

Did you also find the above explanation ?
It might be the reason you're seeing those messages in your log.


Rob


