From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: Iptables Queuing Problem
Date: Fri, 31 Jan 2003 15:10:29 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0301311503330.287-100000@abodh.pesit.deeproot.co.in>
References: <20030130071453.54533.qmail@web8206.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030130071453.54533.qmail@web8206.mail.in.yahoo.com>
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
To: =?iso-8859-1?q?pooja?= <pooja2909@yahoo.co.in>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


Hello ...

Are you using the QUEUE target? If so, where are you using it?
This list could help you better, if you could post the code.

Are you using libipq?

Regards,
Narendra.

-------------------------
Narendra Prabhu. B
DeepRoot Linux
http://www.deeproot.co.in

On Thu, 30 Jan 2003, [iso-8859-1] pooja wrote:
> Hi!!
>
> I am using iptables queuing concept to get the packets
> for my application.The applicaction is just doing
> simple dynamic nat if reqd..I change the dest ip in
> prerouting hook if reqd and the src ip i postrouting
> hook...This is working fine for first few pkts after i
> start my application..But after that i am getting
> segmentation fault...What is happening is one pkt
> after passing through and accepted by prerouting hook
> disappears..it gets lost..neither it enters FORWARD
> hook nor postrouting hook..and the next pkt gives me
> the SEGMENTATION FAULT ERROR ..
>
> CAn somebody tell me why is this happening????
>
> Thanx in advance,
> Pooja



