From: "__ Radien__" <radien@zworg.com>
Subject: Re: to use or not to use stateful capabilities
Date: Mon,  5 Apr 2004 03:59:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23450.1081162773@zworg.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

here is just the table and may not be viewed well in my last post:

Conn.State   -s         -d         --proto   -sport  -dport   SYN   ACK

New          out        web_server  tcp       <1024  80       Yes   No
Established  web_server out         tcp       80     <1024    Yes   No
Established  out        web_server  tcp       <1024  80       No    Yes
Established  web_server out         tcp       80     <1024    No    Yes

