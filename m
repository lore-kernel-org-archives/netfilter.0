From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Turning on IP Forwarding
Date: Mon, 24 Mar 2003 15:08:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C90@hslex01.hslbz.local>
References: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324130221.39616.qmail@web40201.mail.yahoo.com>
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

> Can anyone tell me which file I need to modify to turn
> on IP Forwarding? I know where to do it while the
> system is on; however, since it's a multi-homed system
> and my router, I would like to have it setup
> correctly...

Do you mean like, on a RedHat machine : 
/etc/sysctl.conf ->
net.ipv4.ip_forward = 1

Or :
echo 1 > /proc/sys/net/ipv4/ip_forward
Which you can put in /etc/rc.d/rc.local or whatever startup file.


Rob


