From: netfilter@tommi.org
Subject: Re: Logging Portscans
Date: Mon, 21 Oct 2002 09:52:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021095249.C18796@ok.is>
References: <20021021093912.87487.qmail@web40709.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021021093912.87487.qmail@web40709.mail.yahoo.com>; from natasha3641@yahoo.com on Mon, Oct 21, 2002 at 02:39:12AM -0700
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
To: Tasha Smith <natasha3641@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Mon, Oct 21, 2002 at 02:39:12AM -0700, Tasha Smith wrote:
> 
> iptables -i INPUT -p tcp -j LOG --log-prefix "log-tcp-test: "

iptables -I INPUT -p tcp -j LOG --log-prefix "log-tcp-test: "

It's a CAPITAL -I for insert.

- Tomas Edwardsson
- Unix/Linux Support
- Opin Kerfi

