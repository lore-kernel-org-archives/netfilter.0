From: "Kotatsu" <naughtydog@virgilio.it>
Subject: Resend TCP segment modified to the sender
Date: Tue, 1 Jun 2004 20:46:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c44808$c1280460$5790b450@bebop>
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

Hi guys,
    I have a problem. I have a client (192.168.9.2) that send TCP segment to
a server (192.168.11.2). Between this PC there is a Linux router that
captures all the segment and do forwarding. I want that it takes a client
packet (the 10th TCP data packet sended, for example), modify it as i want,
and then resend it to the client with ipq_set_verdict.
Is this operation possible? Or netfilter can only send the modified packet
at the server? If it's possible, which field must i modify to do this (i've
tried to modify some flag but it doesn't work)?

Thanks for your help
Best regards


