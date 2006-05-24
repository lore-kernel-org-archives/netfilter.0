From: "Feris Thia" <feris.tia@gmail.com>
Subject: Blocking HTTP source port from an IP
Date: Wed, 24 May 2006 23:18:25 +0700
Message-ID: <426f2b4c0605240918m79243e89g229547a64132510a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi All,

I'm quite new to iptables and actually.. how it works. I set up
firewall on a server with IP 192.168.0.40/24 (with an Apache web
server running) and then I have a windows client with IP
192.168.0.30/24 and then I try to block HTTP port request from this
client using this command :

iptables -A INPUT -s 192.168.0.30 -p tcp --sport http -j REJECT

but it fails.... then I try this one :

iptables -A INPUT -s 192.168.0.30 -p tcp --dport http -j REJECT

why is it so ?? As my logic say the request come from http port, so I
specify the -p tcp --sport http, but it doesn't work at all :(


-- 
Regards,
Feris

