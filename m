From: Allan Parreno <atparreno@yahoo.com>
Subject: STRING agrument
Date: Thu, 25 May 2006 19:17:35 -0700 (PDT)
Message-ID: <20060526021735.81499.qmail@web30213.mail.mud.yahoo.com>
References: <200605260000.56259.max@nucleus.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605260000.56259.max@nucleus.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

Good Day.

Anyone could help me out with this error using the string argument.

[root@ja Desktop]# iptables -o eth0 -A FORWARD -p tcp -m string --string
"X-Kazaa-Username:" -j REJECT --reject-with tcp-reset
iptables v1.3.4: STRING match: You must specify `--algo'
Try `iptables -h' or 'iptables --help' for more information.
[root@ja Desktop]#

However, if I specify the --algo if have this error

[root@ja Desktop]# iptables -o eth0 -A FORWARD -p tcp -m string --string --algo
"X-Kazaa-Username:" -j REJECT --reject-with tcp-reset
Bad argument `X-Kazaa-Username:'
Try `iptables -h' or 'iptables --help' for more information.
[root@ja Desktop]#

Thanks in advance



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

