From: Fu-Tung Cheng <futung.cheng@yahoo.com>
Subject: 2 ips, same port, forward to original ip but different port
Date: Tue, 4 Nov 2008 17:38:13 -0800 (PST)
Message-ID: <54857.29141.qm@web45902.mail.sp1.yahoo.com>
Reply-To: futung.cheng@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Here is my current rule set.  I've tried other combinations of settings but with no more luck than the current rule set.

$IPTABLES -A FORWARD -p tcp --destination-port 80 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -j REDIRECT -p tcp --destination-port
80 --to-ports 12080

Now what I need to happen is that requests coming into ip1:80 goto
ip1:12080 and ip2:80 goto ip2:12080.  What seems to be happening is
that all requests coming into 80 are going to ip1:12080.

Any pointers gladly accepted.

Thank you,

Fu-Tung



      

