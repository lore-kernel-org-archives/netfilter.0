From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: RE: IPs blocked still able to connect
Date: Sat, 12 Jun 2004 13:46:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406122045.i5CKjrnI008476@ylpvm01.prodigy.net>
References: <200406122138.45223.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406122138.45223.Antony@Soft-Solutions.co.uk>
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


Can you show us the headers of such an email, showing that the server which 
directly sent it to you is in that address range?

-I will have to wait until I get the next one rather then trying to find it
in my logged spam folder

Try adding a LOG rule immediately after the above DROP rule:

iptables -A INPUT -s 222.0.0.0/8 -j LOG

-Will do for the next occurrence

After you get some more spam, try "iptables -L INPUT -nvx" and see what the 
packet & byte counts are for the two rules.

What are your other rules (output of "iptables -L -nvx")?

-Lists all allowed and dropped rules. I can put it up here but it's long

Thanks!!


