From: blah blah <filt5447@yahoo.com>
Subject: Trouble with --dport
Date: Mon, 21 Oct 2002 13:12:54 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021201254.35389.qmail@web10908.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am having trouble with the following lines:

-A INPUT -i eth0 -p tcp -s 1.1.1.1 --dport 1234 -j
ACCEPT
-A INPUT -i eth0 -p tcp -s 1.1.1.2 --dport 1233 -j
ACCEPT

I get an error message about --dport being an unknown
arg.  If I use either of the 2 lines without the other
they work fine.  It always errors on the second line. 
I can reverse the order and whichever is the second
line will be flagged.  I am using ver 1.2.5 which came
with redhat 7.3.

It looks to me like it is not loading the tcp
extensions for the second rule despite the "-p tcp"
being present.

Any help is appreciated.  Thanks.

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

