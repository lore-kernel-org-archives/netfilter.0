From: "IT Clown" <iptables@mailbox.co.za>
Subject: logging
Date: Thu, 01 Apr 2004 07:38:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-273174035@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi

Thanks i googled abit and found something else but its
logging to terminal and to a log file how do i get rid of
the terminal logging? Apparently you have to remove
anything like: /dev/console, "root" or '8' in syslog.conf
and there is nothing like that in it.I added the following
to syslog.conf:

kern.* /var/log/iptables

Regards
__________________________________________________________________________
http://www.webmail.co.za/dialup Webmail ISP - Cool Connection, Cool Price

