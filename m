From: Payal Rathod <payal-iptables@staticky.com>
Subject: iptables with real ips
Date: Fri, 15 Aug 2003 20:49:43 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030815151943.GA1513@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,
First excuse for mailing a new question before commenting about previous.
It is that I get 20 mins 2 times a day net access only (dial-up).
I download all mails once and send/comment once.

Fortunately for me, a friend of mine has agreed to let me try Linux and
iptables at his office and hey I get paid $50 for it too :):):)
But their are some contraints which I want you to give opinion about.

- RH Linux 7.2 (default kernel)
- 4 real ips (thru' some router)
- all traffic should pass thru' Linux firewall
- I cannot recompile kernel and change anything other than firewall on
  the box. I will be killed if I crash that box.
- One windows machine has a webserver and ftp server accessible thru'
  outside world. Can I make people from outside access that box but the
  traffic should pass thru' Linux box first and its firewall rules?
  I think that when someone from outside asks about windows http server,
  Linux box should accept it and pass to windows server. But techinically
  I don't know if it possible. What should I be looking at?
- One more windows box with real ip is connecting to a machine in Europe
  thru VPN. This VPN is allowed only for that windows ip. Can I make
  this VPN traffic pass thru' Linux box and still it should appear as
  not originating from the Linux ip but from windows ip to the remote
  server?

These questions may sound stupid but I never have used more than 1 live
ip and that too only 2 times.

Thanks a lot for the time in advance and eagerly waiting for any replies
on this.

With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

