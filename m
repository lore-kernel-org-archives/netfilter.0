From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ICMP Rule Problem
Date: Tue, 3 Feb 2004 21:50:41 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402040550.i145ocrB027043@server5.bandwidthco.com>
References: <20040203132411.96455.qmail@web14004.mail.yahoo.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040203132411.96455.qmail@web14004.mail.yahoo.com>
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
To: 'Kiran Kumar' <immidi_kiran@yahoo.com>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

The answer lies within RFC 1122 which states "that an ICMP error message
should not be sent as the result of receiving another ICMP error message."
However, An ICMP message can be sent in response to an ICMP query message,
which is what an echo request is, and is the source of the question that
started this thread. 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Kiran Kumar
Sent: Tuesday, February 03, 2004 5:24 AM
To: Netfilter Mailing List
Subject: Re: ICMP Rule Problem

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> Never mind that, you're not allowed to respond to ICMP packets with 
> ICMP errors.
> 
> See RFC792 page 1.

  Wrong. You are not allowed to respond to ICMP _errors_ with ICMP errors,
what else does ping mean by giving error messages like "Destination Host
Unreachable" ?.


=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/



