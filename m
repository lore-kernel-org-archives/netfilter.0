From: jo@neolabs.be
Subject: ipfilter vs. netfilter keepalive
Date: Sat, 31 Jan 2004 0:49:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401302349.i0UNn7u19236@neo1.neolabs.be>
Reply-To: jo@neolabs.be
Mime-Version: 1.0
Content-Transfer-Encoding: binary
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
To: netfilter@lists.netfilter.org

Hi, 

my company sits on a LAN with private addresses. We have a box that
filters the traffic (Cisco) and another box that does the SNAT. This
second box used to be a Solaris with ipfilter. Three days ago my company
replaced it by a linux machine running netfilter (iptables).

Since then users are complaining about the following phenomenon :

ssh-connections that are left open but unused seem to be cut off after a
certain period of non-activity (users report from 30 min. up to 2 housr). 
They simply have to log in again. This problem never occured with the
ipfilter box.

I guess the remote ssh-server is sending keepalive packets, and somehow
the ipfilter understands that those packets must be passed to the
intranet, eventhough they are OOB to the outgoing TCP connection.
Netfilter does not seem to understand this.

Is this assumption correct? If so, does netfilter have a tuning so it
keep ssh connections alive or do I advise to switch back to ipfilter?

Thanks for any hints.

Jo De Baer

NEOlabs - http://www.neolabs.be - mailto:info@neolabs.be

