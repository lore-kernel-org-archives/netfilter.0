From: "Jee J.Z." <jz105@york.ac.uk>
Subject: stop at ipq_read(h,buf,BUFFERSIZE,0)
Date: Mon, 1 Dec 2003 23:15:23 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3b860$ff1a9810$68892090@grouse>
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
Cc: Eric Leblond <eric@regit.org>

Hi all,

I try to run the example code on libipq man page. Unfortunately, the program
stops at

status = ipq_read(h,buf,BUFFERSIZE,0);

It seems the program is waiting for packets input into the buffer, but
packets never go in. Can anybody help me? Thank you in advance!

Jee


