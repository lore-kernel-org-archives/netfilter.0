From: Daniel Stefanescu <aza1zel@yahoo.com>
Subject: newbie ipchains Q
Date: Wed, 30 Oct 2002 09:06:55 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030170655.98695.qmail@web14202.mail.yahoo.com>
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

Hi,
I'm using:
ipchains -A forward -s 192.168.0.21/255.255.255.255 -j
MASQ
to give access to the internet but i was unable to
block kazza with:
ipchains -A forward -p tcp -s
192.168.0.21/255.255.255.255 -d 0/0 1214 -l -j REJECT

Any suggestions ? Thnx.

__________________________________________________
Do you Yahoo!?
HotJobs - Search new jobs daily now
http://hotjobs.yahoo.com/

