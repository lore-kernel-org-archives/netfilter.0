From: "Oliver Schulze L." <oliver@samera.com.py>
Subject: Default syslog level from -j LOG
Date: Tue, 10 Apr 2007 14:43:33 -0400
Message-ID: <461BDAD5.8020208@samera.com.py>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I'm trying to get all the iptables log messages out of /var/log/messages
in a Centos 4.4 server.

I tryied using this config in iptables and syslog and it still gets into 
/var/log/messages

# iptables -j LOG --log-level crit

in /etc/syslog.conf
------------------------------------------
kern.crit            /var/log/critical
kern.none;....       /var/log/messages
# have no other call to kern o crit in syslog.conf
------------------------------------------

Any help is welcomed

Thanks
Oliver

-- 
Oliver Schulze L.   | Get my e-mail after a captcha in:
Asuncion - Paraguay | http://tinymailto.com/oliver 


