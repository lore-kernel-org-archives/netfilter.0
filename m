From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Log output going to screen
Date: Wed, 16 Oct 2002 22:52:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021016215230.GVSS17202.mta01-svc.ntlworld.com@there>
References: <B9D38D9C.45F%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B9D38D9C.45F%george@mattandgeorge.com>
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

On Wednesday 16 October 2002 9:41 pm, George Agnelli wrote:

> Does anyone know why my logs are occasionally being dumped to screen as
> well as to the messages file? How can I stop this happening?

What do you mean by "occasionally" ?

Your system should at least be consistent about where it sends its log 
entries.

> iptables -A INPUT  -i eth1 -j LOG

Try adding a "--log-level=info" (or replace info with 3 if you have a version 
of iptables which doesn't like the log names) and make sure you have a 
suitable entry in your /etc/syslog.conf to send 'info' level messages to the 
desired destination, eg:

*.=info	/var/log/messages

Antony

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

