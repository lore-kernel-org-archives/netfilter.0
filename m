From: Hideaki Nemoto <nemo-h@po.ntts.co.jp>
Subject: setting the skb->priority
Date: Mon, 12 Jul 2004 16:55:15 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040712165408.D2A8.NEMO-H@po.ntts.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi all,

Sorry if this isn't an attequate question for this list.
My name is Hideaki, and I'm a newbie to netfilter, and 
trying to use the CLASSIFY target, with kernel 2.6.

What I want to do is to set the skb->priority to a packet,
other than using the setpriority(SO_PRIORITY).
I wanted to set vlan-qos bit to the packet I'm routing.
And I thought that it might be possible by using vconfig 
if I was able to set the skb->priority to the packet 
I'm routing.

I thought that CLASSIFY target was the one to do this, but
I couldnt understand the usage.
It seems to me that CLASSIFY target just sends a packet to
a specified class, and not set skb->priority field.
If it does, how do I set it ? Since there isnt any parameters
that I can use to specify the skb->priority, I thought I might
be missing something.

Would anyone please give me a clue to it ?

I'm also mailing similar thing to the VLAN Mailing list, so I'm
sorry if anyone saw this twice.
(I'll mail the solution to both of the list when I get one)
And also, I made a mistake and sent this to the 
netfilter-anouncement list. Sorry for that.

Thanks in advance,
Hideaki


